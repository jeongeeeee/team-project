<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
	$(document).ready(function() {
			alert("getJsonProductListData() 실행~~");

			$.ajax("test.do", {
				type : "get",
				dataType : "text", //응답받을 데이터 타입
				success : function(productList) {
					alert("성공~~~");

					/* $.each(respData, function(productList) {
						dispHtml += "<li>";
						dispHtml += this.pName + ", ";
						dispHtml += this.pPrice ;
						dispHtml += "</li>";
					});

					$(".test").html(dispHtml); */
				},
				error: function(){
					alert("실패~~~");
				}
			});
	})
</script>
</head>
<body>
	<div class="soolRcmPrdListWrapper">
		<div class="rcmPrdListContent">
			<div class="test"></div>
		</div>
	</div>
</body>
</html>