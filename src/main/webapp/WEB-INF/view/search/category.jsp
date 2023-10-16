<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cPath=request.getContextPath(); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리</title>
<link rel="stylesheet" href="<%=cPath %>/resources/css/category.css" />

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	function getProductList(data,selectValue){

		if (data == 1){
			var pType = 1;
		} else if(data == 2){
			var pType = 2;
		} else if(data == 3){
			var pType = 3;
		} else if(data == 4){
			var pType = 4;
		}
		
		$.ajax("getJsonProductList.do",{
			type: "get",
			data: {pType : pType, selectValue : selectValue},
			//dataType: "json",
			success: function(respData){
				var pType = data;
				console.log('pType : '+pType);
				
				location.href = "getProductList.do?pType="+pType;
			},
			error : function(respData){
				alert('error');
			}
		});
	}
	
	function ChangeValue(selectValue) {
		var pType = <%=session.getAttribute("pTypeNumber") %>;
		
		$.ajax("getJsonProductList.do",{
			type: "get",
			data: {pType : pType, selectValue : selectValue},
			//dataType: "json",
			success: function(respData){
				//var pType = pType;
				console.log('pType : '+pType);
				console.log('pType : '+selectValue);
				
				location.href = "getProductList.do?pType="+pType + "&selectValue=" + selectValue;
			},
			error : function(respData){
				alert('error');
			}
		});
	}
	
</script>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
<h1 id="pType">
</h1>

	<div class="container">
		<ul class="alcoholType">
			<a onclick="getProductList(1,1)"><li>탁주</li></a>
			<a onclick="getProductList(2,1)"><li>약·청주</li></a>
			<a onclick="getProductList(3,1)"><li>과실주</li></a>
			<a onclick="getProductList(4,1)"><li>증류주</li></a>
		</ul>
		<div id="disData">
		
		</div>
			<div class="typeInfo">
				<p>${pTypeTitle }</p>
				<span>${pTypeInfo }</span>
			</div>
			
			<div class="typeSort">
			
				<select id="select_value" onchange="ChangeValue(this.value)">
					<option value="0" selected>정렬순서</option>
					<option value="1">최신순</option>
					<option value="3">가격높은순</option>
					<option value="4">가격낮은순</option>
					
				</select>
			</div>
			
			<div>
				<table>
					<c:set var="i" value="0"/>
					<c:set var="j" value="4"/>
					<c:forEach var="result" items="${categoryList}">
						<c:if test="${i%j == 0 }">
						<tr>
						</c:if>
							<td>
								<a href="detail.do?pCode=${result.pcode }">
									<div class="pro_box"><img src="resources/alcohol_img/alcohol/${result.pctyimg }" alt="product_takju"></div>
									<p>${result.pname }</p>
									<p>가격: ${result.pprice }원</p>
									<p></p>
									<hr>
									<p>${result.pinfo }</p>
								</a>
							</td>
								
						<c:if test="${i%j == j-1 }">
						</tr>
						</c:if>
						<c:set var="i" value="${i+1 }"/>
					</c:forEach>
				</table>
		</div>
			
	</div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>