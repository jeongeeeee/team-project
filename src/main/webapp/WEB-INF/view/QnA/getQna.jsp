<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 상세</title>
<link rel="stylesheet" href="./resources/css/common.css">
<style>
	#container{
		margin: 60px auto;
	}
	th {
		font-size: 20px;
	}
	td {
		font-size: 15px;
	}
	font{
		color: #6D3114;
		font-size: 40px;
		font-weight: bold;
	}
	#btnQna {
		font-size: 18px;
		padding-top: 20px;
	}
	#qComment {
		font-size: 18px;
	}
	#qComment2 {
		font-size: 15px;
		padding: 10px;
		width: 540px;
	}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />

<div id="container" align="center">
	<font>Q&A</font><br><br>
	<table>
		<tr>
			<th height="40px" width="160px">작성 일자</th>
			<td width="130px">${qna.qDate }</td>
		</tr>
		<tr>
			<th height="40px">문의 사항</th>
			<td>${qna.qTitle }</td>
		</tr>
		<tr>
			<th height="40px">작성자</th>
			<td>${qna.uName }</td>
		</tr>
		<tr>
			<th height="40px">작성 내용</th>
			<td width="500px">${qna.qContent }</td>
		</tr>
		<tr>
			<td colspan="2" align="right" id="btnQna">
				<a href="updateQnaGo.do">글수정 /</a>
				<a href="deleteQna.do?qCode=${qna.qCode }">글삭제 /</a>
				<a href="getQnaList.do">글목록</a>
			</td>
		</tr>
	</table>
	<br>
	<hr width="700px">
	<br><br>
			<c:if test="${qna.qComment != null}">
				<h2>문의 답변</h2><br><br>
				<b id="qComment">관리자 작성내용</b><p> 
				<p id="qComment2">${qna.qComment }</p>
			</c:if> 
		<c:if test="${qna.qComment == null }">
				<h2>문의 답변</h2><br><br>
				<b>답변이 아직 작성되지 않았습니다.</b>
		</c:if>
</div>

<br><br><br>
<jsp:include page="../common/footer.jsp" />
</body>
</html>