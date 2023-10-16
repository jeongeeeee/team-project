<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA등록</title>
<link rel="stylesheet" href="./resources/css/common.css">
<style>
	#container {
	 	margin-top: 50px;
	}
	h1 {
		font-weight: 800;
		color: #6D3114;
		text-align: center;
		padding-bottom: 20px;
	}
	table th {
		padding-right: 30px;
		font-size: 1.1em;
		padding-bottom: 20px;
	}
	table td {
		padding-bottom: 20px;
	}
	#btn {
		margin-top: 30px;
		font-size: 1.2em;
		width: 150px;
		height: 35px;
		border: none;
		border-radius: 10px;
	}
	#btn:hover {
		background-color: #6D3114;
		color: white;
	}
	#selectbox {
		width: 150px;
	}
	#qnainfo {
		border-bottom: 1px solid #E2E2E2;
		width: 800px;
		padding-bottom: 30px;
		margin: 10px;
	}
	#pwd {
		width: 200px;
		height: 20px;
	}
</style>
<script>
window.onload=function(){
	if (${success } == "1") {
		if (!confirm("계속하시겠습니까?")) {
			location.href="getQnaList.do";
		} else {
			
		}
	};
};
</script>
<script>
	function insert_go(frm) {
		var select  = document.getElementById("selectbox");
		var value = (select.options[select.selectedIndex].value);
		if (value == "선택") {
			alert("제목을 선택해주십시오");
		}else if (document.getElementById("pwd").value == "") {
			alert("비밀번호를 입력해주십시오");
		} else if (document.getElementById("content").value == "") {
			alert("문의 내용을 입력해주십시오");
		} else {
			frm.submit();
		}
	}
</script>
</head>
<body>
<jsp:include page="../common/header.jsp" />

<div id="container" align="center">
	<h1>문의 등록</h1>
	<p id="qnainfo">* 문의는 재입고, 배송 등 상품에 대하여 담당자에게 문의하는 게시판입니다.<br>
	* 욕설, 비방, 거래 글, 분쟁 유발, 명예훼손, 허위사실 유포, 타 쇼핑몰 언급,광고성 등의 부적절한 게시글은 금지합니다.</p>
	<br><br>
	
	<form action="insertQna.do" method="post">
	<table>
		<tr>
			<th>제목</th>
			<td>
				<select id="selectbox" name="qTitle">
					<option value="선택" selected disabled>===== 선택 =====</option>
					<option value="배송 문의">배송 문의</option>
					<option value="상품 문의">상품 문의</option>
					<option value="기타 문의">기타 문의</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=session.getAttribute("userId") %></td>
		</tr>
		<tr>
			<th>작성 비밀번호</th>
			<td>
				<input type="password" name="qPwd" id="pwd" maxlength="4" placeholder="숫자 4자리 이하로 입력하세요" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
			</td>
		</tr>
		<tr>
			<th>문의 내용</th>
			<td>
				<textarea name="qContent" id="content" rows="12" cols="60" placeholder="* 상품명, 주문내역 기입 시 더 빠른 답변이 가능합니다 *"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="btn" value="등록" onclick="insert_go(this.form)">
			</td>
		</tr>
	</table>
	</form>
</div>

<br><br><br>
<jsp:include page="../common/footer.jsp" />
</body>
</html>