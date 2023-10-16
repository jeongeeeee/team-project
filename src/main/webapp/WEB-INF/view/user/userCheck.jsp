<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String name = (String) request.getParameter("userIdCheck");
	System.out.println(name);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
/* 중복아이디 존재하지 않는경우 */
	.id_input_re_1{
		color : green;
		display : none;
	}
	/* 중복아이디 존재하는 경우 */
	.id_input_re_2{
		color : red;
		display : none;
	}
	/* 아이디 미입력시*/
	.id_input_re_3{
		color : red;
		display : none;
	}
	/* 중복 닉네임 존재하지 않는경우 */
	.nick_input_re_1{
		color : green;
		display : none;
	}
	/* 중복 닉네임 존재하는 경우 */
	.nick_input_re_2{
		color : red;
		display : none;
	}
	/* 닉네임 미입력시 */
	.nick_input_re_3{
		color : red;
		display : none;
	}

	//-----------------------------
	formDiv{
		 width: 1180px;
		align-item:center;  
	}
	
	th {
		padding-right:20px;
		font-size: 18px;
		color: gray;
	}
	
 	input {
 		appearance: none;
    	outline: none;
    	width: 80%;
	  	height: 30px;
	    border: 1px solid rgb(224, 224, 224);
   		border-radius: 5px;
   		color: rgb(62, 62, 62);
    	line-height: 22px; 
 	}  
 	
	.sub-label{
		margin: 2px 0px;
	    font-size: 13px;
	    line-height: 100%;
	    color: rgb(178, 178, 178);
	}

	.radio {
	    align-items: center;
	    font-size: 13pt;
	    width: 15px;
	    height: 15px;
	}
	
	[type="radio"]:checked {
	  border: 0.3em solid #6D3114;
	}
	
	label {
	  font-size: 18px;
	  line-height: 2rem;
	  padding: 0.2em 0.4em;
	  vertical-align: middle;
	}
	
	
	/* 버튼 */
	.signupbtn, .cancelbtn {
		margin-top: 30px;
		width: 200px;
		height: 30px;
		background-color: #FFFFFF;
	    color: black;
	    border-radius: 8px;
	    border: #6D3114 solid 2px;
	    cursor: pointer;
	    font-size: 15px;
	    font-weight: bold;
	}
	.signupbtn:hover, .cancelbtn:hover{
		margin-top: 30px;
		width: 200px;
		height: 30px;
		background-color: #6D3114;
	    color: white;
	    border-radius: 8px;
	    border: #6D3114 solid 2px;
	    cursor: pointer;
	}
	
 	.idbtn, .nickbtn{
		cursor: pointer;
		width: 70px;
		position: absolute;
		margin-left: 10px;
	} 
	
	
	/* 생년월일 */
	#bir_wrap {
  	 	width: 100%;
    	display: flex;
	} 

	#bir_yy {
	    display: table-cell;
		
	}
	
	#bir_mm {
	    display: table-cell;
	    vertical-align: middle;
	}
	
	#bir_dd {
	    display: table-cell;
	    width: 90px;
	}
	
	#bir_mm, #bir_dd {
	    padding-left: 10px;
	} 

	.select {
		width: 100px;
		text-align: right;
	}
	
	select {
  		color: #444;
 		background-color: #fff;
 		height: 24px;
	 	border: 1px solid #aaa;
	 	border-radius: .5em;
	 	box-shadow: 0 1px 0 1px rgba(0,0,0,.04);
	}
	
	select:hover {
 		 border-color: #888;
	}
	.formDiv{
		margin : 50px auto;
	}
	h1{
		color: #6D3114;
	}
	
</style>
<script>
function characterCheck(obj){
    var reg = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 
    if(reg.test(obj.value)){
    alert("특수문자는 입력하실 수 없습니다.");
    obj.value = obj.value.substring( 0 , obj.value.length - 1 );
    }
  }

