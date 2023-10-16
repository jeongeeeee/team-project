<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지추가페이지</title>
<link rel="stylesheet" href="resources/adminCss/admin.css" />
<script>
	window.onload=function(){
		if (${success } == "1") {
			if (!confirm("계속하시겠습니까?")) {
				location.href="adminPage.do";
			} else {
				
			}
		}
	};
</script>
</head>
<body>
	<div class="insertNotice-wrapper">
		<div class="menu-bar">
			<div class="admin-menu">
				<div class="logo-box">
					<a alt="로고" class="main-logo" href="main.jsp"> </a>
				</div>
				<div class="admin-content">
					<ul class="admin-list">
						<li><a class="welcome">관리자님, 어서오세요</a></li>
						<li><a href="loginPage.do" class="home">HOME</a></li>
						<li><a href="logout.do" class="logout">로그아웃</a></li>
					</ul>
				</div>
			</div>
		</div>
		<h1 class="insertPage">공지사항 등록 페이지</h1>
		<form action="noticeInsert.do" method="post">
			<table>
				<tr>
					<th>제목</th>
					<td><input class="ino-title" type="text" name="ntitle"></td>
				</tr>
				<tr>
					<th>공지사항</th>
					<td><textarea class="ino-content" cols="50" rows="20"
							name="ncontent"></textarea></td>
				</tr>
			</table>
			<div class="insertButtonWrap">
				<input class="insertBtn" type="submit" value="저장하기">
			</div>
		</form>
	</div>
</body>
</html>