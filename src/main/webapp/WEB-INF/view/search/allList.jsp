<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cPath=request.getContextPath(); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체상품</title>
<link rel="stylesheet" href="<%=cPath %>/resources/css/allList.css">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div class="container">
		<div class="info">
			<p>전체상품</p>
			<span>희로애락의 모든 술을 만나보세요!</span>
		</div>
		
		<div>
			
			<table>
				<c:set var="i" value="0"/>
				<c:set var="j" value="4"/>
				<c:forEach var="result" items="${allList}">
					<c:if test="${i%j == 0 }">
					<tr>
					</c:if>
						<td>
							<a href="detail.do?pCode=${result.pcode }">
								<div class="pro_box"><img src="resources/alcohol_img/alcohol/${result.pctyimg }" alt="product_all"></div>
								<p>${result.pname }</p>
								<p>가격: ${result.pprice }원</p>
								<p></p>
								<hr>
								<p>${result.pinfo }</p>
							</a>
						</td>
							
					<c:if test="${i%j == j-1 }">
					</tr>
					</c:if>
					<c:set var="i" value="${i+1 }"/>
				</c:forEach>
			</table>
		</div>
		
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>