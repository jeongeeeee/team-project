<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMMUNITY</title>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
<style>	
	#container{
		margin: 80px auto;
	}
	font {
		color: #6D3114;
		font-size: 40px;
		font-weight: bold;
	}
	td{
		padding: 10px 0 5px 0;
	}
	#btnInsert{
		border: 1px solid white; 
		background-color: #e9eceb; 
		color: black; 
		padding: 5px;
		border-radius: 12px;
	}
	#btnInsert:hover{
		background-color: gray;
		color: white;
	}
</style>
</head>
<script>
window.onload=function(){
	if (${success } == "1") {
		if (!confirm("계속하시겠습니까?")) {
			location.href="getCommunityList.do";
		} else {
			
		}
	};
};
</script>
<script>
function btnCommunityInsert(frm){
	 var mTitle  = document.getElementById("mTitle").value;
     if (mTitle == "") {
        alert("제목을 입력해주십시오");
     }else if (document.getElementById("mContent").value == "") {
        alert("내용을 입력해주십시오");
     } else if (document.getElementById("mPwd").value == "") {
        alert("비밀번호를 입력해주십시오");
     } else {
        frm.submit();
     }
}
</script>
<body>
<div id="container" align="center">
	<font>POST</font>
	<form action="insertCommunity.do" method="post">
		<table>
		<tr>
			<td width="70px">제목</td>
			<td><input type="text" id="mTitle" name="mTitle"  placeholder="제목을 입력해주세요"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=session.getAttribute("unick") %></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea id="mContent" name="mContent" rows="4" cols="40" placeholder="내용을 입력해주세요"></textarea></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" placeholder="비밀번호(숫자 4자리)" id="mPwd" name="mPwd" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="button" id="btnInsert" value="등록" onclick="javascripot:btnCommunityInsert(this.form)"></td>
		</tr>
		</table>
	</form>
	
</div>	
</body>
</html> 
<%@include file ="../common/footer.jsp" %>