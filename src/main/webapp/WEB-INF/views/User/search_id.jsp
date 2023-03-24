<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>아이디 찾기</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<style type="text/css">
input[type=button] {
	background: #c8936ed4;
	border: 1px solid #c8936ed4;
	color: white;
	border-radius: 6px;
}
span.span{
	color: #c8936ed4;
}
.link {
	font-size: 20px;
	width:150px;
	height:auto;
}
footer {

}
</style>
<jsp:include page="/WEB-INF/common/header.jsp" />
</head>
<body>
	<section id="hero" style="height: 200px;">
		<div class="hero-container">
			<div id="heroCarousel" data-bs-interval="5000"
				class="carousel slide carousel-fade" data-bs-ride="carousel">
				<ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

				<div class="carousel-inner" role="listbox">

					<!-- Slide 1 -->
					<div class="carousel-item active"
						style="background-image: url(resources/assets/img/slide/cate1.jpg); height: 500px;">

						<h2 class="animate__animated animate__fadeInDown"
							style="text-align: center; line-height: 200px;">아이디 찾기</h2>

					</div>
				</div>
			</div>
		</div>
	</section>

	<div class="d-flex align-items-center justify-content-center"
		>
		<div class="row justify-content-center mt-5">
			<div class="col-md-6">
				<div class="card border-0">
					<div class="card-body">
						<br>
						<div class="row">

							<div class="card-body">
								<div class="form-group row">
									<label class="col-3 col-form-label" for="email">이메일</label>
									<div class="col-6">
										<input class="form-control" type="email" id="email"
											placeholder="이메일을 입력해주세요" required autofocus>

									</div>
									<input type="button" value="보내기" class="col-3"
										onclick="emailValidate()">
									<div class="col-3"></div>
									<div class="col-6">
										<span class="span" id="emailCheck"></span>
									</div>
								</div>

							</div>
							<div class="card-body">
								<div class="form-group row">
									<label class="col-3 col-form-label" for="number">인증번호</label>
									<div class="col-6">
										<input class="form-control" type="text" id="number"
											placeholder="인증번호 입력">
									</div>
									<input type="button" value="확인" class="col-3"
										onclick="numValidate()">
									<div class="col-3"></div>
									<div class="col-7">
										<span class="span" id="time"></span>
									</div>
								</div>
							</div>
							<div class="card-body">
							<div class="form-group row">
								<div class="col-3"></div>
								<div class="col-7">
									<span class="span" id="show"></span>
								</div>
								</div>
								<div class="card-body">
								<div class="form-group row" >
								<div class="col-6" style="padding-left:70px">
								<input type="button" class="link" value="비밀번호 찾기" onclick="location.href='/searchPwd'">
								</div>
								<div class="col-6 text-right" style="padding-right:70px">
								<input type="button" class="link" value="돌아가기" onclick="location.href='/login.do'">
								</div>
								</div>
							</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>

	<input type="hidden" id="status" value="id">

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		
	<script>
		let pluralId = [];
		let someId = [];
		let num = 0;
		let time;
		let interval;
		let email;
		let concatPluralId ;
		
		function emailValidate(){
			if (!document.getElementById("email").checkValidity()) {
				document.getElementById("email").reportValidity();
    	  } else {
				emailCheck();
    	  }
		}
		
		function numValidate(){
			if (!document.getElementById("email").checkValidity()) {
				document.getElementById("email").reportValidity();
    	  } else {
    		  numCheck();
    	  }
		}
		
		function emailCheck(){
			var xhr = new XMLHttpRequest();

			xhr.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					console.log(this.responseText)
					if (this.responseText != 'Success') {//만약 이메일이 없다면						
						document.getElementById('emailCheck').innerHTML = '존재하지 않는 이메일입니다.'						
						return;
					}					
						sendEmail();
						document.getElementById('emailCheck').innerHTML = '인증번호가 발송되었습니다.'
						
				}
			};
			xhr.open("get", "/searchEmail?email="+document.getElementById('email').value, true);
			xhr.send();
		}
		
		function sendEmail(){
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					num = 0;
					var data = JSON.parse(this.responseText);
					num = data.num;
					console.log(num)
					pluralId =[];
					someId = [];
					if(num > 0){
						email = document.getElementById('email').value;
						clearInterval(interval);
						time = 120;   	
			    		interval = setInterval(timer, 1000);
					}
					for(var i=0; i<data.id.length; i++){
                		pluralId.push(data.id[i].id);
                	}       
                	for(var i=0; i<pluralId.length; i++){
                		someId.push("<span style='color: #505050; cursor: pointer;' onClick='copy(this)'>"+pluralId[i]+"</span>")
                	}	
                	concatPluralId = someId.join("<span style='color: #505050';>, </span>");
				}
			};
			xhr.open("get", "/sendEmail?email="+document.getElementById('email').value, true);
			xhr.send();
		}
		
		function numCheck(){
			if(num > 0 && num == document.getElementById('number').value && time > 0){
				clearInterval(interval);
				document.getElementById('time').innerHTML = '인증성공';
				document.getElementById('show').innerHTML = "아이디는 " + concatPluralId + "입니다.";
			}
			if(num == 0){
				alert("이메일을 인증해주세요");
				document.getElementById('email').focus();
			}
		}
		
		function timer(){
			
			if(time > 0){				
				time = time - 1;
				var minute = time/60;
				var second = time%60;
				document.getElementById('time').innerHTML = 
					Math.floor(minute).toString().padStart(2, '0') + ' : ' + second.toString().padStart(2, '0');
			}else{				
				if(num>0){
					document.getElementById('time').innerHTML = '인증시간 만료';
				}
				clearInterval(interval);	
			}	
		}
		
		function copy(event){
  		  var temp = document.createElement("textarea");
  		  temp.value = event.innerText;
  		  document.body.appendChild(temp);
  		  temp.select();
  		  document.execCommand("copy");
  		  document.body.removeChild(temp);
  		  alert("복사되었습니다.");
  		}	
		
	</script>
		
    
    
	
</body>
<footer><jsp:include page="/WEB-INF/common/footer.jsp" /></footer>
</html>