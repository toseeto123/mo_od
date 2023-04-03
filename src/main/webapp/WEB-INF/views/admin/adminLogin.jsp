<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>AdminHome</title>
<link rel="stylesheet" href="/resources/user/css/login.css" />

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<!-- Favicons -->
<link href="/resources/assets/img/favicon.png" rel="icon">
<link href="/resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="/resources/assets/vendor/animate.css/animate.min.css"
	rel="stylesheet">
<link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="/resources/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="/resources/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="/resources/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/resources/assets/css/style.css" rel="stylesheet">

<style>
	p{
		display: inline-block;
		font-size: 37px;
		font-weight: bold;
	}
	input[type=button], input[type=submit]{
		height: 50px;
		font-size: 27px;
		background: #323232;
		transition: all 0.5s;
		color: white;
	}
	input[type=text], input[type=password], input[type=button], input[type=submit]{
		padding: 0; margin: 0;
		margin-top: 35px;
	}
	
	.footer{
		width: 100%;
		position: absolute;

		bottom: 0;

	}

</style>


</head>
<body style="background-color:#f5f6f7;">
 <% session.invalidate(); %>


 
 
 	<div style="height: 60px;"></div>

 	<div class="login" id="login" style="margin: 0 auto;">

		<div class="form-login">

			<div>
				<div style="text-align: center;"><p style="display: inline; font-family: 궁서;">묻:</p>
							<p style="display: inline; font-family: 굴림;">mo_od</p><p style="padding: 0; margin: 0;">&nbsp; 관리자</p></div>

				<form id="login" action="/adminLogin" class="input-group"
					method="post">
					<input type="text" name="id" class="input-field" placeholder=" 아이디"
						required autofocus style="border-radius: 3px;"> <input
						type="password" name="pwd" class="input-field" placeholder=" 비밀번호"
						required style="border-radius: 3px;">


					<c:if test="${ msg == false }">

						<p style="color: red; font-size: 15px;">존재하지 않는 아이디 또는 비밀번호입니다</p>
					</c:if>
										<input class="submit hover" type="submit" value="로그인">


										<input type="button" class="submit hover" value="Client"
											onclick="location.href='/goclient'">


				</form>	
					


			</div>
		</div>
 

 
 
 	</div>

<div class="bottom" style="height: 60px;"></div>


<footer class="footer"><jsp:include page="/WEB-INF/common/footer.jsp" /></footer>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/user/js/main.js"></script>
<script>
	var footer = document.querySelector('footer');
	var bottom = document.querySelector('.bottom');
	window.addEventListener('wheel', function(){
		if(footer.getBoundingClientRect().top < bottom.getBoundingClientRect().bottom){
			footer.classList.remove('footer');	
		}else{
			footer.classList.add('footer');
		}
	})
	if(footer.getBoundingClientRect().top < bottom.getBoundingClientRect().bottom){
		footer.classList.remove('footer');	
	}else{
		footer.classList.add('footer');
	}
	
</script>

</body>


</html>