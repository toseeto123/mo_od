<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<style>
.hover:hover { 
background: #da8862;
 } 
.fonthover { 
 	color: gray; 
 } 
.fonthover:hover {
	color: #da8862;
}
.imghover:hover {
	transform: scale(1.2);
}
footer {
	bottom: 0;
	left: 0;
	right: 0;
}
.box_list, .login_li {
   margin: 5px 5px;
}
</style>
<head>
<jsp:include page="/WEB-INF/common/header.jsp" />

<section id="hero" style="height: 350px;">
	<div class="hero-container">
		<div id="heroCarousel" data-bs-interval="5000"
			class="carousel slide carousel-fade" data-bs-ride="carousel">
			<ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

			<div class="carousel-inner" role="listbox">

				<!-- Slide 1 -->
				<div class="carousel-item active"
					style="background-image: url(/resources/assets/img/slide/loginimg.png); height: 500px;">
					<div class="carousel-container">
						<div class="carousel-content">
							<h2 class="animate__animated animate__fadeInDown">로그인</h2>
							<p class="animate__animated animate__fadeInUp">로그인을 하시면 다양한
								혜택을 누리실 수 있습니다.</p>
							<!--                         <div> -->
							<!--                            <a href="#about" -->
							<!--                               class="btn-get-started animate__animated animate__fadeInUp scrollto">Click</a> -->
							<!--                         </div> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<meta name="google-signin-client_id"
	content="38260405754-99qf9j81rp019ft343rpp1fmq378qabg.apps.googleusercontent.com">
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="/resources/user/css/login.css" />
<script type="text/javascript" src="/resources/user/js/main.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="/resources/user/js/googleLogin.js"></script>
<script async defer src="https://apis.google.com/js/api.js"
	onload="googleGapiLoaded()"></script>
<script async defer src="https://accounts.google.com/gsi/client"
	onload="googleGisLoaded()"></script>
<script>
	const result = "${msg}"
	if (result === "loginmsg") {
		alert('로그인이 필요한 서비스입니다. 로그인페이지로 이동합니다.');
	}
</script>

</head>

<body>

	<div class="login">
		<div class="form-login">

			<div class="social-icons">

				<form id="login" action="/users/login" class="input-group"
					method="post" style="margin-bottom: 15px;">
					<input type="text" name="id" class="input-field" placeholder=" 아이디"
						required autofocus style="border-radius: 3px;"> <input
						type="password" name="pwd" class="input-field" placeholder=" 비밀번호"
						required style="border-radius: 3px;">


					<c:if test="${ msg == false }">
						<br>
						<br>
						<p style="color: red; font-size: 15px; margin: 20px 70px 0;">존재하지 않는 아이디 또는 비밀번호입니다</p>
					</c:if>

					<br> <br>

					<button class="submit hover"
						style="color: white; border-radius: 2px;">로그인</button>


				</form>
				<ul class="login_link_box">
					<li class="login_li"style="margin-left: 0;"><a href="/users/searchId" class="fonthover">아이디
							찾기</a> &nbsp;</li>

					<li class="login_li"><a href="/users/searchPwd" class="fonthover">비밀번호
							찾기</a> &nbsp;</li>

					<li class="login_li"><a href="/users/join" class="fonthover">회원가입</a>
						&nbsp;</li>

				</ul>

				<!-- 			<a href="index.jsp" class="" style="color: black;">메인 페이지</a>  -->
				<!-- 			<a href="join.do" class="" style="color: black; margin: 0 15px 0 15px;">회원가입</a> -->
				<!-- 			<a href="" class="" style="color: black;">비밀번호재설정</a> -->



				<div class="social_login">
					<p class="snsname"
						style="margin-bottom: 10px; margin-top: 38px; color: #c8936ed4; font-size: 20px; font-weight: 700">간편
						로그인</p>
					<br>
					<ul class="social_logo" style="height: 150px; margin-left: -20px;">
						<li class="box_list"><a id="custom-login-btn"
							href="javascript:void(0);"
							onclick="window.open('${naverUrl}','/users/naverLogin','width=830,height=500,location=no,status=no,scrollbars=yes');">
								<img style="width: 50px;" src="/resources/user/img/naver.png"
								alt="naver" class="imghover"> <span class="box_list_txt">네이버</span>
						</a></li>


						<li class="box_list">

						 <!-- <a href="https://kauth.kakao.com/oauth/authorize?client_id=e862dc15e41ee83edaac20240a8bc9e5&redirect_uri=http://localhost:8080/users/kakaoLogin&response_type=code"> -->
 						<a href="https://kauth.kakao.com/oauth/authorize?client_id=e862dc15e41ee83edaac20240a8bc9e5&redirect_uri=http://mo-od.co.kr/users/kakaoLogin&response_type=code">  



								<img style="width: 50px;" src="/resources/user/img/kakao.png"
								alt="kakao" class="imghover"> <span class="box_list_txt">카카오</span>
						</a></li>

						<li class="box_list">
							<button
								style="background: transparent; border-color: transparent;"
								onclick="googleHandleAuthClick()">
								<img style="width: 50px;" src="/resources/user/img/google.png"
									alt="google" class="imghover"> <span class="box_list_txt"
									style="color: #c8936ed4;">구글</span>
							</button>
						</li>


					</ul>
					<br>

				</div>
			</div>
		</div>
	</div>
</body>
<footer><jsp:include page="/WEB-INF/common/footer.jsp" /></footer>
</html>