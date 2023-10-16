<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="resources/css/mypage.css"/>
<style>
	table{
		width:90%;
		text-align: center;
		margin: 0 auto;
	}
	th{
		font-size: 20px;
		height: 50px;
	}
	td{
		font-size: 17px;
		height: 40px;
	}
</style>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function deleteUser() {
		var getPwd = "<%=request.getAttribute("userPwd") %>";

		var setPwd = document.getElementById('setPwd').value;

		console.log("getPwd : " + getPwd);
		console.log("setPwd : " + setPwd);
		if (getPwd == setPwd) {
			location.href = "myUsersDelete.do";
		} else {
			alert("비밀번호가 일치하지 않습니다");
		}
		
	}
	function updateUser() {
		var unick = document.getElementById('unick').value;
		var uemail = document.getElementById('uemail').value;
		var uphone = document.getElementById('uphone').value;
		console.log("unick : " + unick);
		console.log("uemail : " + uemail);
		console.log("uphone : " + uphone);
		
		location.href = "updateUser.do?unick=" + unick + "&uemail=" + uemail + "&uphone=" + uphone;
		
	}
	
	// 커뮤니티 수정
	function updateComm(mTitle, mContent, mDate, uNick, mCode){
		var uri = "goUpdateMyComm.do?mTitle=" + mTitle + "&mContent=" + mContent + 
		"&mDate=" + mDate + "&uNick=" + uNick + "&mCode=" + mCode;
		var encodeUri = encodeURI(uri);
		
		window.open(encodeUri, 'updateCommnity', 'width=600, height=500');
	
		console.log(mTitle);
		console.log(mContent);
		console.log(mDate);
		console.log(uNick);
	}
	
	// 커뮤니티 삭제
	function deleteComm(mCode){
		console.log(mCode);
		
		 let isDelete = confirm("게시글을 삭제하시겠습니까?");
		
		 if(isDelete){
	         $.ajax("deleteMyComm.do", {
	            type: "post",
	            data : {mCode : mCode},
	            success : function(){
	               alert("게시글이 삭제 되었습니다");
	               location.href = "javascript:doDisplay(2)";
	            },
	            error : function(request, status, error){
	               alert("실패");
	               console.log("code: " + request.status);
	                 console.log("message: " + request.responseText);
	                 console.log("error: " + error);
	            }
	         });  
	       } else {
	          return;
	       }
    }
	
	// 리뷰작성
	function writeReview(uCode,pCode) {
		console.log(uCode);
		var uri = "insertReivewGo.do?uCode="+uCode+"&pCode="+pCode;
		var encodeUri = encodeURI(uri);
		
	    window.open(encodeUri, 'insertReview', 'width=600, height=400');
 	}
	
	function btnReview(rCode, rTitle, rContent){
		//alert(rCode);
		//alert(rTitle);
		//alert(rContent);
		var uri = "updateReviewGO.do?rCode="+rCode+"&rTitle="+rTitle+"&rContent="+rContent;
		var encodeUri = encodeURI(uri);

		window.open(encodeUri, 'updateReview', 'width=600, height=400');
		
	}
	
	function deleteReview(rCode){

		let isDelete = confirm("리뷰를 삭제하시겠습니까?");

		if(isDelete){
			$.ajax("deleteReview.do", {
				type: "post",
				data : {rCode : rCode},
				//dataType : "text",
				success : function(){
					alert("리뷰가 삭제 되었습니다");
					//location.reload();
					location.href = "javascript:doDisplay(3)";
				},
				error : function(request, status, error){
					alert("실패");
					console.log("code: " + request.status)
			        console.log("message: " + request.responseText)
			        console.log("error: " + error);
				}
			})  
	 	} else {
	 		return;
	 	}
	} 
	
	// QNA ---------------------------------------------------
	function updateQna(qTitle, qContent, qDate, uName, qCode) {
		var uri = "goupdateMyQna.do?qTitle="+qTitle+"&qContent="+qContent+"&qDate="+qDate+"&uName="+uName+"&qCode="+qCode;
		var encodeUri = encodeURI(uri);
		
		window.open(encodeUri, 'MyQna', 'width=400, height=450');
		
		console.log(qTitle);
		console.log(qContent);
		console.log(qDate);
		console.log(uName);
	}
	
	function deleteQna(qCode) {
		console.log(qCode);
		
		let isDelete = confirm("문의글을 삭제하시겠습니까?");
		
		 if(isDelete){
	         $.ajax("deleteQnaList.do", {
	            type: "post",
	            data : {qCode : qCode},
	            success : function(){
	            	alert("문의글이 삭제 되었습니다");
	               //location.reload();
	               location.href = "javascript:doDisplay(4)";
	            },
	            error : function(request, status, error){
	               alert("실패");
	               console.log("code: " + request.status);
	                 console.log("message: " + request.responseText);
	                 console.log("error: " + error);
	            }
	         });  
	       } else {
	          return;
	       }
	}

	//  ---------------------------------------------------
	
	function doDisplay(data){ 	
	    var main = document.getElementById("my_Main"); 	
	    var ord = document.getElementById("my_order"); 	
	    /* var cou = document.getElementById("my_coupon"); */ 	
	    var com = document.getElementById("my_comm"); 	
	    var rev = document.getElementById("my_review"); 	
	    var qna = document.getElementById("my_qna"); 	
	    var inf = document.getElementById("my_info"); 	
	    var can = document.getElementById("my_cancle");
	    console.log("함수왔다아");
	    console.log("data : " + data);
	    
			if(data == 1){ 
				main.style.display = 'none';
		    	ord.style.display = 'block'; 	
		    	com.style.display = 'none'; 	
		    	rev.style.display = 'none'; 	
		    	qna.style.display = 'none'; 	
		    	inf.style.display = 'none'; 	
		    	can.style.display = 'none';
		    	
		    	$.ajax("mypageOrder.do", {
		            type: "get", 
		            data: { data : data },
		            dataType: "json", //응답받을 데이터 타입
		            success: function(respData){
		               let html = "";
		               let num = 0;
		               $.each(respData, function(index, order){
		            	   
			               html += "<div class='oneOrder'>";
			               html += "<div class='order_date'><p>" + respData[num].oDate + "</p></div>";
			               html += "<div class='proOrder'>";
			               html += "<div class='proOrder_img'>";
			               html += "<img src='resources/img/alcohol/" + respData[num].pCtyimg + "' alt='주문한상품이미지' style='width:50px;'/>";
			               html += "</div>";
			               html += "<div class='proOrder_np'>";
			               html += "<p>" + respData[num].pName + "</p>";
			               html += "<span>" + respData[num].pPrice + "원</span><span>" + respData[num].oCnt + "개</span>";
			               html += "</div>";
			               html += "<div class='proOrder_review'>";
			               html += "<a href='javascript:writeReview("+respData[num].uCode+",\""+respData[num].pCode+"\")'>리뷰작성</a>";
			               html += "</div></div></div>";
			               num++;
		               });
		               $("#order_body").html(html);
		            },
		            error: function(){
		               alert("실패~~~");
		            }
		         });
		    	
		    } else if(data == 2){ 		
		    	main.style.display = 'none';
		    	ord.style.display = 'none'; 	
		    	com.style.display = 'block'; 	
		    	rev.style.display = 'none'; 	
		    	qna.style.display = 'none'; 	
		    	inf.style.display = 'none'; 	
		    	can.style.display = 'none';	
		    	
		    	$.ajax("myCommunityList.do", {
					type: "get", 
					data: { data : data },
					dataType: "json", //응답받을 데이터 타입
					success: function(respData){
						console.log(respData);
						//alert(data);
						console.log("data : " + data);
						
						let dispHtml = "";
						$.each(respData, function(index, mypage){
							dispHtml += "<tr>";
							dispHtml += "<td width='70px' align='center'>" + mypage.mCode + "</td>";
							dispHtml += "<td width='150px' align='center'>" + mypage.mDate + "</td>";
							dispHtml += "<td width='150px' align='center'>" + mypage.mTitle + "</td>";
							dispHtml += "<td width='70px' align='center'>" + mypage.mGood + "</td>";
							dispHtml += "<td width='120px' align='center'>";
							dispHtml += "<a onclick='javascript:updateComm(\"" + mypage.mTitle + "\", \"" + mypage.mContent + 
										"\", \"" + mypage.mDate + "\", \"" + mypage.uNick + "\", " + mypage.mCode + ")'>수정 </a>/"
							dispHtml += "<a href='javascript:deleteComm(" + mypage.mCode + ")'> 삭제</a>"
							dispHtml += "</td>";
							dispHtml += "</tr>";
						});
						$("#comm_tbody").html(dispHtml);
					},
					error: function(){
						alert("실패~~~");
					}
				});
		    	
		    } else if (data == 3) {
		    	main.style.display = 'none';
		    	ord.style.display = 'none';    
                com.style.display = 'none';    
                rev.style.display = 'block';    
                qna.style.display = 'none';    
                inf.style.display = 'none';    
                can.style.display = 'none';
                
		    	$.ajax("myReviewList.do", {
		            type: "get", 
		            data: { data : data },
		            dataType: "json", //응답받을 데이터 타입
		            success: function(respData){
		               console.log(respData);
		               console.log("data : " + data);
		               
		                let dispHtml = ""; 
		               $.each(respData, function(index, review){
		                  dispHtml += "<tr>";
		                  dispHtml += "<td width='70px' align='center'>" + review.rCode + "</td>";
		                  dispHtml += "<td width='150px' align='center'>" + review.rDate + "</td>";
		                  dispHtml += "<td width='150px' align='center'>" + review.pName + "</td>";
		                  dispHtml += "<td width='50px' align='center'>" + review.rStar + "</td>";
		                  dispHtml += "<td width='120px' align='center'>" + review.rTitle + "</td>";
		                  dispHtml += "<td width='180px' align='center'>" + review.rContent + "</td>";
		                  dispHtml += "<td width='120px' align='center'><a onclick='javascript:btnReview("+review.rCode+",\""+review.rTitle+"\",\""+review.rContent+"\")'>수정</a>/<a href='javascript:deleteReview("+review.rCode+")'>삭제</a></td>";
		                  dispHtml += "</tr>";
		               });
		                  $("#review_tbody").html(dispHtml);
		                 
		            },
		            error: function(){
		               alert("실패~~~");
		            }
		         });
		       } else if (data == 4) {
		    	    main.style.display = 'none';
					ord.style.display = 'none';    
					com.style.display = 'none';    
					rev.style.display = 'none';    
					qna.style.display = 'block';    
					inf.style.display = 'none';    
					can.style.display = 'none'; 
		          $.ajax("myQnaList.do", {
		            type: "get", 
		            data: { data : data },
		            dataType: "json", //응답받을 데이터 타입
		            success: function(respData){
		               console.log(respData);
		               console.log("data : " + data);
		               
		               let dispHtml = "";
		               $.each(respData, function(index, qna){
		                  dispHtml += "<tr>";
		                  dispHtml += "<td>" + qna.qCode + "</td>";
		                  dispHtml += "<td>" + qna.qDate + "</td>";
		                  dispHtml += "<td width='100px' align='center'>";
		                  if (qna.qComment == null) {
		                     dispHtml += "답변 대기";
		                  } else {
		                     dispHtml += "답변 완료";
		                  }
		                  dispHtml += "</td>";
		                  dispHtml += "<td width='100px' align='center'>" + qna.qTitle + "</td>";
						  dispHtml += "<td>";
						  dispHtml += "<a onclick='javascript:updateQna(\"" + qna.qTitle + "\", \"" + qna.qContent + "\", \"" + qna.qDate + "\", \"" + qna.uName + "\", " + qna.qCode + ")'>수정 </a>/";
						  dispHtml += "<a href='javascript:deleteQna(" + qna.qCode + ")'> 삭제</a>";
						  dispHtml += "</td>";
						  dispHtml += "</tr>";
		               });
		                  $("#qna_tbody").html(dispHtml);
		            },
		            error: function(){
		               alert("실패~~~");
		            }
		         });

		    }  else if(data == 5){ 
		    	main.style.display = 'none';
		    	ord.style.display = 'none'; 	
		    	com.style.display = 'none'; 	
		    	rev.style.display = 'none'; 	
		    	qna.style.display = 'none'; 	
		    	inf.style.display = 'block'; 	
		    	can.style.display = 'none';
		    	
		    	$.ajax("myUsersInfo.do", {
		            type: "get", 
		            data: { data : data },
		            dataType: "json", //응답받을 데이터 타입
		            success: function(respData){
		               let html = "";
		               html += "<form>";
		               html += "<b>아이디 </b> " + respData[0].userId + "<br>";
		               html += "<b>닉네임 </b> <input type=\"text\" id=\"unick\" value=" + respData[0].unick + "><br>";
		               html += "<b>주소 </b> " + respData[0].uaddr + "<br>";
		               html += "<b>이메일 </b> <input type=\"email\" id=\"uemail\" value=" + respData[0].uemail + "><br>";
		               html += "<b>휴대폰 </b> <input type=\"number\" id=\"uphone\" value=" + respData[0].uphone + "><br>";
		               html += "<input class='btn' type=\"button\" onclick=\"updateUser()\" value=\"수정\">";
		               html += "</form>";
		               
		            	$("#texte").html(html);
		            },
		            error: function(){
		               alert("실패~~~");
		            }
		         });
		    	
		    } else if(data == 6){ 		
		    	main.style.display = 'none';
		    	ord.style.display = 'none'; 	
		    	com.style.display = 'none'; 	
		    	rev.style.display = 'none'; 	
		    	qna.style.display = 'none'; 	
		    	inf.style.display = 'none'; 	
		    	can.style.display = 'block';	
		    }
			
	}
