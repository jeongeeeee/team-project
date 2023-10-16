<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	/* String getPwd = request.getParameter("qPwd"); */
	int qCode = Integer.parseInt(request.getParameter("qCode"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성한 암호 확인</title>
<link rel="stylesheet" href="./resources/css/common.css">
<style>
	#container{
		margin: 100px auto;
	}
	table {
		border-collapse: collapse;
	}
	th, td {
		border-bottom: 1px solid #E2E2E2;
	}
	
	#btnUpdate {
      margin-left: 10px;
      /* font-size: 1.1em; */
      width: 70px;
      height: 30px;
      border: none;
      border-radius: 10px;
   }
   #btnUpdate:hover {
      background-color: #6D3114;
      color: white;
   }
</style>
<script>
	function getQna_go() {
		let setPwd = document.getElementById("setPwd").value;
		let getPwd = sessionStorage.getItem("getPwd");
		if (getPwd == setPwd) {
			location.href = 'getQna.do?qCode=<%=qCode %>';
		} else {
			alert("비밀번호가 일치하지 않습니다.\n" + "다시 입력해주세요");
		}
	}
</script>
</head>
<body>
<jsp:include page="../common/header.jsp" />

<div id="container" align="center">
	<table>
   		<tr>
   			<th colspan="2" height="100" width="350"><h2>문의 시 작성한 비밀번호를 입력하세요</h2></th>
   		</tr>
   		<tr>
   			<td height="100" width="200" align="right"><input type="password" name="setPwd" id="setPwd" size="15" maxlength="4"></td>
   			<td width="100" align="left"><input type="button" id="btnUpdate" value="확인" onclick="getQna_go()"></td>
   		</tr>
	</table>
</div>	

<br><br><br>
<jsp:include page="../common/footer.jsp" />
</body>
</html>