function joinGo(frm) {
	var regExp = /^\d{3}\d{3,4}\d{4}$/; //전화번호
	var regExp2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //이메일
	var regExp3 = /^[a-zA-Z][0-9a-zA-Z]{3,12}$/; //아이디 (3~12자, 문자(대/소문자), 숫자) 다시하기
	var regExp4 = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/; //닉네임(2~16자, 영어 OR 숫자 OR 한글로 구성)  */ 
	var regExp5 = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; //비밀번호 (8자 이상, 소문자/대문자/특수문자/숫자 포함 

	
     if (frm.userId.value==""){
             alert("아이디를 입력해주세요");
             return false;
     }else if (frm.userPwd.value==""){
             alert("비밀번호를 입력해주세요");
             return false;
     }else if (frm.userPassword2.value==""){
             alert("비밀번호 확인을 입력해주세요");
             return false;
     }else if (frm.userPwd.value != frm.userPassword2.value){
             alert("비밀번호가 일치하지 않습니다.");
             frm.memberPwd2.value = "";
             return false;
     }else if (frm.uname.value==""){
             alert("이름을 입력해주세요");
             return false;
     }else if (frm.uemail.value==""){
             alert("이메일을 입력해주세요");
             return false;
     }else if(frm.uphone.value=="") {
    	 alert("핸드폰 번호를 입력해주세요.");
    	 return false;
     }else if(frm.unick.value=="") {
    	 alert("닉네임을 입력해주세요.");
    	 return false;
     }else if(frm.addr1.value==""){
    	 alert("주소를 입력해주세요.");
    	 return false;
     }else if(frm.addr2.value==""){
    	 alert("도로명 주소를 입력해주세요.");
    	 return false;
     }else if(frm.addr3.value==""){
    	 alert("상세주소를 입력해주세요.");
    	 return false;
     }else if(frm.ubirth1.value==""){
    	 alert("생년월일을 입력해주세요.");
    	 return false;
     }else if(frm.ubirth2.value==""){
    	 alert("생년월일을 입력해주세요.");
    	 return false;
     }else if(frm.ubirth3.value==""){
    	 alert("생년월일을 입력해주세요.");
    	 return false;
     } //userCheckId
     else if(frm.userCheckId.value != "success") {
    	alert("아이디 중복체크를 해주세요.");
     	return false;
     } else if(frm.nickDuplication.value != "success") {
    	alert("닉네임 중복체크를 해주세요.");
    	return false;
     } 
	//----------------------------------------
	
	if(!regExp.test($("input[id='phone']").val())) {
	    alert("올바른 핸드폰 번호를 입력해주세요.");
	    return false;
	}
	if(!regExp2.test($("input[id='email']").val())) {
	    alert("올바른 이메일을 입력해주세요.");
	    return false;
	}
 	if(!regExp3.test($("input[id='id']").val())) {
	    alert("아이디를 3글자 이상 입력해주세요.");
	    return false;
 	}
 	if(!regExp5.test($("input[id='pwd']").val())) {
	    alert("비밀번호는 영문, 숫자, 특수문자를 혼합하여 입력해주세요.");
	    return false;
	}
 	if(!regExp4.test($("input[id='nickname']").val())) {
	    alert("닉네임을 2글자 이상 입력해주세요.");
	    return false;
	} 
 	 
 	alert(frm.membershipInsert.value);
    location.href="insertUser.do";
    frm.submit();

}

function Check() {
	var memberId = $('.id_input').val();			// .id_input에 입력되는 값
	var data = {memberId : memberId}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	
	$.ajax({
		type : "post",
		url : "userIdCheck.do",
		data : data,
		success : function(respData){
			if(respData == 'fail'){
				$('.id_input_re_2').css("display","inline-block");
				$('.id_input_re_1').css("display", "none");				
				$('.id_input_re_3').css("display", "none");
				let dispHtml = "<input type=\"hidden\" value=" + respData + " id=\"userCheckId\">";
				$("#user").html(dispHtml);
				respData.userIdCheck = "0";
			} else if (respData == 'blank') {
				$('.id_input_re_3').css("display","inline-block"); 
				$('.id_input_re_1').css("display", "none");				
				$('.id_input_re_2').css("display", "none");	
				let dispHtml = "<input type=\"hidden\" value=" + respData + " id=\"userCheckId\">";
				$("#user").html(dispHtml);
				respData.userIdCheck = "0";
			} else if (respData == 'success') {
				$('.id_input_re_1').css("display","inline-block");
				$('.id_input_re_2').css("display", "none");				
				$('.id_input_re_3').css("display", "none");
				let dispHtml = "<input type=\"hidden\" value=" + respData + " id=\"userCheckId\">";
				$("#user").html(dispHtml);
				respData.userIdCheck = "1";
			}
		}
		
	});
}

