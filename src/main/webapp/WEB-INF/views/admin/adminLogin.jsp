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
	body{
		background-color:#f5f6f7;
	}
	p{
		display: inline-block;
		font-size: 36px;
		font-weight: bold;
	}
	input[type=button], input[type=submit]{
		height: 50px;
		font-size: 27px;
		background: #c8936ed4;
		border: 1px solid #c8936ed4;
		color: white;
		border-radius: 6px;
	}
	input[type=text], input[type=password]{
		font-size: 23px;
	}
	
	footer{
		position: absolute;		
		bottom: 0;
		width: 100%;
	}
</style>


</head>
<body>
 <% session.invalidate(); %>
 
 

 
 
 
 	<div class="login" style="margin-top: 140px;">
		<div class="form-login">

			<div class="social-icons">
				<div style="text-align: center;"><p style="display: inline; font-family: 궁서;">묻:</p>
							<p style="display: inline; font-family: 굴림;">mo_od</p><p>&nbsp; 관리자</p></div>

				<form id="login" action="/adminLogin" class="input-group"
					method="post" style="margin-bottom: 15px;">
					<input type="text" name="id" class="input-field" placeholder=" 아이디"
						required autofocus style="border-radius: 3px;"> <input
						type="password" name="pwd" class="input-field" placeholder=" 비밀번호"
						required style="border-radius: 3px;">


					<c:if test="${ msg == false }">
						<br>
						<br>
						<p style="color: red; font-size: 15px;">존재하지 않는 아이디 또는 비밀번호입니다</p>
					</c:if>

					<br> <br>


										<input class="submit hover" style="width: 150px; color: white; border-radius: 2px;" type="submit" value="로그인">


										<input type="button" style="width: 150px; margin-left: 80px; color: white; border-radius: 2px;" class="submit hover" value="Client"
											onclick="location.href='/goclient'">


				</form>
			

				<!-- 			<a href="index.jsp" class="" style="color: black;">메인 페이지</a>  -->
				<!-- 			<a href="join.do" class="" style="color: black; margin: 0 15px 0 15px;">회원가입</a> -->
				<!-- 			<a href="" class="" style="color: black;">비밀번호재설정</a> -->



				<div class="social_login" style="height: 100px;">
				
					

				</div>
			</div>
		</div>
	</div>
 
 
 
 




	<jsp:include page="/WEB-INF/common/footer.jsp" />
	<script type="text/javascript" src="/resources/user/js/main.js"></script>
</body>
</html>