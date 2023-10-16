<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String cPath=request.getContextPath(); %>
<!-- fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
	
<link rel="stylesheet" href="resources/css/common.css" />
	<div>
		<div class="Container">
			<!-- user 관련 헤드 -->
			<div class="user-header">
				<section class="user-menu">
					<div class="user-inner">
						<ul class="user-list">
							<c:choose> 
								<c:when test="${not empty unick }">
									<li class="user-login" aria-labelledby="mui-4"><a href="main.jsp">${unick }</a></li>
									<li class="user-myPage"><a href="goMypageList.do">마이페이지</a></li>
									<li class="user-cart"><a href="getCartList.do" onclick="GotoShoppingBag()">
											<span class="icon-cart"></span> 장바구니 <span id="spbCNT"
											name="spbCNT"></span>
									</a></li>
									<li><a href="logout.do">로그아웃</a></li>
								</c:when> 
								<c:otherwise>
									<li class="user-login" aria-labelledby="mui-4"><a
										href="login.do">로그인/회원가입</a></li>
									<li class="user-myPage"><a href="javascript:loginGo();">마이페이지</a></li>
									<li class="user-cart"><a href="javascript:loginGo();" onclick="GotoShoppingBag()">
											<span class="icon-cart"></span> 장바구니 <span id="spbCNT"
											name="spbCNT"></span>
									</a></li>
								</c:otherwise> 
							</c:choose> 
						</ul>
					</div>
				</section>
			</div>
			<div class="divider"></div>
			<!-- 메인 헤드 -->
			<div class="main-header">
				<div class="navigation-menu">
					<section class="nav-logo">
						<div class="img-wrapper">
							<a class="main-logo" href="main.jsp" alt="메인바로가기"></a>
						</div>
					</section>
					<form action="<%=cPath %>/getSearchList.do" class="list" id="search">
					<ul class="search-content">
						<li class="searchInputWrapper">
							<div class="search-box">
								<input type="text" class="search-txt" name="searchKeyword"
									placeholder="무엇을 찾고 계신가요?" /> <a class="search-button"
									onclick="document.getElementById('search').submit();"> <i
									class="fa-solid fa-magnifying-glass search-icon"
									alt="search-icon"></i>
								</a>
							</div>
						</li>
					</ul>
					</form>
				</div>
			</div>
			<div class="divider"></div>
			<!-- 카테고리 헤드 -->
			<div class="category-header">
				<div class="category-list-wrapper">
					<ul class="category-list">
						<li class="main">
							<div>
								<a href="main.jsp">홈</a>
							</div>
						</li>
						<li class="product-total">
							<div>
								<a href="<%=cPath %>/getAllList.do">전체상품</a>
							</div>
						</li>
						<li class="product-local">
							<div>
								<a href="getAreaList.do">지역상품</a>
							</div>
						</li>
						<li class="community">
							<div>
								<a href="getCommunityList.do">커뮤니티</a>
							</div>
						</li>
						<li class="event">
							<div>
								<a href="event.do">이벤트</a>
							</div>
						</li>
						<li class="notice">
							<div>
								<a href="notice.do">공지사항</a>
							</div>
						</li>
						<li class="getQnaList">
							<div>
								<a href="getQnaList.do?nowPage=1">QnA</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="divider"></div>
		</div>
	</div>
<script>
	function loginGo() {
		alert("로그인 먼저 해주시기 바랍니다");
		location.href="login.do";
	}
</script>