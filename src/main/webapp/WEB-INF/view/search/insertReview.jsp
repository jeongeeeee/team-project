<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//int uCode = Integer.parseInt(request.getParameter("uCode"));
	String uCode = request.getParameter("uCode");
	String pCode = request.getParameter("pCode");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function insertReview(frm){
/* 	let isDelete = confirm("작성하시겠습니까?");
	
	if (isDelete) {
		document.frm.action ="insertReview.do";
		document.frm.method = "post";
		document.frm.submit();
		alert("작성되었습니다");
		window.close();
	} else {		
		window.close();
	} */
	
	document.frm.action ="insertReview.do";
	document.frm.method = "post";
	document.frm.submit();
	alert("작성되었습니다");
} 

</script>
</head>
<body>
<div id="contatiner" align="center">
<!-- <form action="insertReview.do" method="post" name="frm">  -->
<form name="frm"><!-- pCode -->
	<input type="hidden" id="uCode" name="uCode" value="<%=uCode %>">
	<input type="hidden" id="pCode" name="pCode" value="<%=pCode %>">
<table>
	<tr>
		<td colspan="2"><input type="text" id="uNick" name="uNick" value="<%=session.getAttribute("unick") %>" disabled></td>
	</tr>
	<tr>
		<td colspan="2"><input type="text" name="rTitle" id="rTitle" placeholder="리뷰 제목을 입력해주세요" style="width:295px;"></td>
	</tr>
		<tr>
		<td colspan="2"><textarea id="rContent" name="rContent" rows="4" cols="40" placeholder="리뷰 내용을 입력해주세요"></textarea></td>
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
			<!-- <input type="button" id="btnInsert" value="리뷰등록" onclick="close(this.form)"> -->
			<a href="javascript:insertReview()">리뷰작성</a>
			<!-- <button onclick="close(this.form)">리뷰등록</button> -->
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>