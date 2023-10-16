<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>희로애락: 喜怒哀樂</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {
		
		$.ajax("getJsonProductList.do", {
			type : "get",
			data : {
				pType : pType
			},
			//dataType: "json",
			success : function(respData) {
				
				var pType = data;
				console.log('pType : ' + pType);
				location.href = "getProductList.do?pType=" + pType;
			},
			error : function(respData) {
				alert('error');
			}
		});

	});
	function getProductList(data) {
		console.log(data);

		if (data == 1) {
			var pType = 1;
		} else if (data == 2) {
			var pType = 2;
		} else if (data == 3) {
			var pType = 3;
		} else if (data == 4) {
			var pType = 4;
		}

		$.ajax("getJsonProductList.do", {
			type : "get",
			data : {
				pType : pType
			},
			//dataType: "json",
			success : function(respData) {
				/* alert("성공"); */
				var pType = data;
				console.log('pType : ' + pType);
				location.href = "getProductList.do?pType=" + pType;
			},
			error : function(respData) {
				alert('error');
			}
		});
	}
</script>
</head>
<body>
	<%@ include file="WEB-INF/view/common/header.jsp"%>
	<div class="Container">
		<div class="ContentWrapper">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="resources/img/event-banner-001.png"
							style="width: 100%; height: 100%" class="d-block" alt="..." />
					</div>
					<div class="carousel-item">
						<img src="resources/img/event-banner-002.png"
							style="width: 100%; height: 100%" class="d-block" alt="..." />
					</div>
					<div class="carousel-item">
						<img src="resources/img/event-banner-003.png"
							style="width: 100%; height: 100%" class="d-block" alt="..." />
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
			<!-- End Banner Hero -->
			<div class="soolTypeSelectWrapper">
				<div class="soolTypeSelectInnerWrapper">
					<div class="soolTypeSelect">
						<a href="getProductList.do?pType=1">
							<div>
								<img src="resources/img/icon-takju.png" alt="메인 카테고리 아이콘" />
							</div> <label class="name">탁주</label>
						</a>
					</div>
					<div class="soolTypeSelect">
						<a href="getProductList.do?pType=2">
							<div>
								<img src="resources/img/icon-yakju.png" alt="메인 카테고리 아이콘" />
							</div> <label class="name">약·청주</label>
						</a>
					</div>
					<div class="soolTypeSelect">
						<a href="getProductList.do?pType=3">
							<div>
								<img src="resources/img/icon-gwasilju.png" alt="메인 카테고리 아이콘" />
							</div> <label class="name">과실주</label>
						</a>
					</div>
					<div class="soolTypeSelect">
						<a href="getProductList.do?pType=4">
							<div>
								<img src="resources/img/icon-jeunglyujuju.png" alt="메인 카테고리 아이콘" />
							</div> <label class="name">증류주</label>
						</a>
					</div>
				</div>
			</div>
			<div class="divider"></div>
			<!-- 오늘의 추천 상품 (8개)soolRecommendWrapper  -->
			<div class="soolRcmWrapper">
				<div class="soolRcmHeader">
					<img src="resources/img/today-pick.png" alt="추천" width="45"
						height="45" />
					<div class="title">
						<div class="main-title">이번 주 희로애락 PICK!</div>
						<div class="sub-title">고민된다면 이 술 어때요?</div>
					</div>
				</div>
				<div class="soolRcmPrdListWrapper">
					<div class="rcmPrdListContent">
						<div class="rcmPrdListBox"
							style="margin-right: 15px; width: 265.25px">
							<div class="rcmPrd" id="rcmPrdb">
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="abc">
	
	</div>
	<%@ include file="WEB-INF/view/common/footer.jsp"%>
	<script src="resources/js/common.js"></script>
</body>
<script>
	function start() {
		$.ajax("mainData.do", {
			type: "get",
			dataType: "json",
			success: function(respData){
				let mainHtml = "";
				$.each(respData, function(index, mypage){
					mainHtml += "<div class=\"abcd\">";
					mainHtml += "<a href=\"detail.do?pCode=" + respData[index].pcode + "\">";
	
					mainHtml += "<div class=\"img-wrapper\">";
					mainHtml += "<span style=\"box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative;\">";
					mainHtml += "<span style=\"box-sizing: border-box; display: block; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 126.923% 0px 0px;\"></span>";
					mainHtml += "<img src=\"resources/alcohol_img/alcohol/" + respData[index].pctyimg + "\" decoding=\"async\" alt=\"detail-product\" data-nimg=\"responsive\" style=\"position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;\" />";
					mainHtml += "</span>";
					mainHtml += "</div>";
	
					mainHtml += "<div class=\"cardContentWrapper\">";
	
					mainHtml += "<div class=\"wrapper\">";
					mainHtml += "<div class=\"productName\">" + respData[index].pname + "</div>";
					mainHtml += "</div>";
	
					mainHtml += "<div class=\"wrapper\">";
					mainHtml += "<div class=\"priceWrapper\">";
					mainHtml += "<div class=\"flex original-wrapper\">";
					mainHtml += "<p class=\"originalPrice\">" + respData[index].pprice ;
					mainHtml += "<span>원</span>";
					mainHtml += "</p>";					
					mainHtml += "</div>";
					mainHtml += "</div>";
					mainHtml += "</div>";
					mainHtml += "</div>" 
					mainHtml += "</a>";
					mainHtml += "</div>";
					$("#rcmPrdb").html(mainHtml);
				});
			},
			error: function(){
				alert("실패");				
			}
		});
	}
	setTimeout(start, 0);
</script>
</html>