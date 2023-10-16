<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cPath=request.getContextPath(); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
<!-- css -->
<link rel="stylesheet" href="<%=cPath %>/resources/css/search.css" />

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<!-- content -->
	<div class=container>
			<!-- product -->
			<div id="title">
				<p>"<span>${searchKeyword }</span>" 검색 결과입니다.</p>
				<div class="itembox">
					<c:choose>
						<c:when test="${empty searchList || empty searchKeyword ||
								 searchKeyword == ' ' || searchKeyword == '.' ||
								 searchKeyword == '(' || searchKeyword == ')'}">
							<p id="empty">검색된 내용이 존재하지 않습니다.</p>
						</c:when>
						<c:otherwise>
							<table>
								<c:set var="i" value="0"/>
								<c:set var="j" value="4"/>
								<c:forEach var="search" items="${searchList}">
									<c:if test="${i%j == 0 }">
									<tr>
									</c:if>
										<td>
											<a href="detail.do?pCode=${search.pcode }">
												<div class="pro_box"><img src="resources/alcohol_img/alcohol/${search.pctyimg }" alt="product_search"></div>
												<p>${search.pname }</p>
												<p>가격: ${search.pprice }원</p>
												<p></p>
												<hr>
												<p>${search.pinfo }</p>
											</a>
										</td>
											
									<c:if test="${i%j == j-1 }">
									</tr>
									</c:if>
									<c:set var="i" value="${i+1 }"/>
								</c:forEach>
									
							</table>
						</c:otherwise>
					</c:choose>
				</div>
			
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>