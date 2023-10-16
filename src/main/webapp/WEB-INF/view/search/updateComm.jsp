<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mCode = request.getParameter("mCode");
	String mDate = request.getParameter("mDate");
	String mTitle = request.getParameter("mTitle");
	String mContent = request.getParameter("mContent");
	String uNick = request.getParameter("uNick");
	
	//System.out.println("qTitle : " + qTitle + ", qContent : " + qContent + ", qDate : " + qDate + ", uName : " + uName + ", qCode : " + qCode);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 커뮤니티 수정</title>
<style>
	input {
		margin: 5px;
	}
	#uNick {
		height: 20px;
		width: 150px;
	}
	#mDate {
		height: 20px;
		width: 150px;
	}
	#mTitle {
		height: 20px;
		width: 150px;
	}
</style>
<script>
	function updateCommGo() {
		var mTitle = document.getElementById("mTitle").value;
		var mContent = document.getElementById("mContent").value;
		var mCode = document.getElementById("mCode").value;
		console.log(mTitle);
		console.log(mContent);
		console.log(mDate);
		console.log(uNick);
		console.log(mCode);
		location.href = "updateMyComm.do?mTitle=" + mTitle + "&mContent=" + mContent + "&mCode=" + mCode;
		opener.parent.parent.location.reload();
	}
</script>
</head>
<body>
	<div id="container" align="center">
		닉네임 : <input type="text" name="uNick" id="uNick" value="<%=uNick %>" disabled><p>
		작성날짜 : <input type="text" name="mDate" id="mDate" value="<%=mDate %>" disabled><p>
		제목 : <input type="text" name="mTitle" id="mTitle" value="<%=mTitle %>"><p>
		내용<br><br><textarea name="mContent" id="mContent" rows="10" cols="40"><%=mContent %></textarea><p>
		<input type="hidden" name="mCode" id="mCode" value="<%=mCode %>">
		<input type="button" onclick="javascript:updateCommGo()" value="수정">
</div>
</body>
</html>