<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
   <title>Home</title>
    <link rel="stylesheet" href="/resources/user/css/login.css"/>
    
     <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <!-- Favicons -->
  <link href="/resources/assets/img/favicon.png" rel="icon">
  <link href="/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  
  <!-- Vendor CSS Files -->
  <link href="/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/resources/assets/css/style.css" rel="stylesheet">
  
    
    
   
</head>
<body>

 <div class="login">
	<div class="form-login">
	<div style="font-size:30px;"><p style="display:inline; font-family:궁서;">묻:</p><p style="display:inline; font-family:굴림;">mo_od</p></div>
		<div class="social-icons">
  
			<form id="login" action="/adminLogin.do" class="input-group" method="post">
				<input type="text" name="id" class="input-field" placeholder="아이디"
					required autofocus> <br><br>
					<input type="password" name="pwd"
					class="input-field" placeholder="비밀번호" required>


				<c:if test="${ msg == false }">
					<br>
					<br>
					<p style="color: red; font-size: 15px;">존재하지 않는 아이디 또는 비밀번호입니다</p>
				</c:if>

				<br>
				<br>

				<button class="submit" style="color: white;">로그인</button>


			</form>
			    <button class="submit" style="width: 130px; float:left;">Login</button>
				<input type="button" class="submit" value="Client" onclick="location.href='/goclient.do'" style="width: 130px; float:right;">

		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/common/footer.jsp" />
<script type="text/javascript" src="/resources/user/js/main.js"></script>
</body>
</html>