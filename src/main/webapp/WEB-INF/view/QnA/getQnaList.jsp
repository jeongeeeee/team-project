<%@page import="com.spring.huiloaelag.qna.QnaVO"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.huiloaelag.qna.dao.QnaDAO"%>
<%@page import="com.spring.huiloaelag.admin.pageing.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA List</title>
<link rel="stylesheet" href="./resources/css/common.css">
<style>
	.info{
		width: 1080px;
		background-color: #eee;
		border-radius: 10px;
		margin: 30px auto;
		text-align: left;
		padding: 20px 30px;
	}
	.info p{
		font-size: 24px;
		font-weight: 700;
		color: #333;
	}
	#search {
		padding-bottom: 20px;
		padding-top: 10px;
	}
	font {
		color: #6D3114;
		font-size: 40px;
		font-weight: bold;
		text-align: center;
	}
	#insertgo {
		color: #6D3114;
		padding-bottom: 20px;
		float: right;
		padding-right: 50px;
		font-size: large;
	}
	#container {
	 margin-top: 50px;
	}
	#title th {
		border-bottom: 2px solid black;
		border-top: 2px solid black;
		text-align: center;
		height: 10px;
		padding: 5px;
		font-size: 18px;
	}
	#tbody td {
		padding: 10px;
		border-bottom: 1px solid #e9eceb;
	}
	#title tfoot td{
		text-align: center;
		padding-top: 40px;
	}
	#title tfoot a {
		padding-right: 20px;
	}
	#submitSearch {
		margin-left: 10px;
		font-size: 1.1em;
		width: 100px;
		height: 30px;
		border: none;
		border-radius: 10px;
	}
	#submitSearch:hover {
		background-color: #6D3114;
		color: white;
	}
	.paging {
		text-align: center;
	}
</style>
<script>
	function goViewQna(val1,val2) {
		var f = document.viewQna;
		console.log("val1 : " + val1);
		console.log("val2 : " + val2);
		sessionStorage.setItem("getPwd", val2);
		location.href = 'viewQnaGo.do?qCode=' + val1;
	}
</script>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<div class="info">
	<p>QnA</p>
	<span>문의/건의사항을 희로애락에게 자유롭게 남겨주세요.</span>
</div>
<div id="container" align = "center">

	<font>QnA</font>
	<br>
	<div id="search">
		<form action="getQnaList.do" method="post">
		<table class="border-none">
			<tr>
				<td>
					<select name="searchCondition">
						<option value="NAME">작성자</option>
					</select>
					<input type="text" name="searchKeyword" size="40">
					<input type="submit" id="submitSearch" value="검색">
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	<form name="viewQna">
	<table id="title">
		<thead>
			<tr>
				<td colspan="5">
					<a href="insertQnaGo.do" id="insertgo"><b>문의 등록</b></a>
				</td>
			</tr>
			<tr>
				<th width="100">번호</th>
				<th width="150">답변 여부</th>
				<th width="200">제목</th>
				<th width="150">작성자</th>
				<th width="200">작성일</th>
			</tr>
		</thead>
		<tbody align="center" id="tbody">
			<c:forEach var="qna" items="${resultList }">
				<tr>
					<td>${qna.qCode }</td>
					<td>
						<c:if test="${qna.qComment == null }"><b style="color: #A6A6A6;">답변 대기</b></c:if>
						<c:if test="${qna.qComment != null }"><b style="color: #6D3114;">답변 완료</b></c:if>
					</td>
					<td>
						<input type="hidden" name="qCode" value="${qna.qCode }">
						<input type="hidden" name="qPwd" value="${qna.qPwd }">
						<a href="javascript:goViewQna('${qna.qCode }', '${qna.qPwd }');">${qna.qTitle }</a>
					</td>
					<td>${qna.uName }</td>
					<td>${qna.qDate }</td>
				</tr>
			</c:forEach>
			<c:if test="${empty resultList }">
			<tr>
				<td colspan="5">데이터가 없습니다</td>
			</tr>
		</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">
					<ol class="paging">
					<c:choose>
						<c:when test="${page eq startpage }">
							<a>&lt;</a>
						</c:when>
						<c:when test="${page ne startpage }">
							<a href="getQnaList.do?searchDivision=${searchDivision }&searchKeyword=${searchKeyword }&nowPage=${page - 1 }">&lt;</a>
						</c:when>
					</c:choose>
					<c:forEach var="index" begin="${startpage }" end="${endpage }" varStatus="1">
						<a href="getQnaList.do?searchDivision=${searchDivision }&searchKeyword=${searchKeyword }&nowPage=${index }" style="text-decoration: underline;">${index }</a>
<%-- 						<li><a href="getQnaList.do?searchDivision=${searchDivision }&searchKeyword=${searchKeyword }&nowPage=${index }">${index }</a></li> --%>
					</c:forEach>
					<c:choose>
						<c:when test="${page eq lastPage }">
							<a>&gt;</a>
						</c:when>
						<c:when test="${page ne lastPage }">
							<a href="getQnaList.do?searchDivision=${searchDivision }&searchKeyword=${searchKeyword }&nowPage=${page + 1 }">&gt;</a>
						</c:when>
					</c:choose>
					</ol>
				</td>
			</tr>
		</tfoot>
	</table>
	</form>
</div>

<br><br><br>
<jsp:include page="../common/footer.jsp" />
</body>
</html>