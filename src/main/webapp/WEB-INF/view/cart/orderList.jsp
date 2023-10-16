<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
<style>

	.formDiv{
		margin: 80px auto;
	}
	table {
		text-align: center;
		border: 2px solid #e1e1e1;
		padding: 30px 40px;
		box-sizing: border-box;
		border-radius: 15px;
	}
	th{
		border-bottom: 1px solid;
	}
	/* th, td{
		text-align: center;
		border: 2px solid #909090;
		border-collapse : collapse;
		border-radius: 3px;
	} */
	#order {
		width: 250px;
		height: 50px;
		border: 2px solid #6D3114;
		background-color: rgba(0, 0, 0, 0);
		color: #6D3114;
		padding: 3px;
		border-radius: 8px;
		font-size: 20px;
	}
	#order:hover {
		background-color: #6D3114;
		color: white;
	}
</style>
<script>
window.onload=function(){
	if (${success } == "1") {
		alert("주문이 완료되었습니다");
		location.href="main.jsp";
	};
};
</script>
</head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script>
 
        var IMP = window.IMP; 
        IMP.init("imp60183288"); 
      
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
        
		
        function requestPay(frm) {
        	var check1 = document.getElementById("check1");
        	var check2 = document.getElementById("check2");
        	var check3 = document.getElementById("check3");
        	
        	if (check1.checked == false){
        		alert("[필수]개인정보 수집 및 이용 동의 해주세요");
        		return;
        	}
        	if (check2.checked == false){
        		alert("[필수]개인정보 제 3자 제공 동의 해주세요");
        		return;
        	}
        	if (check3.checked == false){
        		alert("[필수]전자결제대행 이용 동의 해주세요");
        		return;
        	}
        	
        	let price = frm.orderprice.value;
        	
        	if (frm.couponName.value == "coupon1") {
        		price = price - 3000;
        		if (price <= 0) {
        			price = 0;
        		}
        	} else if (frm.couponName.value == "coupon2") {
        		price = price - (price / 10);
        	}
        	if (frm.payment.value == "kakaopay") {
        		IMP.request_pay({
                    pg : 'kakaopay',
                    pay_method : 'card',
                    merchant_uid: "IMP"+makeMerchantUid, 
                    name : '당근 10kg',
                    amount : price,
                    buyer_email : 'helpcustomer@huiloaelag.co.kr',
                    buyer_name : '(주)희로애락',
                    buyer_tel : '1588-8282',
                    buyer_addr : '서울특별시 강남구 학동로 426',
                    buyer_postcode : '123-456'
                }, function (rsp) { // callback
                    if (rsp.success) {
                        console.log(rsp);
                        frm.submit();
                    } else {
                        console.log(rsp);
                    }
                });
        	} else if (frm.payment.value == "cash") {
        		IMP.request_pay({
        		    pg : 'html5_inicis',
        		    pay_method : 'card',
        		    merchant_uid : 'merchant_' + makeMerchantUid,
        		    name : '주문명:결제테스트',
        		    amount : price,
        		    buyer_email : 'helpcustomer@huiloaelag.co.kr',
                    buyer_name : '(주)희로애락',
                    buyer_tel : '1588-8282',
                    buyer_addr : '서울특별시 강남구 학동로 426',
                    buyer_postcode : '123-456'
        		}, function(rsp) {
        		    if ( rsp.success ) {
        		        var msg = '결제가 완료되었습니다.';
        		        msg += '고유ID : ' + rsp.imp_uid;
        		        msg += '상점 거래ID : ' + rsp.merchant_uid;
        		        msg += '결제 금액 : ' + rsp.paid_amount;
        		        msg += '카드 승인번호 : ' + rsp.apply_num;
        		        frm.submit();
        		    } else {
        		        var msg = '결제에 실패하였습니다.';
        		        msg += '에러내용 : ' + rsp.error_msg;
        		    }

        		    alert(msg);
        		});
        	}
            
        }

    </script>
