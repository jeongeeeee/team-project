<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 이벤트 - 술자리를 다채롭게! 희로애락</title>
<link rel="stylesheet" href="resources/css/event.css" />
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="ContentWrapper">
      <div class="EventWrapper">
        <div class="event-list-box">
          <a href=" notice.do">
            <div class="eventBanner ebr001"></div>
          </a>
          <a href=" notice.do">
            <div class="eventBanner ebr002"></div>
          </a>
          <a href="getAllList.do">
            <div class="eventBanner ebr003"></div>
          </a>
          <a href="notice.do">
            <div class="eventBanner ebr004"></div>
          </a>
          <a href="getProductList.do?pType=3">
            <div class="eventBanner ebr005"></div>
          </a>
        </div>
      </div>
    </div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>