function Check2() {
	var memberNick = $('.nick_input').val();			
	var data = {memberNick : memberNick}				
	$.ajax({
		type : "post",
		url : "userNickNameCheck.do",
		data : data,
		success : function(result){
			if(result == 'fail'){
				$('.nick_input_re_2').css("display","inline-block");
				$('.nick_input_re_1').css("display", "none");				
				$('.nick_input_re_3').css("display", "none");	
				let dispHtml = "<input type=\"hidden\" value=" + result + " id=\"nickDuplication\">";
				$("#nick").html(dispHtml);
			} else if(result == 'success') {
				$('.nick_input_re_1').css("display","inline-block");
				$('.nick_input_re_2').css("display", "none");				
				$('.nick_input_re_3').css("display", "none");
				let dispHtml = "<input type=\"hidden\" value=" + result + " id=\"nickDuplication\">";
				$("#nick").html(dispHtml);
			}  else if(result == 'blank'){
				$('.nick_input_re_3').css("display","inline-block");
				$('.nick_input_re_1').css("display", "none");				
				$('.nick_input_re_2').css("display", "none");
				let dispHtml = "<input type=\"hidden\" value=" + result + " id=\"nickDuplication\">";
				$("#nick").html(dispHtml);
			} 
		}
		
	});
}

//아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
var pwdCheck = 0;

//재입력 비밀번호 체크하여 가입버튼 비활성화 또는 맞지않음을 알림.
function checkPwd() {
    var inputed = $('.pass').val();
    var reinputed = $('#pwd2').val();
    if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
        $(".signupbtn").prop("disabled", true);
        $(".signupbtn").css("background-color", "#aaaaaa");
        $("#pwd2").css("background-color", "#FFCECE");
	} else if (inputed == reinputed) {
         $("#repwd").css("background-color", "#B0F6AC");
         pwdCheck = 1;
         $(".signupbtn").prop("disabled", false);
         $("#pwd2").css("background-color", "#4CAF50");
         
    }
}


function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=addr1]").val(data.zonecode);
           $("[name=addr2]").val(fullRoadAddr);
           
       }
    }).open();
}


</script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<link rel="stylesheet" href="resources/css/common.css">
<%@include file ="../common/header.jsp" %>

</head>
<body>
	<div class="formDiv" align="center">
		<h1>회원가입</h1><br>
		<p>입력하신 개인정보는 회원님의 동의없이 제 3자에게 제공되지 않으며, 개인정보취급방침에 따로 보호되고 있습니다.</p><br>
		<hr width="700px">
		<form action="insertUser.do" method="post" style="display: block; margin: 20px;">
			<table style="margin: 0 auto; border-spacing: 5px;">
				<tr>
					<th height="50px">아이디</th>
					<td>
						<div>
							<input class="id_input" type="text" name="userId" id="id" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" >
							<input type="button" class="idbtn" name="userCheckButton" value="중복확인" onclick="Check();" >
						</div>
					</td>
				</tr>
				<tr>
					<td><!-- 여백 --></td>
					<td colspan="2">
						<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
						<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
						<span class="id_input_re_3">아이디를 입력해주세요.</span>
						
					</td>
				</tr>
				<tr>
					<th height="50px">비밀번호</th>
					<td>
						<input type="password" name="userPwd" id="pwd" oninput="checkPwd()"  required class="pass" >
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<div class="sub-label">*[비밀번호]영문, 숫자, 특수문자를 포함한 8~16자로 입력하세요.</div>
					</td>
				</tr>
				<tr>
					<th height="50px">비밀번호 확인</th>
					<td>
						<input type="password" name="userPassword2" id="pwd2" oninput="checkPwd()"  required class="pass">
					</td>
				</tr>
				<tr>
					<th height="50px">성명</th>
					<td>
						<input type="text" name="uname">
					</td>
				</tr>