<body>
<div class="formDiv" align="center">
		<c:set var="userList" value="${userList }"></c:set>
		<h1 style="color: #6D3114;">Order/Payment</h1><br>
		<hr width="700px"><br>
		<form action="payment.do" method="post">
			<h3> 배송 정보 </h3>
			<table>
				<tr height="30px">
					<td width="200px">이름/연락처</td>
					<td width="300px">${userList[0].uname }/${userList[0].uphone }</td>
				</tr>
				<tr height="30px">
					<td>주소</td>
					<%-- <td>${userList[0].ugender }</td> --%>
					<td>${userList[0].uaddr }</td>
				</tr>
			</table><br><br>
			
			<c:set var="result" value="${result }"></c:set>
			<c:if test="${result == 'order'}">
			<h3> 상품 정보 </h3>
			<table>
				<tr height="30px">
					<th width="300px">상품 정보</th>
					<th width="50px">수량</th>
					<th width="100px">배송비</th>
					<th width="100px">주문금액</th>
				</tr>
				<c:forEach var="orderList" items="${orderList }">
				<c:set var="orderPrice" value="${orderPrice + orderList.cPrice }" />
				<tr height="30px">
					<td>${orderList.pName }</td>
					<td>${orderList.cCnt }</td>
					<td>3000원</td>
					<td>${orderList.cPrice }원</td>
				</tr>
				</c:forEach>
			</table>
			<p style="font-size: 12px;">· 해외 배송 상품이나 일부 업체의 경우, 교환/환불 시 반송료가 다를 수 있으며 상품 페이지에 별도 표기되어 있습니다.<br>
			   · 2개 이상의 브랜드(업체) 상품을 주문하신 경우, 각 개별 배송됩니다.</p><br><br>
			<h3> 쿠폰/할인 </h3>
			<table>
				<tr height="30px">
					<td>상품 금액</td>
					<td>${orderPrice+3000 }원</td>
				</tr>
				<tr height="30px">
					<td width="150px"><label for="coupon">쿠폰 할인</label></td>
					<td width="150px"><select name="couponName" id="coupon">
							<option value="">쿠폰 선택</option>
							<option value="coupon1">배송비 무료</option>
							<option value="coupon2">할인 쿠폰</option>
						</select>
					</td>
				</tr>
				<tr>
			</table><br><br>
			<h3> 결제 정보 </h3>
			<table>
				<tr height="30px">
					<td width="100px">결제 수단</td>
					<td width="300px">
						<label>카카오페이<input type="radio" name="payment" value="kakaopay" checked></label>&nbsp;&nbsp;&nbsp;
						<label>무통장입금<input type="radio" name="payment" value="cash"></label>
					</td>
				</tr>
			</table>
			<p style="font-size: 12px;">· 주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수 있습니다.</p><br><br>
			<table>
				<tr height="30px">
					<td width="150px">품절 시 환불 안내</td>
					<td width="500px" height="150px">
						<p style="font-weight: bold;">결제하신 수단으로 취소됩니다.</p>
						<p style="font-size: 12px;">· 입점업체 배송은 낮은 확률로 상품이 품절일 가능성이 있습니다. 이에 품절 시 빠르게 환불 처리해드립니다.<br>
						   · 현금 환불의 경우, 예금정보가 일치해야 환불 처리가 가능합니다. 은행명, 계좌번호, 예금주명을 정확히 기재 부탁드립니다.<br>
						   · 환불 받으신 날짜 기준으로 3~5일(주말 제외) 후 결제대행사에서 직접 고객님의 계좌로 환불 처리됩니다.</p>
					</td>
				</tr>
				<tr height="30px">
					<td>주문자 동의</td>
					<td height="90px">
						<input type="checkbox" id="check1"><font style="font-size: 12px;">[필수] 개인정보 수집 및 이용 동의</font><br>
						<input type="checkbox" id="check2"><font style="font-size: 12px;">[필수] 개인정보 제 3자 제공 동의</font><br>
						<input type="checkbox" id="check3"><font style="font-size: 12px;">[필수] 전자결제대행 이용 동의</font>
					</td>
				</tr>
			</table><br><br>
			<br>
			<!-- <font size="5px">총 30000원</font>&nbsp; -->
			<input type="button" id="order" name="order" onclick="requestPay(this.form)" value="${orderPrice + 3000 }원 주문하기">
			<input type="hidden" name="orderprice" value="${orderPrice + 3000 }">
			</c:if>
			
			<c:if test="${result == 'credit'}">
			<h3> 상품 정보 </h3>
			<table>
				<tr height="30px">
					<th width="350px">상품 정보</th>
					<th width="50px">수량</th>
					<th width="50px">배송비</th>
					<th width="60px">주문금액</th>
				</tr>
				<c:forEach var="orderList" items="${orderList }">
				<c:set var="orderPrice" value="${orderPrice + orderList.pprice * orderList.cCnt + 3000 }" />
				<tr height="30px">
					<td>${orderList.pname }</td>
					<td>${orderList.cCnt }</td>
					<td>3000원</td>
					<td>${orderList.pprice * orderList.cCnt }원</td>
				</tr>
				</c:forEach>
			</table>
			<p style="font-size: 12px;">· 해외 배송 상품이나 일부 업체의 경우, 교환/환불 시 반송료가 다를 수 있으며 상품 페이지에 별도 표기되어 있습니다.<br>
			   · 2개 이상의 브랜드(업체) 상품을 주문하신 경우, 각 개별 배송됩니다.</p><br><br>
			<h3> 쿠폰/할인 </h3>
			<table>
				<tr height="30px">
					<td>상품 금액</td>
					<td>${orderPrice }원</td>
				</tr>
				<tr height="30px">
					<td width="100px"><label for="coupon">쿠폰 할인</label></td>
					<td width="100px"><select name="couponName" id="coupon">
							<option value="">쿠폰 선택</option>
							<option value="coupon1">배송비 무료</option>
							<option value="coupon2">할인 쿠폰</option>
						</select>
					</td>
				</tr>
				<tr>
			</table><br><br>
			<h3> 결제 정보 </h3>
			<table>
				<tr height="30px">
					<td width="100px">결제 수단</td>
					<td width="300px">
						<label>카카오페이<input type="radio" name="payment" value="kakaopay" checked></label>&nbsp;&nbsp;&nbsp;
						<label>무통장입금<input type="radio" name="payment" value="cash"></label>
					</td>
				</tr>
			</table>
			<p style="font-size: 12px;">· 주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수 있습니다.</p><br><br>
			
			<table>
				<tr height="30px">
					<td width="150px">품절 시 환불 안내</td>
					<td width="500px" height="150px">
						<p style="font-weight: bold;">결제하신 수단으로 취소됩니다.</p>
						<p style="font-size: 12px;">· 입점업체 배송은 낮은 확률로 상품이 품절일 가능성이 있습니다. 이에 품절 시 빠르게 환불 처리해드립니다.<br>
						   · 현금 환불의 경우, 예금정보가 일치해야 환불 처리가 가능합니다. 은행명, 계좌번호, 예금주명을 정확히 기재 부탁드립니다.<br>
						   · 환불 받으신 날짜 기준으로 3~5일(주말 제외) 후 결제대행사에서 직접 고객님의 계좌로 환불 처리됩니다.</p>
					</td>
				</tr>
				<tr height="30px">
					<td>주문자 동의</td>
					<td height="90px">
						<input type="checkbox" id="check1" value="1"><font style="font-size: 12px;">[필수] 개인정보 수집 및 이용 동의</font><br>
						<input type="checkbox" id="check2" value="2"><font style="font-size: 12px;">[필수] 개인정보 제 3자 제공 동의</font><br>
						<input type="checkbox" id="check3" value="3"><font style="font-size: 12px;">[필수] 전자결제대행 이용 동의</font>
					</td>
				</tr>
			</table><br><br>
			<br>
			<!-- <font size="5px">총 30000원</font>&nbsp; -->
			<input type="button" id="order" name="order" onclick="requestPay(this.form)" value="${orderPrice }원 주문하기">
			<input type="hidden" name="orderprice" value="${orderPrice }">
			</c:if>
		</form>
	</div>
</body>
</html>
<%@include file ="../common/footer.jsp" %>