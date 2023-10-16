<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
	th{
		padding: 10px 0 20px 0;
	}
	td{
		padding: 10px 0 0 0;
	}
	a:hover {
  		color : red;
	}
	#btnCommunity {
		border: 1px solid gray;
		background-color: rgba(0, 0, 0, 0);
		color: gray;
		padding: 3px;
		border-radius: 8px;
	}
	#btnCommunity:hover {
		background-color: gray;
		color: white;
	}
	#btnInsertCommunity {
		border: 1px solid white; 
		background-color: #e9eceb; 
		color: black; 
		padding: 5px;
		border-radius: 12px;
	}
	#btnInsertCommunity:hover {
		background-color: gray;
		color: #e9eceb;
		
	}
	#btnComment{
		border: 1px solid white; 
		background-color: #e9eceb !important; 
		color: black !importance; 
		padding: 5px;
		border-radius: 12px;
	}
	#btnComment:hover{
		background-color: gray !important;
		color: #e9eceb;
	}
	#btnGood {
		border: 1px solid black;
		background-color: white;
		border-radius: 5px;
		color: black;
		font-size: 25px;
		width: 30px;
		height: 30px;
	}
	#btnGood:hover {
		border: 1px solid white;
		background-color: white;
		color: red;
	}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
function btn_InsertCommunity(frm){
	var mPwd = document.getElementById("mPwd").value;
	
	var cPwd = prompt("게시글 비밀번호를 입력해주세요"+"");
	
	if(cPwd == mPwd){
		alert("비밀번호가 일치합니다.");
		location.href="updateCommunity.jsp";
	} else {
		alert("비밀번호가 일치하지 않습니다.");
	}
}

//좋아요(공감)
function goodCheck(){
	$.ajax("Like.do?mCode=${community.mCode }", {
		type: "post",
		success : function(data){
			location.reload();
		},
		error : function(request, status, error){
			alert("좋아요 누르기 실패");
			console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		}
	})
}

//댓글
function insert_Comment(mCode,uCode){
	//uCode도 추가!!
	var unick = document.getElementById("uNick").value;
	var cmtContent = document.getElementById("cmtContent").value;
	var cmtPwd = document.getElementById("cmtPwd").value;
	
    if (cmtContent == "") {
       alert("댓글을 입력해주십시오");
       return;
    }else if (cmtPwd == "") {
       alert("비밀번호를 입력해주십시오");
       return;
    }
 
/*	console.log('unick:'+unick);
 	console.log(mCode);
	console.log(cmtContent);
	console.log(cmtPwd); */
	$.ajax("insertComment.do", {
		type: "post",
		data : {mCode : mCode, uNick: unick, cmtContent : cmtContent, cmtPwd : cmtPwd},
		dataType: "text",
		success : function(respDate){
			alert("댓글이 등록 되었습니다");
			location.reload();
		},
		error : function(request, status, error){
			alert("댓글 등록 실패");
			console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		}
	})
}

function btn_updateComment(cmtCode, cmtContent){
	
	$.ajax("getComment.do", { 
		type: "post",
		data : {cmtCode : cmtCode},
		success : function(comment){
			var checkPwd = document.getElementById("checkPwd").value;
			if(comment == checkPwd){
				alert("비밀번호가  일치합니다.\n 댓글을 수정해주세요.");
				$(".comment"+cmtCode).html("<textarea rows='3' cols='30' name='updateContent' id='updateContent'>"+cmtContent+"</textarea><br><a href='javascript:update_Comment("+cmtCode+")'>수정완료</a>");
			} else {
				alert("비밀번호가 일치하지 않습니다.\n 비밀번호를 확인해주세요.");
			}
		},
		error : function(request, status, error){
			alert("댓글 수정 실패");
			console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		}
	})
}

function update_Comment(cmtCode){
	//alert(cmtCode);
	var updateContent = document.getElementById("updateContent").value;
	
	$.ajax("updateComment.do", { 
		type: "post",
		data : {cmtCode : cmtCode, cmtContent : updateContent},
		dataType : "text",
		success : function(respData){
			alert(respData);
			//alert("댓글 수정이 완료되었습니다");
			location.reload();
		},
		error : function(request, status, error){
			alert("댓글 수정 실패");
			console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error);
		}
	}) 
}

