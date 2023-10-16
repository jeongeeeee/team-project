<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String qTitle = request.getParameter("qTitle");
	String qContent = request.getParameter("qContent");
	String qDate = request.getParameter("qDate");
	String uName = request.getParameter("uName");
	String qCode = request.getParameter("qCode");
	
	System.out.println("qTitle : " + qTitle + ", qContent : " + qContent + ", qDate : " + qDate + ", uName : " + uName + ", qCode : " + qCode);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 업데이트 수정</title>
<style>
	input {
		margin: 5px;
	}
	#uName {
		height: 20px;
		width: 150px;
	}
	#qDate {
		height: 20px;
		width: 150px;
	}
	#qTitle {
		height: 20px;
		width: 150px;
	}
</style>
<script>
	function updateQnaGo() {
		var qContent = document.getElementById("qContent").value;
		var qCode = document.getElementById("qCode").value;
		console.log(qContent);
		console.log(qCode);
		location.href = "updateMyQna.do?qContent=" + qContent + "&qCode=" + qCode;
		opener.parent.parent.location.reload();
		//window.close();
	}
</script>
</head>
<body>

<div id="container" align="center">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이름 : <input type="text" name="uName" id="uName" value="<%=uName %>" disabled><p>
		 작성날짜 : <input type="text" name="qDate" id="qDate" value="<%=qDate %>" disabled><p>
		문의 유형 : <input type="text" name="qTitle" id="qTitle" value="<%=qTitle %>" disabled><p>
		문의 내용<br><br><textarea name="qContent" id="qContent" rows="10" cols="40"><%=qContent %></textarea><p>
		<input type="hidden" name="qCode" id="qCode" value="<%=qCode %>">
		<input type="button" id="send" onclick="javascript:updateQnaGo()" value="수정">
</div>

</body>
</html>