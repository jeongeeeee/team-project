<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
form {
    display: block;
    margin-top: 0em;
}

 h1 {
 	text-align: center;
}
 
/* 
body {
    background-color: #fff;
    width: 30%;
    margin: 0 auto;
}  */

.wrap {
	width: 500px;
	margin: 150px auto;
	margin-top: 30px;
	
}

main p > strong {
    font-size: 14px;
}

/* 회원정보 입력창 CSS */
.inputText {
    width: 100%;
    font-size: 14px;
}
.inputText div {
    display: flex;
    flex-direction: row;
    margin-bottom: 20px;
    border: 1px solid #AAAAAA;
}

.inputText input {
    width: 100%;
    padding: 10px;
    font-weight: bold;
    border: none;
}
.inputText input::placeholder {
    color: #AAAAAA;
}
.inputText div:last-child {
    margin-bottom: 10px;
}

/* 아이디 저장, 아이디/비밀번호 찾기/회원가입 */
 .autoLogin {
    display: flex;
    flex-direction: row;
    align-items: center;
    margin-bottom: 15px;
} 
* .autoLogin p {
    margin-left: 10px;
    font-size: 14px;
} 
.autoLogin .login-Check {
    width: 30%;
    display: flex;
    align-items: center;
}
.autoLogin .check-box {
    width: 20px;
    height: 20px;
    border: 1px solid black;
    margin: 0 0;
}
.autoLogin .find {
    width: 70%;
}
.autoLogin .find span p {
    width: 100%;
    text-align: right;
}
.autoLogin .find a {
    color: #0073e9;
    text-decoration: none;
}

.find {
	text-align: right
}



/* 로그인 버튼 */
button {
    height: 60px;
    font-weight: bold;
    border: none;
}
.btn {
    text-align: center;
    margin: 40px;
}

.login-btn button {
    width: 80%;
    background-color: #6D3114;
    color: white;
    text-align: center;
}

/* 회원가입 버튼 */
.join-btn button {
    background-color: white;
    border: 1px solid #AAAAAA;
}
.join-btn a button {
    color: #0074E9;
    text-decoration: none;
}



</style>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<script src="http://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="stylesheet" href="resources/css/common.css">
<%@include file="../common/header.jsp" %>
</head>
<body>
 <div class="wrap">
	<h1 style="margin: 20px;"> LOGIN </h1>
    	<form action="userLoginPage.do" method="post">
    		 <section class="inputText">
	         <div>
	             <input type="text" placeholder="아이디" name="userId">
	         </div>
	         <div>
	             <input type="password" placeholder="비밀번호" name="userPwd">
	         </div>
	     </section>
	     <section class="autoLogin">
	         <div class="login-Check">
	            <input type="checkbox" name="auto"> 아이디 저장 
	         </div>
	         <div class="find">
	             <a href="idSearch.do">아이디/</a>
	             <a href="pwdSearch.do">비밀번호 찾기 | </a>
	             <a href="userCheck.do">회원가입</a>
	         </div>
	      </section>
	   
	   <div class="btn">
	       <div class="login-btn">
	           <button type="submit">로그인</button>
	       </div>
	   </div>
	</form>

    </div>
    
<%@include file="../common/footer.jsp" %>
</body>
</html>