function delete_Comment(cmtCode){
	var checkPwd = document.getElementById("checkPwd").value;
	
	//console.log(cmtCode);
	//console.log(checkPwd);
	let isDelete = confirm("댓글을 삭제하시겠습니까?");

	if(isDelete){
		$.ajax("deleteComment.do", {
			type: "post",
			data : {cmtCode : cmtCode, cmtPwd : checkPwd},
			dataType : "text",
			success : function(respData){
				if(respData){
					alert("댓글이 삭제 되었습니다");
					location.reload();
				} else {
					alert("비밀번호가 일치하지 않습니다.\n 비밀번호를 확인해주세요.");
				}
			},
			error : function(request, status, error){
				alert("댓글 삭제 실패");
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
	<font>COMMUNITY</font>
	<form action="viewCommunityGo.do" method="post">
		<input type="hidden" name="mCode" value="${community.mCode }">
		<input type="hidden" name="mPwd" id="mPwd" value="${community.mPwd }">
		<input type="hidden" name="mTitle" id="mTitle" value="${community.mTitle }">
		<input type="hidden" name="mContent" id="mContent" value="${community.mContent }">
		<input type="hidden" name="mDate" id="mDate" value="${community.mDate }">
		<input type="hidden" name="mGood" id="mGood" value="${community.mGood }">
		<input type="hidden" name="uNick" id="uNick" value="${community.uNick }">
		<table>
		<tr>
			<td height="30px" width="80px">제목</td>
			<td>${community.mTitle }</td>
		</tr>
		<tr>
			<td height="30px">작성자</td>
			<td>${community.uNick }</td>
		</tr>
		<tr>
			<td height="30px">날짜</td>
			<td>${community.mDate }</td>
		</tr>
		<tr>
			<td height="30px">내용</td>
			<td>${community.mContent }</td>
		</tr>
		<tr>
			<td colspan="2" align="right" height="40px" style="padding-top: 20px;">
				<input type="submit" id="btnCommunity" value="수정/삭제하기">				
				<!-- <a href="javascript:btn_InsertCommunity()">수정하기</a> -->
			</td>
		</tr> 
		</table>
	</form>
	<div style="padding-top: 20px;">
		<%--  <input type="button" value="♥" onclick="goodCheck()"/> ${community.mGood} --%>
		 <input type="button" value='♥' id="btnGood" onclick="goodCheck()"/> &nbsp; ${community.mGood}
	</div>
	<br>
	<hr width="700">
	<form>
	<input type="hidden" id="uNick" name="uNick" value="<%=session.getAttribute("unick") %>">
	<table>
		<tr>
			<td colspan="2"><input type="text" id="uNick" name="uNick" value="<%=session.getAttribute("unick") %>" disabled></td>
		</tr>
		<tr>
			<td colspan="2"><textarea id="cmtContent" name="cmtContent" rows="4" cols="40"></textarea></td>
		</tr>
		<tr>
			<td align="right" width="240">비밀번호&nbsp;<input type="password" id="cmtPwd" name="cmtPwd" placeholder="숫자 4자리" size="7" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td>
			<td align="right"><input type="button" value="댓글등록" id="btnComment" onclick="insert_Comment(${community.mCode })"></td>
		</tr>                                 
	</table>
	</form>
	<br>
	<hr width="500px">
	<c:forEach var="comments" items="${commentsList }">
		<br>
		<form action="getComment.do" method="get">
			<h3>${comments.uNick }</h3>
			<div class="comment${comments.cmtCode }">
			${comments.cmtContent }
			<br><br>
			<input type="password" id="checkPwd" name="checkPwd" placeholder="댓글 비밀번호" size="8" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
			<a href="javascript:btn_updateComment('${comments.cmtCode }','${comments.cmtContent }')">수정</a>
			<a href="javascript:delete_Comment(${comments.cmtCode })">삭제</a>
			<%-- <input type="button" value="댓글수정" onclick="update_Comment(${comments.cmtCode })"> --%>
			</div>
		</form>
		<br>
		<hr width="500px">
	</c:forEach>
	<c:if test="${empty commentsList }"><br><br>
		<p>첫번째 댓글을 달아주세요!</p>
	</c:if>
	<br>
</div>
</body>
</html>
<%@include file ="../common/footer.jsp" %>