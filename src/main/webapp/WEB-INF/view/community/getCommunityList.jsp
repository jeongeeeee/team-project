<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@include file ="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMMUNITY</title>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
<style>
	.info{
		width: 1080px;
		background-color: #eee;
		border-radius: 10px;
		margin: 30px auto;
		text-align: left;
		padding: 20px 30px;
	}
	.info p{
		font-size: 24px;
		font-weight: 700;
		color: #333;
	}
	#container{
		margin: 50px auto;
	}
	font {
		color: #6D3114;
		font-size: 40px;
		font-weight: bold;
	}
	th {
		padding: 15px 0 15px 0;
		border-top: 2px solid #A9A9A9;
		border-bottom: 2px solid #A9A9A9;
		font-size: 18px;
	}
	a {
		color: #6D3114 !important;
	}
	a:hover {
		color: black !important;
	}
	#boardList{
		border-bottom: 1px solid #e9eceb;
	}
	#btnSearch {
		border: 1px solid gray;
		background-color: rgba(0, 0, 0, 0);
		color: gray;
		padding: 3px;
		border-radius: 8px;
	}
	#btnSearch:hover {
		background-color: gray;
		color: white;
	}
	.btnInsertCommunity {
		border: 1px solid white !important; 
		background-color: #e9eceb !important; 
		padding: 5px;
		border-radius: 12px;
	}
	.btnInsertCommunity:hover {
		border: 1px solid #6D3114 !important;
		background-color: #6D3114 !important;
      	color: white !important;
	}
   .paging {
      	text-align: center;
   	}
   table tfoot a {
      padding-right: 20px;
   }
   #communityList td {
   		padding : 10px;
   }
</style>
</head>
<body>

<div class="info">
	<p>커뮤니티</p>
	<span>희로애락에서 다양한 사람을 만나고 전통주에 대한 이야기를 나눠봐요!</span>
</div>

<div id="container" align="center">
	<font>COMMUNITY</font>
	<br><br>
	<!-- 검색을 위한 폼 -->
	<form action="getCommunityList.do" method="get">
	<table class="border-none">
		<tr>
			<td width="500px" align="right">
				<select name="searchDivision">
				<c:forEach var="option" items="${conditionMap }">
					<option value="${option.value }">${option.key }</option>
				</c:forEach>
				</select>
				<input type="text" name="searchKeyword" size="40">
				<input type="submit" value="검색" id="btnSearch">
			</td>
			<td width="150px" align="right">
				<a href="insertCommunityGo.do" class="btnInsertCommunity" id="btnInsertCommunity">글 등록</a>
			</td>
		</tr>
	</table>
	<br>
	</form>
	<table id="communityList">
		<thead>
			<tr>
				<th width="100">번호</th>
				<th width="150">닉네임</th>
				<th width="300">제목</th>
				<th width="200">날짜</th>
				<th width="100">공감</th>
			</tr>
		</thead>
		<tbody align = "center">
		<c:forEach var="board" items="${CommunityList }">
			<tr>
				<td id="boardList">${board.mCode}</td>
				<td id="boardList">${board.uNick}</td>
				<td id="boardList">
					<a href="getCommunity.do?mCode=${board.mCode }" id="mTitle">${board.mTitle}</a>
				</td>
				<td id="boardList">${board.mDate}</td>
				<td id="boardList">${board.mGood}</td>
			</tr>
		</c:forEach>
		<c:if test="${empty CommunityList }">
			<tr>
				<td colspan="5">데이터가 없습니다</td>
			</tr>
		</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5" align="center">
					<ol class="paging">
					<c:choose>
						<c:when test="${page eq startpage }">
							<a>&lt;</a>
						</c:when>
						<c:when test="${page ne startpage }">
							<a href="getCommunityList.do?searchDivision=${searchDivision }&searchKeyword=${searchKeyword }&nowPage=${page - 1 }">&lt;</a>
						</c:when>
					</c:choose>
					<c:forEach var="index" begin="${startpage }" end="${endpage }" varStatus="1">
						<a href="getCommunityList.do?searchDivision=${searchDivision }&searchKeyword=${searchKeyword }&nowPage=${index }">${index }</a>
					</c:forEach>
					<c:choose>
						<c:when test="${page eq lastPage }">
							<a>&gt;</a>
						</c:when>
						<c:when test="${page ne lastPage }">
							<a href="getCommunityList.do?searchDivision=${searchDivision }&searchKeyword=${searchKeyword }&nowPage=${page + 1 }">&gt;</a>
						</c:when>
					</c:choose>
					</ol>
				</td>
			</tr>
		</tfoot>
	</table>
</div>
</body>
<script>
	window.onload=function(){
		if (${msg } == "1") {
			alert("로그인 먼저 부탁드립니다.");
		};
	};
</script>
</html>
<%@include file ="../common/footer.jsp" %>