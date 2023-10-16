<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String pname = request.getParameter("pname");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>희로애락:: <%=pname %></title>
 <!-- bootstrap -->
 <script
   src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
   integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
   crossorigin="anonymous"
 ></script>
 <script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
   integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
   crossorigin="anonymous"
 ></script>
 <script
   src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
   integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
   crossorigin="anonymous"
 ></script>
 <link
   rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
   />
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- css -->
<link rel="stylesheet" href="resources/css/detail.css" />
</head>
<body>
	<%@include file ="../common/header.jsp" %>
	<div class="ContentWrapper">
		<c:forEach var="detail" items="${detail}">
			<div class="basicDetail">
				<div class="pdtPhotoWrap">
					<div class="pdtPhotoContent">
						<div class="pdtPhotoBox">
							<img class="pdtImg"
								src="resources/alcohol_img/alcohol/${detail.pimg }"
								width="510px" height="510px" alt="대표이미지" />
						</div>
					</div>
				</div>
				<div class="pdtInfoWrap">
					<form method="POST">
						<fieldset class="pdtInfo">
							<div class="pdtMainInfo">
								<div class="sector productNameContent">
									<h3 class="productName">${detail.pname }</h3>
								</div>
								<div class="sector productExplain">
									<div class="rating">
										<div class="MulRating-readOnly" role="reviewAvgImg"> 
											<img class="MulRating-icon" src="resources/img/star.png">
										</div> 
										<div class="score">${reviewAVG }</div>
										<span class="reviewCnt">
											<strong>[${reviewCount } 리뷰]</strong>
										</span>
									</div>
								</div>
								<div class="sector productMoreDetail">
									<div class="flex">
										<span class="product_category">${detail.pinfo }</span>
									</div>
								</div>
								<div class="sector productPriceContent">
									<div class="pdtOriginPriceContent">
										<strong class="priceBox"> 
										<span class="originPrice" style="margin: 0 0" >
												<fmt:formatNumber type="number" value="${detail.pprice }"
													maxFractionDigits="3" />
										</span> <span class="won">원</span>
										</strong>
									</div>
								</div>
								<div class="sector deliverOptionContent"
									style="margin-top: 64px">
									<div class="option_delivery">
										<span class="dvOption">택배배송</span> <span class="dvOption">
											무료배송 </span> <span class="dvOptionCj"> CJ대한통운 </span>
									</div>
								</div>
								<div class="sector quantityContent">
									<div class="quantity-wrapper count">
										<div class="minus">
											<img src="resources/img/icon_minus_counter_inactive.png"
												alt="-" />
										</div>
										<input id="cCnt" type="number" pattern="\d*" maxlength="2" name="cCnt"
											value="${detail.cCnt }" readonly="readonly"
											style="height: 100%; margin: 0px 63px; font-size: 16px; line-height: 16px; text-align: center; border-top: none; border-bottom: none; border-image: initial; border-left: 1px solid rgb(224, 224, 224); border-right: 1px solid rgb(224, 224, 224); background-image: none; background-color: transparent; box-shadow: none;" />
										<div class="plus">
											<img src="resources/img/icon_plus_counter.png" alt="+" />
										</div>
									</div>
								</div>
								<div class="sector pdtTotalPriceContent tpwTxt"
									style="margin-top: 47px">
									<strong class="totalPriceTitle">총 상품 금액</strong>
									<div class="totalPrice-box">
										<strong class="totalPrice"> 
											<span id="opprice" style="margin: 0 0">
												${detail.opprice }
											</span> 
											원
										<input type="hidden" id="price" value="${detail.pprice }"> 
										</strong>
									</div>
								</div>
								<div class="sector dcdBtnContent">
									<div class="dcdBtnBox">
										<div class="dcdBuy">
										<!-- credit.do?pCode=${detail.pcode }&cCnt=" -->
											<a href="javascript:orderOne('${detail.pcode }',cCnt.value)" role="button"
												class="dcdBtn dcdBuyBtn"> 바로구매 <span class="blind"></span>
											</a>
										</div>
										<div class="dcdCart">
											<input type="button" class="dcdBtn dcdCartBtn"
												onclick="javascript:cartList('${detail.pcode}', cCnt.value)" value="장바구니" /> 
										</div>
									</div>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
			<div class="moreDetail">
				<!-- nav 카테고리  -->
				<nav class="navbar navbar-inverse" data-spy="affix"
					data-offset-top="608">
					<div class="container-fluid">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target="#myNavbar">
								<span class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
						<div>
							<div id="myNavbar">
								<ul class="nav navbar-nav">
									<li><a href="#detail01">상세정보</a></li>
									<li><a href="#detail02">리뷰</a></li>
									<li><a href="#detail03">반품/교환정보</a></li>
								</ul>
							</div>
						</div>
					</div>
				</nav>
				<!-- 상세정보, 리뷰, 배송/환불 -->
				<div id="detail01" class="INTRODUCE">
					<div class="intro_Content">
						<div class="intro_WarningContainer">
							<div class="intro_WarningContent">
								<div class="intro_Warning">
									<i class="fa-solid fa-triangle-exclamation"
										style="padding-top: 2px; color: #d81313; width: 16px; height: 16px;"></i>
									<strong class="introTxt"> 직거래 유도 주의 안내 </strong> <br /> 상품문의
									등을 활용하여 <span class="introTxt2">현금결제를 유도하는 경우 사기의 가능성이
										있으니 절대 결제하지 마시고</span> <a href="#" class="introTxt3" target="_blank">희로애락
										고객센터로 문의 주시기 바랍니다.</a>
								</div>
							</div>
						</div>
						<div class="detail-content-wrapper detail-wrap">
							<div class="prd-detail-wrap">
								<div class="prd-component">
									<div class="prd-component-content">
										<div class="prd-module-img" id="detail01">
											<a class="prd-module-img-link"> <img
												src="resources/alcohol_img/alcohol/${detail.pdetailimg }"
												alt="detail" class="prd-img-resource" />
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 상품 후기 -->
				<div id="detail02" class="REVIEW">
					<div class="review">
						<h3 class="reviewTitle">상품 리뷰</h3>
						<div class="rvTitleTip">상품을 구매하신 분들이 작성하신 리뷰입니다. 상품과 무관한
							사진/동영상을 첨부한 리뷰는 통보없이 삭제됩니다.</div>
						<div class="reviewList">
							<c:forEach var="review" items="${reviewList }">
								<form class="reviewCard" action="getReviewList.do" method="get">
									<input type="hidden" value="${pCode}">
									<div class="rvUser">
										닉네임 &nbsp;
										<c:choose>
											<c:when test="${review.rStar == '5'}">
                        ★★★★★
                      </c:when>
											<c:when test="${review.rStar == '4'}">
                        ★★★★
                      </c:when>
											<c:when test="${review.rStar == '3'}">
                        ★★★
                      </c:when>
											<c:when test="${review.rStar == '2'}">
                        ★★
                      </c:when>
											<c:when test="${review.rStar == '1'}">
                        ★
                      </c:when>
											<c:otherwise>
                        별점 없음
                      </c:otherwise>
										</c:choose>
									</div>
									<div class="rv-box">
										<p class="rvTitle">${review.rTitle }</p>
										<p class="rvContent">${review.rContent }</p>
									</div>
								</form>
							</c:forEach>
							<div class="rv-box">
								<c:if test="${empty reviewList }">
									<tr>
										<td colspan="5">작성된 리뷰가 없습니다</td>
									</tr>
								</c:if>
							</div>
							<br>
						</div>
					</div>
				</div>
				<!-- 배송/교환/환불 -->
				<div id="detail03" class="RETURNPOLICY">
					<div class="return">
						<h3 class="rtnTitle">배송/반품/교환정보</h3>
						<div class="rtnSorting">
							<strong class="sortTitle"> 시효 / 교환 / 반품 안내 </strong>
							<p class="sortText">반품 시 먼저 판매자와 연락하셔서 반품사유, 택배사, 배송비, 반품지 주소
								등을 협의하신 후 반품상품을 발송해 주시기 바랍니다.</p>
						</div>
						<table cellspacing="0" class="rtnTable">
							<colgroup>
								<col width="160" />
								<col width="412" />
								<col width="160" />
								<col />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="rtnTh">판매자 지정택배사</th>
									<td colspan="3" class="rtnTd">CJ대한통운</td>
								</tr>
								<tr>
									<th scope="row" class="rtnTh">반품배송비</th>
									<td class="rtnTd">편도 2,500원 (최초 배송비 무료인 경우 5,000원 부과)</td>
									<th scope="row" class="rtnTh">교환배송비</th>
									<td class="rtnTd">5,000원</td>
								</tr>
								<tr>
									<th scope="row" class="rtnTh">보내실 곳</th>
									<td colspan="3" class="rtnTd">서울특별시 강남구 학동로 426
										강남구청(우:06090)</td>
								</tr>
								<tr>
									<th scope="row" rowspan="2" class="rtnTh">반품/교환 사유에 따른 요청
										가능 기간</th>
									<td colspan="3" class="rtnTd">구매자 단순 변심은 상품 수령 후 7일 이내 <span
										style="color: #8f8f8f">(구매자 반품배송비 부담)</span>
									</td>
								</tr>
								<tr>
									<td colspan="3" class="rtnTd">표시/광고와 상이, 계약 내용과 다르게 이행된 경우
										상품 수령 후 3개월 이내 혹은 표시/광고와 다른 사실을 안 날로부터 30일 이내 / <span
										style="color: #8f8f8f">(판매자 반품 배송비 부담)</span> <br /> 둘 중 하나
										경과 시 반품/교환 불가
									</td>
								</tr>
								<tr>
									<th scope="row" rowspan="7" class="rtnTh">반품/교환 불가능 사유</th>
									<td colspan="3" class="rtnTd">
										<ul class="rtnTd_ul">
											<li class="rtnTd_li"><span
												style="margin-left: 3px; font-weight: bold">1.</span>
												반품요청기간이 지난 경우 <span style="color: #8f8f8f">(배송완료 후
													7일이 지나 자동으로 수령확인 처리가 되거나, 상품을 확인하고 직접 수령확인하신 이후)</span></li>
											<li class="rtnTd_li"><span
												style="margin-left: 3px; font-weight: bold">2.</span> 구매자의
												책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우 <span style="color: #8f8f8f">(단,
													상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외)</span></li>
											<li class="rtnTd_li"><span
												style="margin-left: 3px; font-weight: bold">3.</span> 구매자의
												책임있는 사유로 포장이 훼손되어 상품 가치가 현저히 상실된 경우</li>
											<li class="rtnTd_li"><span
												style="margin-left: 3px; font-weight: bold">4.</span> 사전
												연락없이 임의 반송된 경우</li>
											<li class="rtnTd_li"><span
												style="margin-left: 3px; font-weight: bold">5.</span> 단순 변심에
												의한 경우</li>
											<li class="rtnTd_li"><span
												style="margin-left: 3px; font-weight: bold">6.</span>주소의
												오기재, 잘못된 주문, 주소 불명, 수취인 부재의 경우</li>
											<li class="rtnTd_li"><span
												style="margin-left: 3px; font-weight: bold">7.</span>잘못된
												방법으로 보관하거나 고객님의 부주의로 인한 오염, 파손, 변질된 제품</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<%@ include file="../common/footer.jsp"%>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>
		$(document).ready(
						function() {

							$(".plus").click(
											function() {
												$(".minus").attr("disabled", false);
 											      var tot = document.getElementById('price').value;
 											      
											      var cCnt = $('#cCnt').val().trim();
											      if (cCnt >= 10) {
											         $(".plus").attr("disabled", true);
											         document.querySelector(
																".plus img",
																".plus").style.cursor = "default";
											      } else {
											         cCnt = parseInt(cCnt) + 1;
											         $(".minus img")
														.attr("src",
																"resources/img/icon_minus_counter.png");
											      }
											      document.getElementById('cCnt').value = cCnt;
											      tot = tot * cCnt;
											      $("#opprice").text(tot);
												
											});


							$(".minus")
									.click(
											function() {
												$(".plus").attr("disabled", false);
											      var tot = document.getElementById('price').value;
											      
											      var cCnt = $('#cCnt').val().trim();
											      if (cCnt < 3) {
											          $(".minus").attr("disabled", true);
											          document.querySelector(
																".minus img",
																".minus").style.cursor = "default";
											          $(".minus img")
														.attr("src",
																"resources/img/icon_minus_counter_inactive.png");
											       }
											       if (cCnt >= 2 ) {
											          $(".minus").attr("disabled", false);
											          document.querySelector(
																".minus img",
																".minus").style.cursor = "pointer";
											       }
											       if (cCnt > 1) {
											    	   cCnt = parseInt(cCnt) - 1;
											    	   document.querySelector(
																".minus img",
																".minus").style.cursor = "pointer";
											        }
											       document.getElementById('cCnt').value = cCnt;
											       tot = tot * cCnt;
											       $("#opprice").text(tot);
											});


						});
		
			 				function cartList(pcode, cCnt) {
			 					let ucode = <%=session.getAttribute("ucode") %>;
			 					
								if(ucode == null){
									alert("로그인 먼저 해주시기 바랍니다");
									location.href="login.do";
								} else {
									location.href = "insertCart.do?pCode=" + pcode + "&cCnt=" + cCnt + "&uCode=" + ucode;
								}
							};
							
							function orderOne(pcode, cCnt) {
			 					let ucode = <%=session.getAttribute("ucode") %>;
			 					
								if(ucode == null){
									alert("로그인 먼저 해주시기 바랍니다");
									location.href="login.do";
								} else {
									location.href = "credit.do?pCode=" + pcode + "&cCnt=" + cCnt;
								}
							};
	</script>
	<script>
		window.onload=function(){
			if (${success } == "1") {
				if (!confirm("장바구니로 이동하시겠습니까?")) {
					location.href="getAllList.do";
				} else {
					location.href="getCartList.do";
				}
			};
		};
	</script>
	<%-- <%@include file ="../common/footer.jsp" %> --%>
</body>
</html>
