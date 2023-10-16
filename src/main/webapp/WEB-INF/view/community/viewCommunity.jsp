<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="../common/header.jsp" %>
<% 
	request.setCharacterEncoding("UTF-8");

	String mCode = request.getParameter("mCode");
	String mPwd = request.getParameter("mPwd");
	String mTitle = request.getParameter("mTitle");
	String mContent = request.getParameter("mContent");
	String mDate = request.getParameter("mDate");
	String mGood = request.getParameter("mGood");
	String uNick = request.getParameter("uNick");

	//System.out.println(uNick);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMMUNITY</title>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
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
</head>
<script>
	function check_pwd(frm){
		
		var checkPwd = document.getElementById("checkPwd").value;
		//alert('checkPwd : ' + checkPwd);
		const mPwd = <%=mPwd %>;
		//alert('mTitle : ' + mPwd);
		
		if(checkPwd == mPwd){
			alert("비밀번호가 일치합니다\n수정/삭제페이지로 이동합니다");
			//frm.method="post";
			//frm.action="updateCommunity.jsp";
			frm.setAttribute('method','post');
			frm.setAttribute('action','updateCommunityGo.do');
		} else {
			alert("비밀번호가 일치하지않습니다.");
			frm.setAttribute('method','post');
		} 
	}
</script>
<body>
<div id="container" align="center">
	<form>
		<table>
			<tr>
			<th colspan="2" height="100" width="350"><h2>수정/삭제를 위한 비밀번호 입력</h2></th>
			</tr>
			<tr>
			<td height="100" width="200" align="right"><input type="password" name="checkPwd" id="checkPwd" placeholder="비밀번호 입력" size="15" maxlength="4"></td>
			<td width="100" align="left"><input type="submit" id="btnUpdate" value="수정/삭제" onclick="check_pwd(this.form)"></td>
			</tr>
		</table>
			<input type="hidden" name="mCode" value="<%=mCode %>">
			<input type="hidden" name="mPwd" id="mPwd" value="<%=mPwd %>">
			<input type="hidden" name="mTitle" id="mTitle" value="<%=mTitle %>">
			<input type="hidden" name="mContent" id="mContent" value="<%=mContent %>">
			<input type="hidden" name="mDate" id="mDate" value="<%=mDate %>">
			<input type="hidden" name="mGood" id="mGood" value="<%=mGood %>">
			<input type="hidden" name="uNick" id="uNick" value="<%=uNick %>">
	</form>
</div>
</body>
</html>
<%@include file ="../common/footer.jsp" %>