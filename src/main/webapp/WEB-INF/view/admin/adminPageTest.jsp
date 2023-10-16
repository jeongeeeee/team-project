<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인 페이지</title>
</head>
<body>
<div class="container">
	<div class="basic">
			<a href="loginPage.do">홈페이지</a>|
			<a>관리자님, 어서오세요</a>|
			<a href="logout.do" class="logout">로그아웃</a>
	</div>
	<hr>
	<div class="bar">
		<input type="checkbox" id="menuicon">
		<label for="menuicon">
			<span></span>
			<span></span>
			<span></span>
		</label>
		<div class="sidebar">
			<input type="checkbox" id="answer01" class="firstAnswer">
			<label for="answer01">주문내역관리</label>
			<div><a id="Management" class="order" href="javascript:orderHistory();">주문내역관리</a></div>
			
			<input type="checkbox" id="answer02">
			<label for="answer02">매출정보</label>
			<div><a id="Management" href="javascript:salesManagement();">매출정보</a></div>
			
			<input type="checkbox" id="answer03">
			<label for="answer03">매장관리</label>
			<div>
				<a href="javascript:productManagement();">제품관리</a>
				<a href="javascript:reviewManagement();">리뷰관리</a>
			</div>
			
			<input type="checkbox" id="answer04">
			<label for="answer04">회원관리</label>
			<div><a id="Management" href="javascript:memberManagement();">회원관리</a></div>
			
			<input type="checkbox" id="answer05">
			<label for="answer05">Q&A관리</label>
			<div><a id="Management" href="javascript:questionManagement();">Q&A관리</a></div>
			
			<input type="checkbox" id="answer06">
			<label for="answer06">공지사항 등록</label>
			<div><a id="Management" class="announcement" href="javascript:announcement();">공지사항 등록</a></div>
			
		</div>
	</div>
	<div class="child_div">
		<div id="order_div">
			<table id='center'>
				<thead id="order_head">
				<tr>
					<th>NO</th>
					<th>이름</th>
					<th>연락처</th>
					<th>배송지주소</th>
					<th>상품명</th>
					<th>수량</th>
					<th>금액</th>
					<th>결제수단</th>
					<th>주문일자</th>
				</tr>
				</thead>
			</table>	
		</div>
		<div id="chart_div" style="width: 700px; height: 900px; margin-left: -250px; margin-top: 50px;"></div>
		<div id="detailSales">
			<h3 id="coler_h3">기간별 매출현황</h3>
			<input type="text" name="datetimes" readonly="readonly"/>
			<div id="div_id">
				<table id='detailcenter'>
					<thead id="detail_head">
					<tr>
						<th>NO</th>
						<th>상품코드</th>
						<th>상품명</th>
						<th>금액</th>
						<th>판매량</th>
						<th>총매출금액</th>
					</tr>
					</thead>
					<tbody id="detailSales_tbody">
					
					</tbody>
				</table>
			</div>
		</div>
		<!-- 
		<ul id="store_ul">
					<li id="store_li"><a href="javascript:productManagement();">제품관리</a></li>
					<li id="store_li"><a href="javascript:reviewManagement();">리뷰관리</a></li>
				</ul>
		 -->
		<div id="store_div">
			<div id='product_table'>
				<ul id="product_ul"> <!-- detail부분에 들어갈 파라미터 값 상품 코드 넣기 -->
					<li id="product_li"><a href="javascript:detail(1);">탁주</a></li>
					<li id="product_li"><a href="javascript:detail(2);">약·청주</a></li>
					<li id="product_li"><a href="javascript:detail(3);">과실주</a></li>
					<li id="product_li"><a href="javascript:detail(4);">증류주</a></li>
				</ul>
			</div>
			<div id="detail_product">
				<table>
					<thead id="product_head">
						<tr>
							<th>상품코드</th>
							<th>상품명</th>
							<th>상품가격</th>
							<th>상품설명</th>
							<th>
								<a href="product_state.do?state=1&pcode=0"><img id="insertImg" src="resources/image/insert.png" alt="추가"></a>
							</th>
						</tr>
					</thead>
					
					<tbody id="product_tbody">
	
					</tbody>
				</table>
			</div>
			
			<div id='review_table'>
				<table>	
					<thead id="review_head">
						<tr>
							<th>NO</th>
							<th>ID</th>
							<th>상품코드</th>
							<th>작성일자</th>
							<th>상품명</th>
							<th>리뷰내용</th>
							<th>별점</th>
							<th>상태처리</th>
						</tr>
					</thead>
					<tbody id="review_tbody">
					
					</tbody>
				</table>
			</div>
		</div>
		
		<div id="membership_div">
			<form class="searchForm">
				<div class="searchDiv">
					<div class="search-Division">
					<select name='searchDivision' class="searchNum">
						<option value='1' selected>아이디</option>
						<option value='2'>이름</option>
						<option value='3'>닉네임</option>
					</select>
					</div>
					<input type="text" name="searchKeyword" class="searchText" placeholder="Search..">
					<input type="button" value="검색" name="searchBtn" class="searchBtn" onclick="memberManagement(searchDivision.value, searchKeyword.value);"/>
				</div>
			</form>
			<table id='usercenter' class="userTable">
				<thead id="user_head">
				<tr>
					<th id="user_th">USERCODE</th>
					<th id="user_th">ID</th>
					<th id="user_th">이름</th>
					<th id="user_th">비밀번호</th>
					<th id="user_th">닉네임</th>
					<th id="user_th">주소</th>
					<th id="user_th">성별</th>
					<th id="user_th">이메일</th>
					<th id="user_th">생년월일</th>
					<th id="user_th">휴대폰번호</th>
					<th id="user_th"></th>
				</tr>
				</thead>
				<tbody id="membership_tbody">
					
				</tbody>
			</table>
		</div>
		
		<div id="QandA_div">
			<form class="searchForm">
				<div class="searchDiv">
					<div class="search-Division">
					<select name='searchDivision' class="searchNum">
						<option value='1' selected>문의코드</option>
						<option value='2'>문의내용</option>
					</select>
					</div>
					<input type="text" name="searchKeyword" class="searchText" placeholder="Search..">
					<input type="button" value="검색" name="searchBtn" class="searchBtn" onclick="questionManagement(searchDivision.value, searchKeyword.value);"/>
				</div>
			</form>
			<table id='QnAcenter' class="QnATable">
				<thead id="QnA_head">
				<tr>
					<th>No</th>
					<th>문의코드</th>
					<th>문의제목</th>
					<th>문의내용</th>
					<th>문의날짜</th>
					<th></th>
				</tr>
				</thead>
				<tbody id="QnA_tbody">
					
				</tbody>
			</table>
		</div>
			
		<div id="notice_div">
			<table id='noticecenter' class="noticeTable">
				<thead id="notice_head">
				<tr>
					<th>No</th>
					<th>공지코드</th>
					<th>공지제목</th>
					<th>공지내용</th>
					<th>공지날짜</th>
					<th>
						<a href="noticeInsert.do"><img id="insertImg" src="resources/image/insert.png" alt="추가"></a>
					</th>
				</tr>
				</thead>
				<tbody id="notice_tbody">
					
				</tbody>
			</table>
		</div>
		<div id="footer_div">
		<footer class="footer">
			<%-- <jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include> --%>
		</footer>
	</div>
	</div>

</div>
</body>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link href="resources/adminCss/test.css" rel="stylesheet"/>
<script src="resources/adminJs/adminPageJs.js"></script>
</html>