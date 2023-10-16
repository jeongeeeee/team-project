<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<style>
</style>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
				<div class="w3-center w3-large w3-margin-top">
					<h3>아이디 찾기</h3>
				</div>
				<div>
					<p>
						<label>name</label>
						<input type="text" name="uname" placeholder="이름을 입력해주세요." required>
					</p>
					
					<p>
						<label>Tel</label>
						<input type="text" name="uphone" placeholder="핸드폰 번호를 입력해주세요." required>
					</p>
					
					<p class="w3-center">
						<button type="button" onclick="findId_click()" >find</button>
						<button type="button" onclick="history.go(-1);">Cancel</button>
					</p>
				</div>
			
		</div>
	</div>
</body>
<script>
/* 아이디 찾기 */ 
//아이디 & 스토어 값 저장하기 위한 변수
	// 아이디 값 받고 출력하는 ajax
	function findId_click(){
		var name=$('#name').val()
		var phone=$('#phone').val()
		
		$.ajax({
			url:"./find_id",
			type:"POST",
			data:{"name":name, "phone":phone} ,
			success:function(data){
				if(data == 0){
					$('#id_value').text("회원 정보를 확인해주세요!");
					$('#name').val('');
					$('#phone').val('');
				} else {
					$('#id_value').text(data);
					$('#name').val('');
					$('#phone').val('');
					
				}
			},
			 error:function(){
	                alert("에러입니다");
	            }
		});
	};

const modal = document.getElementById("modal")
const btnModal = document.getElementById("find_id")

btnModal.addEventListener("click", e => {
    modal.style.display = "flex"
})

    


</script>

</html>

