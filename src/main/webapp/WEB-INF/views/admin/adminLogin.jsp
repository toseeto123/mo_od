<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Home</title>
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
		font-size: 45px;
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
		width: 100%;
   		position: absolute;
   		bottom: -70px;
}
</style>


</head>
<body>
 <% session.invalidate(); %>
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
							style="text-align: center; line-height: 200px;">관리자 로그인 페이지</h2>

					</div>
				</div>
			</div>
		</div>
	</section>

	<form id="login" action="/adminLogin" method="post">
		<div class="d-flex align-items-center justify-content-center"
			style="height: 63vh;">
			<div class="row justify-content-center mt-5">
				<div class="col-md-6">
					<div class="card border-0">
						<div class="card-title text-center">
							<p style="display: inline; font-family: 궁서;">묻:</p>
							<p style="display: inline; font-family: 굴림;">mo_od</p>
						</div>
						<div class="row">

							<div class="card-body">
								<div class="form-group row">
									<div class="col-12">
										<input type="text" class="form-control" name="id"
											placeholder="아이디" required autofocus>
									</div>
								</div>
							</div>
							<div class="card-body">
								<div class="form-group row">
									<div class="col-12">
										<input type="password" class="form-control" name="pwd"
											placeholder="비밀번호" required>
									</div>
								</div>
							</div>
							<div class="card-body">
								<div class="form-group row">
									<div class="col-12">
										<c:if test="${ msg == false }">
											<p  style="color: red; font-size: 15px;">존재하지 않는 아이디 또는
												비밀번호입니다</p>
										</c:if>
									</div>
								</div>
							</div>

							<div class="card-body">
								<div class="form-group row">
									<div class="col-5">
										<input type="submit" value="로그인" class="form-control">
									</div>
									<div class="col-2"></div>
									<div class="col-5">
										<input type="button" class="form-control" value="Client"
											onclick="location.href='/goclient'">
									</div>
								</div>
							</div>
							<div class="card-body">
								<div class="col-12"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>



	<jsp:include page="/WEB-INF/common/footer.jsp" />
	<script type="text/javascript" src="/resources/user/js/main.js"></script>
</body>
</html>