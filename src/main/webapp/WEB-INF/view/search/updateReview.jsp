<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String rCode = request.getParameter("rCode");
	String rTitle = request.getParameter("rTitle");
	String rContent = request.getParameter("rContent");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function updateReview(){
	//document.frm.action = "updateReview.do";
	document.frm.method = "post";
	document.frm.submit();
	alert("리뷰 수정 완료되었습니다.");
	
	//window.opener.location.href = window.opener.document.URL;
	//opener.location.assign("javascript:doDisplay(3)");
	opener.parent.parent.location.reload(); 
	//opener.parent.parent.location.href = "javascript:doDisplay(3)";
	//window.open("about:blank","_self");
	//opener.parent.parent.location.href("javascript:doDisplay(3)");
	//opener.parent.parent.location.href = "javascript:doDisplay(3)"; 
	//opener.document.location.assign = "javascript:doDisplay(3)"; 
	//opener.location.href = "javascript:doDisplay(3)";
	//window.open("about:blank","_self").close();
	//window.close();
} 


</script>
<body>
<div id="contatiner" align="center">
<!-- <form action="insertReview.do" method="post" name="frm">  -->
<form name="frm" id="frm" action="updateReview.do">
<input type="hidden" name="rCode" id="rCode" value="<%=rCode %>">
<table>
	<tr>
		<td colspan="2"><input type="text" name="uNick" value="닉네임" disabled></td>
	</tr>
	<tr>
		<td colspan="2"><input type="text" name="rTitle" id="rTitle" value="<%=rTitle %>" style="width:295px;"></td>
	</tr>
	<tr>
		<td colspan="2"><textarea id="rContent" name="rContent" rows="4" cols="40"><%=rContent %></textarea></td>
	</tr>
	<tr>
		<td>평점 : 
			<select name="rStar" id="rStar">
				<option value="5">★★★★★</option>
				<option value="4">★★★★</option>
				<option value="3">★★★</option>					
				<option value="2">★★</option>
				<option value="1">★</option>
			</select>
			</td>
			<td align="right">
			<a href="javascript:updateReview()">리뷰작성</a>
			<!-- <input type="submit" id="btnInsert" value="리뷰등록" onclick="updateReview()"> -->
			<!-- <a onclick="javascript:updateReview()">리뷰수정</a> -->
			<!-- <button onclick="close(this.form)">리뷰등록</button> -->
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>