</script>
<script>
window.close();
</script>
</head>
<body>
<jsp:include page="../common/header.jsp" />
	<!-- MY 쇼핑(주문/배송, 찜, 할인쿠폰)
 + MY 활동(커뮤니티, 리뷰관리, 문의내역(Q&A))
 + MY 정보(회원정보확인/수정, 회원탈퇴) -->
 	
 	<div class="container">
 		<div id="my_menu">
 			<nav>
 				<div class="my_nav">
 					<div class="my_nav_title">MY 쇼핑</div>
 					<div class="my_nav_menu">
 						<ul>
 							<li><a href="javascript:doDisplay(1);">주문목록/배송</a></li>
 							<!-- <li><a href="javascript:doDisplay(2);">할인쿠폰</a></li> -->
 							<!-- <li><a href="#">찜한 목록</a></li> -->
 						</ul>
 					</div>
 				</div>
 				<div class="my_nav">
 					<div class="my_nav_title">MY 활동</div>
 					<div class="my_nav_menu">
 						<ul>
 							<li><a href="javascript:doDisplay(2);">커뮤니티내역</a></li>
 							<li><a href="javascript:doDisplay(3);">리뷰관리</a></li>
 							<li><a href="javascript:doDisplay(4);">Q&A문의내역</a></li>
 						</ul>
 					</div>
 				</div>
 				<div class="my_nav">
 					<div class="my_nav_title">MY 정보</div>
 					<div class="my_nav_menu">
 						<ul>
 							<li><a href="javascript:doDisplay(5);">회원정보수정</a></li>
 							<li><a href="javascript:doDisplay(6);">회원탈퇴</a></li>
 						</ul>
 					</div>
 				</div>
 			</nav>
 		</div>
 		<div class="content">
	 		<!-- MY 쇼핑(주문/배송, 찜, 할인쿠폰) -->
	 		<div id="my_Main">
		 		<h2>마이페이지</h2>
		 		<div class="content_box">
		 			<div id="mypageMain">
		 				<h3 align="center">좌측의 메뉴를 눌러 이용해주세요!</h3>
		 			</div>
		 		</div>
		 	</div>
		 	<div id="my_order" style="display: none;">
		 		<h2>주문목록</h2>
		 		<div class="content_box">
		 			<div id="order_body"></div>
		 			<%-- <c:forEach var="" items=""> 
			 			<div class="oneOrder">
				 			<div class="order_date"><p>(날짜 : sysdate 주문시간 불러오기)</p></div>
				 			<div class="proOrder">
				 				<div class="proOrder_img">
				 					<a href="#"><img src="resources/img/alcohol/pcty_takju001.jpg" alt="주문한상품이미지" style="width:50px;"/></a>
				 				</div>
				 				<div class="proOrder_np">
				 					<a href="#"><p>돌배 아랑주 X 3병</p></a>
				 					<span>15000 원</span><span>1 개</span>
				 				</div>
				 				<div class="proOrder_review">
				 					<a href="#">리뷰작성</a>
				 				</div>
				 			</div>
				 		</div>--%>
		 			<%-- </c:forEach> --%>
		 		</div>
		 	</div>
	 		
	 		<!-- MY 활동(커뮤니티, 리뷰관리, 문의내역(Q&A)) -->
		 	<div id="my_comm" style="display: none;">
		 		<h2>커뮤니티 내역</h2>
		 		<div class="content_box">
		 			<table>
		 				<thead class="comm_thead">
		 					<tr>
		 						<th>NO</th>
		 						<th>날짜</th>
		 						<th>제목</th>
		 						<th>좋아요</th>
		 						<th><!-- 수정/삭제 --></th>
		 					</tr>
		 				</thead>
		 				<tbody id="comm_tbody">
		 					<%-- <c:forEach var="community" items="${communityList }">
		 						<td>${community.mCode }</td>
		 						<td>${community.mDate }</td>
		 						<td>${community.mTitle }</td>
		 						<td>${community.mGood }</td>
		 					</c:forEach> --%>
		 				</tbody>
		 			</table>
		 		</div>
		 	</div>
		 	<div id="my_review" style="display: none;">
		 		<h2>리뷰관리</h2>
		 		<div class="content_box">
		 			<table>
		 				<thead class="review_thead">
		 					<tr>
		 						<th>NO</th>
		 						<th>날짜</th>
		 						<th>상품이름</th>
		 						<th>별점</th>
		 						<th>제목</th>
		 						<th>내용</th>
		 						<th><!-- 수정/삭제 --></th>
		 					</tr>
		 				</thead>
		 				<tbody id="review_tbody">
		 					<%-- <c:forEach var="" items="">
		 						
		 					</c:forEach> --%>
		 				</tbody>
		 			</table>
		 		</div>
		 	</div>
		 	<div id="my_qna" style="display: none;">
		 		<h2>Q&A문의내역</h2>
		 		<div class="content_box">
		 			<table>
		 				<thead class="qna_thead">
		 					<tr>
		 						<th>NO</th>
		 						<th>날짜</th>
		 						<th>답변여부</th>
		 						<th>제목</th>
		 						<th><!-- 수정/삭제 --></th>
		 					</tr>
		 				</thead>
		 				<tbody id="qna_tbody">
		 					<%-- <c:forEach var="qna" items="${qnalist }">
		 						<td>${qna.qCode }</td>
		 						<td>${qna.qDate }</td>
		 						<td>${qna.qComment }</td>
		 						<td>${qna.qTitle }</td>
		 					</c:forEach> --%>
		 				</tbody>
		 			</table>
		 		</div>
		 	</div>
		 	
	 		<!-- MY 정보(회원정보확인/수정, 회원탈퇴) -->
		 	<div id="my_info" style="display: none;">
		 		<h2>회원정보수정</h2>
		 		<div class="content_box">
		 			<div id="texte">
		 			
		 			</div>
		 			<%-- uCode : ${uvo.ucode }<p>
					userId : ${uvo.userId }<p>
					userPwd : ${uvo.userPwd }<p>
					uName : ${uvo.uname }<p>
					uNick : ${uvo.unick }<p>
					uAddr : ${uvo.uaddr }<p>
					uGender : ${uvo.ugender }<p>
					uEmail : ${uvo.uemail }<p>
					uPhone : ${uvo.uphone }<p>
					uBirth1 : ${uvo.ubirth1 }<p> --%>
					
					<%-- <form>
					userId : ${uvo.userId }<p>
					uNick : <input type="text" id="unick" value="${uvo.unick }"><p>
					uAddr : ${uvo.uaddr }?<p>
					uEmail : <input type="email" id="uemail" value="${uvo.uemail }"><p>
					uPhone : <input type="number" id="uphone" value="${uvo.uphone }"><p>
					<input type="button" onclick="updateUser()" value="수정">
					</form> --%>
		 		</div>
		 	</div>
		 	<div id="my_cancle" style="display: none;">
		 		<h2>회원정보탈퇴</h2>
		 		<div class="content_box">
			 		회원탈퇴를 하려면 비밀번호를 입력해주세요<p>
					<input type="password" id="setPwd">
					<input type="button" onclick="deleteUser()" value="확인">
		 		</div>
	 		</div>
	 	</div>
	 	
	 	
	 		<!-- 할인쿠폰 삭제~
		 	<div id="my_coupon" style="display: none;">
		 		<h2>할인쿠폰</h2>
		 		<p>할인쿠폰은 구매조건에 따라 상품 결제 시 적용할 수 있습니다.</p>
		 		<table>
		 			<thead>
		 				<tr>
		 					<th>쿠폰명</th>
		 					<th>할인액</th>
		 				</tr>
		 			</thead>
		 			<tbody id="my_coupon_">
		 				
		 			</tbody>
		 		</table>
		 	</div>
		 	 -->
		 	
	 	</div>
	 	
<jsp:include page="../common/footer.jsp" />
</body>
</html>