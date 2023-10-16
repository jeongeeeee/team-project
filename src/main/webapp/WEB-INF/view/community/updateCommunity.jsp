<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="../common/header.jsp" %>
<% 
	request.setCharacterEncoding("UTF-8");

	String mCode = request.getParameter("mCode");
	String mTitle = request.getParameter("mTitle");
	String mContent = request.getParameter("mContent");
	String mDate = request.getParameter("mDate");
	String mGood = request.getParameter("mGood");
	String uNick = request.getParameter("uNick");
	//int mGood = Integer.parseInt(request.getParameter("mGood"));

%>
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
	#btnUpdate{
		border: 1px solid white !important; 
		background-color: #e9eceb !important; 
		padding: 5px;
		border-radius: 12px;
	}
	#btnUpdate:hover{
		border: 1px solid #6D3114 !important;
		background-color: #6D3114 !important;
      	color: white !important;
	}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	function delete_Community(frm){
		var mCode = document.getElementById("mCode").value;
		
		let isDelete = confirm("게시글을 삭제하시겠습니까?");
		
		if(isDelete){
			
			$.ajax("deleteCommunity.do", { 
				type: "post",
				data : {mCode : mCode},
				success : function(respDate){
					alert("게시글이 삭제되었습니다");
					location.href = "getCommunityList.do";
				},
				error : function(request, status, error){
					alert("게시글 삭제 실패");
					console.log("code: " + request.status)
			        console.log("message: " + request.responseText)
			        console.log("error: " + error);
				}
			}) 
		} else {
			return;
		} 
	}
</script>
<body>
<div id="container" align="center">
	<h1>POST</h1>
	<br>
	<form action="updateCommunity.do" method="post">
		<input type="hidden" name="mCode" id="mCode" value="<%=mCode %>">
		<%--<input type="hidden" name="mPwd" value="${community.mPwd }"> --%>
		<table>
		<tr>
			<td height="40px" width="80px">제목</td>
			<td><input type="text" value="<%=mTitle %>" id="mTitle" name="mTitle"></td>
		</tr>
		<tr>
			<td height="40px">작성자</td>
			<td><input type="text" name="uNick" value="<%=uNick %>" disabled></td>
		</tr>
		<tr>
			<td height="40px">날짜</td>
			<td><input type="text" name="mDate" value="<%=mDate %>" disabled></td>
		</tr>
		<tr>
			<td height="40px">내용</td>
			<td><textarea id="mContent" name="mContent" rows="4" cols="40"><%=mContent %></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right" height="40px">
				<img src="resources/img/good.png" alt="따봉" width="25px" height="22px">&nbsp;<input type="text" name="mGood" value="<%=mGood %>" size="3" disabled> 
			</td>
		</tr>
		</table>
		<table>
		<tr>
			<td align="right" height="40px" width="230px">
				<input type="submit" id="btnUpdate" value="수정완료">
			</td>
			<td align="right" width="150px">
				<a href="javascript:delete_Community(this.form)">삭제하기</a>
			</td>
		</tr>
		</table>
	</form>
</div>
</body>
</html>
<%@include file ="../common/footer.jsp" %>