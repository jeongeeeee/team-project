<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<%@include file ="../common/header.jsp" %>
<link rel="stylesheet" href="resources/css/findIdPwd.css">
<body>	
	<div class= "card-body">
		<form action="findPwd.do" method="POST" name="findPwd" class="form">
			<div class="findForm">
				<div style="margin: 15px  0px  30px  0px;">
					<h3 class="form-title">| 비밀번호 찾기 |</h3>
				</div>
			</div>
			<div class="input-box">
				<div align="center">
					<!-- <label for="" class="form-label">Id</label> -->
					<font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ID</font>
					<input type="text" name="userId" class="form-control" placeholder="아이디를 입력해주세요." >
				</div>
			</div>		
			<div class="input-box" >
				<div align="center">
					<!-- <label for=""class="form-label">Email</label> -->
					<font>E-MAIL</font>
					<input type="email" name="uemail" class="form-control" placeholder="이메일을 입력해주세요.">
				</div>
			</div>
			<div class="sub-btn">
				<button type="submit" class="form-btn" value="check">비밀번호 찾기</button>
				<button type="button" class="form-btn" onclick="location.href='login.do'">로그인하기</button>
			</div>
			<div class="btm-find">
				<div class="bottom-box"> 
					<a href="idSearch.do">아이디 찾기</a> | <a href="userCheck.do">회원가입</a>
				</div>
			</div>
		
			<c:if test="${check == 1}">
				<script>
					alert("일치하는 정보가 존재하지 않습니다.");
				</script>
			</c:if>
			<c:if test="${check == 0 }">
				<script>
					alert("찾으시는 비밀번호는' ${userPwd}' 입니다.");
					location.href="login.do";
				</script>
			</c:if>
		</form>
	</div>
<%@include file ="../common/footer.jsp" %>
</body>
</html>

