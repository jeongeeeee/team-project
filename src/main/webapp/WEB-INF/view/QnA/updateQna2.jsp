<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 수정</title>
<link rel="stylesheet" href="./resources/css/common.css">
<style>
	#container{
		margin: 60px auto;
	}
	font{
		color: #6D3114;
		font-size: 40px;
		font-weight: bold;
	}
	th {
		font-size: 18px;
	}
	td {
		font-size: 15px;
	}
	#updateQna {
		border: 1px solid white !important; 
		background-color: #e9eceb !important; 
		padding: 5px;
		border-radius: 12px;
	}
	#updateQna:hover{
		border: 1px solid #6D3114 !important;
		background-color: #6D3114 !important;
      	color: white !important;
	}
	table {
		padding-left: 100px;
	}
	th, td {
		padding-bottom: 10px;
	}
</style>
<script>
window.onload=function(){
	if (${success } == "1") {
		if (!confirm("계속하시겠습니까?")) {
			location.href="getQnaList.do";
		} else {
			
		}
	};
};
</script>
</head>
<body>
<jsp:include page="../common/header.jsp" />

<div id="container" align="center">
	<font>Q&A</font><br><br>
	<form action="updateQna.do" method="post">
	<table>
		<tr>
			<th height="40px" width="120px">제목</th>
			<td>
				<select id="selectbox" name="qTitle" disabled>
					<option selected>${qna.qTitle }</option>
				</select>
			</td>
		</tr>
		<tr>
			<th height="40px">작성자</th>
			<td>${qna.uName }</td>
		</tr>
		<tr>
			<th height="40px">작성 비밀번호</th>
			<td>
				<input type="password" name="qPwd" value="${qna.qPwd }" disabled>
			</td>
		</tr>
		<tr>
			<th height="40px">내용</th>
			<td>
				<textarea name="qContent" rows="10" cols="40">${qna.qContent }</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" id="updateQna" value="QnA 수정">
			</td>
		</tr>
	</table>
	</form>
</div>

<jsp:include page="../common/footer.jsp" />
</body>
</html>