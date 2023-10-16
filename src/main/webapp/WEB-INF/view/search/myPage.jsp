<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 test</title>
</head>
<body>
	<a href="goMypageOrder.do?uCode=${uCode }">마이페이지 주문내역</a><p>
	<a href="myCommunityList.do?uCode=${uCode }">마이페이지 커뮤니티</a><p>
	<a href="myReviewList.do?uCode=${uCode }">마이페이지 리뷰</a><p>
	<a href="myQnaList.do?uCode=${uCode }">마이페이지 문의</a><p>
	<a href="myUsersInfo.do?userId=${userId }">마이페이지 회원정보</a><p>
	<a href="myUsersInfo.do?userId=${userId }">마이페이지 회원정보수정</a><p>
	<a href="myUsersInfo.do?userId=${userId }">마이페이지 회원탈퇴</a><p>
</body>
</html>