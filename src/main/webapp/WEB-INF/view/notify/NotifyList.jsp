<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script>
window.onload = () => {
	  // panel-faq-container
	  const panelFaqContainer = document.querySelectorAll(".panel-faq-container"); // NodeList 객체
	  
	  // panel-faq-answer
	  let panelFaqAnswer = document.querySelectorAll(".panel-faq-answer");

	  // 반복문 순회하면서 해당 FAQ제목 클릭시 콜백 처리
	  for( let i=0; i < panelFaqContainer.length; i++ ) {
	    panelFaqContainer[i].addEventListener('click', function() { // 클릭시 처리할 일
	      // FAQ 제목 클릭시 -> 본문이 보이게끔 -> active 클래스 추가
	      panelFaqAnswer[i].classList.toggle('active');
	    });
	  };
	  
	  btnAllClose.addEventListener('click', function() {
	    // 버튼 클릭시 처리할 일  
	    for(let i=0; i < panelFaqAnswer.length; i++) {
	        panelFaqAnswer[i].classList.remove('active');
	    };
	  });
	}

</script>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="resources/css/notifyList.css">
</head>
<body>
<%@include file ="../common/header.jsp" %>
	<div class="info">
		<p>공지사항</p>
		<span>희로애락의 모든 소식을 알려드립니다!</span>
	</div>
    <div class="parent">
	<div class="content">
	    <table style = "border-collapse: collapse;">
	      <thead>
	        <tr>
	          <th>No</th>
	          <th width="80%;">제목</th>
	          <th>작성일</th>
	        </tr>
	      </thead>
	      <tbody class="text-center" style="text-align: center;">
	        <c:forEach items="${NotifyList }" var="list">
	        <tr>
	          <td>${list.ncode }</td>
	          <td class="text-left" width="50%">
	            <div class="panel-faq-container">
	              <p class="panel-faq-title">${list.ntitle }</p>
	              <div class="panel-faq-answer">
	                <div class="nContent">${list.ncontent }</div>
	              </div>
	            </div>
	          </td>
	          <td><fmt:formatDate value="${list.ndate }" pattern="yyyy/MM/dd"/></td>
	        </tr>
	        </c:forEach>
	      </tbody>
	    </table>
	  </div>
	  </div>
<%@include file ="../common/footer.jsp" %>
</body>
</html>