<!-- 				<tr>
					<td></td>
					<td>
						<div class="sub-label">*[닉네임]2자 이상 입력하세요.</div>
					</td>
				</tr> -->
				<tr>
					<th height="50px">닉네임</th>
					<td>
						<input type="text" class="nick_input" name="unick" id="nickname" placeholder="2자 이상 입력하세요."> 
						<input type="button" class="nickbtn" name="userNickCheckButton" value="중복확인" onclick="Check2();">
					</td>
				</tr>
				<tr>
					<td><!-- 여백 --></td>
					<td colspan="2">
						<span class="nick_input_re_1">사용 가능한 닉네임입니다.</span>
						<span class="nick_input_re_2">닉네임이 이미 존재합니다.</span>
						<span class="nick_input_re_3">닉네임을 입력해주세요.</span>
					</td>
				</tr>	
				<tr>
				    <th height="50px">생년월일</th>
				  	<td>
               		<div class="birth">
                   	 <div id="bir_wrap">
                        <!-- BIRTH_YY -->
                        <div id="bir_yy">
                            <select name="ubirth1" class="select">
			  					<c:forEach var="i" begin="0" end="64" step="1">
			  						<option value="${2004-i }" >${2004 - i }</option>
			  					</c:forEach>
			  				 </select>년&nbsp;
                        </div>
                        <!-- BIRTH_MM -->
                        <div id="bir_mm">
                        	<select id="mm" name="ubirth2" class="select">
			  				 	<c:forEach var="i" begin="1" end="12" step="1">
                        			<option value="${i}" >${i}</option>
                        		</c:forEach>
                        	</select>월&nbsp;
                        </div>
                        <!-- BIRTH_DD -->
                        <div id="bir_dd" >
                            <span class="box">
                                <input type="text" id="dd" name="ubirth3" class="int" maxlength="2" style="text-align: right; height: 24px;" placeholder="일">
                            </span>
                        </div>

                    </div>
                    <span class="error_next_box"></span>    
                </div>
				</td>
				</tr>
				<tr>
					<th height="50px">성별</th>
					<td>
					<label><input type="radio" class="radio" name="ugender" value=0 checked/>남</label>
					<label><input type="radio" class="radio" name="ugender" value=1 />여</label>
					</td>
				</tr>
				<tr>
					<th height="50px">핸드폰 번호</th>
					<td>
						<input type="tel" name="uphone" id="phone"  maxlength="11" placeholder="01012345678('-'없이 작성)">
					</td>
				</tr>
				<tr>
					<th height="50px">이메일</th>
					<td>
						<input type="email" name="uemail" id="email">
					</td>
				</tr>
				<tr>
					<th height="50px">주소</th>
					<td>
						<div class="form-group">                   
							<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" >
							    <button type="button" class="btn btn-default" style="width: 120px; appearance: none; outline: none; border: 1px solid rgb(224, 224, 224);
   		border-radius: 5px;" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
							</div>
							<div class="form-group">
							    <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
							</div>
							<div class="form-group">
							    <input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text"  />
							</div>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<div class="clearfix" style="padding-left: 70px;">
						 	<button type="button" class="cancelbtn" onclick="history.go(-1)">취소하기</button>
							<input type="button" class = "signupbtn" name="membershipInsert" disabled="disabled" value="회원가입" onclick="joinGo(this.form)">
							<h1 id="user"></h1>
							<h1 id="nick"></h1>
						</div>
					</th>
				</tr>
			</table>
		</form>
	</div>
<%@include file ="../common/footer.jsp" %>
</body>
</html>