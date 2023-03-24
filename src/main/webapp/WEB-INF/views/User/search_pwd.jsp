<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비밀번호 재설정</title>
<style>
input[type=button] {
	background: #c8936ed4;
	border: 1px solid #c8936ed4;
	color: white;
	border-radius: 6px;
}

span.span {
	color: #c8936ed4;
}
.modal-dialog {
  display: flex;
  align-items: center;
  min-height: calc(100% - 3.5rem);
}
.link {
	font-size: 20px;
	width:150px;
	height:auto;
}
footer {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
}
</style>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
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
							style="text-align: center; line-height: 200px;">비밀번호 재설정</h2>

					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="d-flex align-items-center justify-content-center"
		style="height: height: 500px;">
		<div class="row justify-content-center mt-5">
			<div class="col-md-6">
				<div class="card border-0">
					<div class="card-body">


						<div class="row">

							<div class="card-body">
								<div class="form-group row">
									<label class="col-3 col-form-label" for="id">아이디</label>
									<div class="col-6">
										<input type="text" class="form-control" id="id" name="id"
											placeholder="아이디를 입력해주세요" required autofocus>
									</div>
									<input type="button" class="col-3" value="아이디 확인"
										onClick="idValidateForm(); idCheck()">
									<div class="col-3"></div>
									<div class="col-7">
										<span class="span" id="idCheck"></span>
									</div>
								</div>
							</div>

							<div class="card-body">
								<div class="form-group row">
									<label class="col-3 col-form-label" for="email">이메일</label>

									<div class="col-6">
										<input type="text" class="form-control" id="email"
											name="email" placeholder="이메일을 입력해주세요" required>
									</div>
									<input type="button" class="col-3" value="보내기"
										onclick="idValidateForm(); validateForm(); emailCheck()">
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
										<input type="text" class="form-control" id="number"
											placeholder="인증번호 입력">
									</div>
									<input type="button" class="col-3" value="확인"
										onClick="validateForm(); idValidateForm(); numCheck(document.getElementById('number').value); validate()">
									<div class="col-3"></div>
									<div class="col-7">
										<span class="span" id="time"></span> <input type="hidden"
											id="status" value="pwd"> <input type="hidden"
											id="storage">
									</div>
								</div>
							</div>
							<div class="card-body">

								<div class="form-group row">
									<div class="col-6" style="padding-left:70px">
										<input type="button" class="link" value="아이디 찾기" onclick="location.href='/searchId'">
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


	<div class="modal fade" id="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">비밀번호 재설정</h5>
					<button type="button" class="close"
						onClick="$('#myModal').modal('hide');" data-dismiss="modal"
						aria-label="Close">
						<span class="span" aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="d-flex align-items-center justify-content-center">


						<div class="card-body">
							<div class="form-group">
								<label for="password">새로운 비밀번호</label> <input type="password"
									id="password" class="form-control" required onFocus="this.value = ''">
							</div>
							<div class="form-group">
								<label for="confirm-password">비밀번호 확인</label> <input
									type="password" id="confirmPassword" class="form-control"
									required onFocus="this.value = ''">
							</div>
							<div class="form-group text-center">
								<input type="button" onClick="passwordValidateForm()" value="비밀번호 재설정">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/user/js/idPwdFind.js"></script>

	<script>
	const modalButton = document.getElementById('modalButton');
	function numCheck(number) {										
		if (num != 0) {
			if (num == number && time > 0) {
				clearInterval(interval);
				document.getElementById('time').innerHTML = '인증완료';
				$('#myModal').modal('show');
			} else if (time <= 0) {
				document.getElementById('time').innerHTML = '인증시간 만료';
			}
		}

	}
	
	function passwordChange(){
		
		const xhr = new XMLHttpRequest();
		const url = "/passwordChange?id="+document.getElementById('storage').value+"&pwd="+document.getElementById('password').value;
		xhr.open("GET", url);
		xhr.onreadystatechange = function () {
		    if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
		        const data = xhr.responseText;
		        if(data == 'Success'){
		        	location.href='/login.do';
		        }else{
		        	alert('비밀번호가 변경되지 않았습니다.')
		        }
		    }
		};
		xhr.send();
	}
	
	
    function passwordValidateForm() {
  	  // 폼 요소의 유효성 검사 수행
  	  if (!document.getElementById("password").checkValidity()) {				
  	    document.getElementById("password").reportValidity();
  	  } else if(document.getElementById("password").checkValidity()){
  	  	  if(!document.getElementById("confirmPassword").checkValidity()){  		
  	  		  document.getElementById("confirmPassword").reportValidity();  
  	  	  }else if(document.getElementById("confirmPassword").checkValidity()){
  	  		if(document.getElementById("password").value == document.getElementById("confirmPassword").value){
  	  			passwordChange()
  	  		}else{
  	  			alert("비밀번호가 일치하지 않습니다. 다시 입력해주십시오.");
  	  			 document.getElementById("confirmPassword").focus();
  	  		}
  	  	  }				
  	  }
  	  

  	}
			
	</script>


</body>
<footer><jsp:include page="/WEB-INF/common/footer.jsp" /></footer>
</html>