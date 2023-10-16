<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="./resources/css/common.css">
<style>
	#container {
		margin-top: 40px;
		margin-bottom: 50px;
	}
	h1 {
		color: #6D3114;
		font-weight: bold;
	}
	table {
		text-align: center;
	}
	tbody th {
		text-align: center;
		padding: 10px;
		padding-right: 40px;
		padding-top: 20px;
		padding-bottom: 20px;
		border-top: 2px solid black;
		border-bottom: 2px solid black;
	}
	tbody td {
		padding: 10px;
		padding-right: 40px;
	}
	table tbody td {
		border-bottom: 1px solid #E2E2E2;
	}
	table tfoot td {
		padding-bottom: 20px;
		padding-right: 50px;
	}
	#deleteSelectBtn {
		float: left;
		width: 120px;
		height: 40px;
		border: none;
		border-radius: 10px;
		margin-bottom: 20px;
		margin-right: 15px;
	}
	#deleteSelectBtn:hover {
		background-color: #6D3114;
		color: white;
	}
	#deletePro {
		width: 100px;
		height: 35px;
		border: none;
		border-radius: 10px;
	}
	#deletePro:hover {
		background-color: #6D3114;
		color: white;
	}
	#minusBtn, #plusBtn {
		border: none;
		border-radius: 10px;
		width: 22px;
		height: 35px;
		font-size: large;
	}
	#minusBtn:hover, #plusBtn:hover {
		background-color: #6D3114;
		color: white;
	}
	.textRight {
		text-align: right;
	}
	#cCnt {
		width: 60px;
		height: 25px;
		text-align: center;
	}
	#orderBtn {
		width: 180px;
		height: 50px;
		border: none;
		border-radius: 10px;
		margin-bottom: 20px;
		margin-right: 15px;
		font-size: large;
	}
	#orderBtn:hover {
		background-color: #6D3114;
		color: white;
	}
	#orderCnt {
		padding-top: 20px;
		font-size: 1.2em;
	}
	th {
		font-size: 20px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	function deletePoduct(cCode) {
		location.href = "deleteCart.do?cCode=" + cCode + "&uCode=" + ${uCode};
	}
	
	function deleteAll() {
		location.href = "deleteCartAll.do";
	}
	
	function minus(cCode, cCnt) {
		if (cCnt < 2) {
			$("#minus").attr("disabled", true);
		} 
		if (cCnt > 1 || cCnt == 0) {
			$("#minus").attr("disabled", false);
		}
		if (cCnt <= 10) {
			$("#plus").attr("disabled", false);
		}
		if (cCnt > 1) {
			$.ajax("minusCartCnt.do", {
				type: "post", 
				data: {cCode:cCode},
				success: function(respData){
					location.reload();
				},
				error: function(){
					alert("실패~~~");
				}
			});
	    }
	} 
	
	function plus(cCode, cCnt) {
		$("#minus").attr("disabled", false);
		
		if (cCnt >= 10) {
			$("#plus").attr("disabled", true);
		} else {
			$.ajax("plusCartCnt.do", {
				type: "post", 
				data: {cCode:cCode},
				success: function(respData){
					location.reload();
				},
				error: function(){
					alert("실패~~~");
				}
			});
		}
	}  
	
	function deleteSelect() {
		var arr = new Array();
		var list = $("input[name='chkProduct']");
		for (let i = 0; i < list.length; i++) {
	    	if (list[i].checked) {
		      	arr.push(list[i].value);
	      	}
		}
		console.log(arr);
		if (arr.length == 0) {
			alert("선택된 상품이 없습니다.");
		} else {
			$.ajax("deleteCartList.do?uCode=" + <%=session.getAttribute("uCode") %>, {
				type: "post", 
				traditional : true,
				data: {
					arr : arr
				},
				success: function(respData){
					location.href = "getCartList.do?uCode=" + <%=session.getAttribute("uCode") %>;
				},
				error: function(){
					alert("실패~~~");
				}
			});
		}
	}
	
	$(document).ready(function() {
		$("#chkAll").click(function() {
			if($("#chkAll").is(":checked")) $("input[name=chkProduct]").prop("checked", true);
			else $("input[name=chkProduct]").prop("checked", false);
		});
		
		$("input[name=chkProduct]").click(function() {
			var total = $("input[name=chkProduct]").length;
			var checked = $("input[name=chkProduct]:checked").length;
			
			if(total != checked) $("#chkAll").prop("checked", false);
			else $("#chkAll").prop("checked", true); 
		});
	});
	    
</script>
</head>
<body>
<jsp:include page="../common/header.jsp" />

<div id="container" align="center">
	<h1 style="font-size: 50px;">Cart</h1>
	<br>

		<c:if test="${!empty cartList}">
		<form action="order.do" method="post">
			<table>
				<thead>
					<tr>
						<th colspan="6">
							<input type="button" id="deleteSelectBtn" value="선택 삭제" onclick="deleteSelect()">
							<input type="button" id="deleteSelectBtn" value="전체 삭제" onclick="deleteAll()">
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th width="80px"><input type="checkbox" id="chkAll" checked></th>
						<th colspan="2">상품</th>
						<th width="100px">가격</th>
						<th width="130px">개수</th>
						<th>삭제</th>
					</tr>
					<c:forEach var="cart" items="${cartList }">
					<c:set var="totalCnt" value="${totalCnt + cart.cCnt}" />
					<c:set var="orderPrice" value="${orderPrice + cart.cPrice }" />
					<tr>
						<td>
							<input type="checkbox" name="chkProduct" class="chkPro" value="${cart.cCode }" checked>
						</td>
						<td><img src="./resources/img/alcohol/${cart.pCtyimg }" width="100px" height="150px"></td>
						<td>${cart.pName }</td>
						<td>${cart.pPrice } 원</td>
						<td>
						<input type="button" id="minusBtn" value="-" onclick="minus('${cart.cCode}', '${cart.cCnt}')">
						&nbsp;<input type="text" value="${cart.cCnt }" id="cCnt" disabled>&nbsp; 
						<input type="button" id="plusBtn" value="+" onclick="plus('${cart.cCode}', '${cart.cCnt}')">
						</td>
						<td><input type="button" id="deletePro" value="상품 삭제" onclick="deletePoduct('${cart.cCode}')"></td>
					</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="6" class="textRight" id="orderCnt"><b>결제할 상품</b>&nbsp;&nbsp; 총 <span>${totalCnt }</span> 개</td>
					</tr>
					<tr>
						<td colspan="5" class="textRight"><h2>총 주문금액</h2></td>
						<td colspan="1" class="textRight"><h2><span style="color: #6D3114;">${orderPrice }</span> 원</h2>
							<input type="hidden" id="orderPrice" value="${orderPrice }">
							<input type="hidden" id="uCode" value="${uCode }">
						</td>
					</tr>
					<tr>
						<td colspan="6" class="textRight">
							<input type="submit" id="orderBtn" value="주문하기">
						</td>
					</tr>
				</tfoot>
			</table>
			</form>
		</c:if>
		<c:if test="${empty cartList }">
			<table>
				<thead>
					<tr>
						<th><h2>장바구니에 담긴 상품이 존재하지 않습니다.</h2></th>
					</tr>
				</thead>
			</table>
		</c:if>
</div>

<jsp:include page="../common/footer.jsp" />
</body>
</html>