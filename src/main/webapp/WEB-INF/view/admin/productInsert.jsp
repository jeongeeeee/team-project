<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품추가페이지</title>
<link rel="stylesheet" href="resources/adminCss/admin.css"/>
<script>
	window.onload=function(){
		if (${success } == "1") {
			if (!confirm("계속하시겠습니까?")) {
				location.href="adminPage.do";
			} else {
				
			}
		};
	};
</script>
</head>
<body>
	<div id="insertTable">
		<div>
			<img alt="로고" src="resources/image/logo.png" id="logoImg">
			<div class="basic">
				<a href="loginPage.do">홈페이지</a>|
				<a>관리자님, 어서오세요</a>|
				<a href="#" class="logout">로그아웃</a>
			</div>
		</div>
		<h1 id="insertPage">상품추가페이지</h1>
		<form action="productInsert.do" method="post" enctype="multipart/form-data">
			<div id="insertButton">
				<input type="submit" value="저장하기" class="btn-3d red">
			</div>
			<table>
				<tr>
					<th width="10%">상품분류</th>
					<td>
						탁주<input type="radio" name="pcodeDivision" value=1>
						약·청주<input type="radio" name="pcodeDivision" value=2>
						과실주<input type="radio" name="pcodeDivision" value=3>
						증류주<input type="radio" name="pcodeDivision" value=4>
					</td>
				</tr>
				
				<tr>
					<th>상품명</th>
					<td>
						<input type="text" name="pname" id="product" placeholder="상품이름...">
					</td>
				</tr>
				
				<tr>
					<th>상품가격</th>
					<td>
						<input type="text" name="pprice" id="product" placeholder="상품가격...">
					</td>
				</tr>
				
				<tr>
					<th>상품설명</th>
					<td>
						<input type="text" name="pinfo" id="product" placeholder="상품설명...">
					</td>
				</tr>
				
				<tr>
					<th>상품이미지</th>
					<td>
						<input type="file" name="pimgPath" accept='image/jpg,image/png,image/jpeg,image/gif' id="profile_img_upload">
						<label for=profile_img_upload><i class="far fa-file-image"></i>&nbsp;파일 선택</label>
					</td>
				</tr>
				
				<tr>
					<th>상품상세이미지</th>
					<td>
						<input type="file" name="pdetailimgPath" accept='image/jpg,image/png,image/jpeg,image/gif' id="profile_img_upload">
						<label for=profile_img_upload><i class="far fa-file-image"></i>&nbsp;파일 선택</label>
					</td>
				</tr>
				
				<tr>
					<th>상품카테고리이미지</th>
					<td>
						<input type="file" name="pctyimgPath" accept='image/jpg,image/png,image/jpeg,image/gif' id="profile_img_upload">
						<label for=profile_img_upload><i class="far fa-file-image"></i>&nbsp;파일 선택</label>
					</td>
				</tr>
				
				<tr>
					<th>상품단맛</th>
					<td>
						1<input type="radio" name="psweet" value="1">
						2<input type="radio" name="psweet" value="2">
						3<input type="radio" name="psweet" value="3">
						4<input type="radio" name="psweet" value="4">
						5<input type="radio" name="psweet" value="5">
					</td>
				</tr>
				
				<tr>
					<th>상품산미</th>
					<td>
						1<input type="radio" name="psour" value="1">
						2<input type="radio" name="psour" value="2">
						3<input type="radio" name="psour" value="3">
						4<input type="radio" name="psour" value="4">
						5<input type="radio" name="psour" value="5">
					</td>
				</tr>
				
				<tr>
					<th>상품바디</th>
					<td>
						1<input type="radio" name="pbody" value="1">
						2<input type="radio" name="pbody" value="2">
						3<input type="radio" name="pbody" value="3">
						4<input type="radio" name="pbody" value="4">
						5<input type="radio" name="pbody" value="5">
					</td>
				</tr>
				
				<tr>
					<th>지역별상품코드</th>
					<td>
						서울<input type="radio" name="plocal" value="SEL">
						전라도<input type="radio" name="plocal" value="JLD">
						충청도<input type="radio" name="plocal" value="CCD">
						경기도<input type="radio" name="plocal" value="GGD">
						경상도<input type="radio" name="plocal" value="GSD">
						제주도<input type="radio" name="plocal" value="JJD">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>