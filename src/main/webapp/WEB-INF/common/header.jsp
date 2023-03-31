<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="utf-8">

<head>
<script src="https://unpkg.com/phosphor-icons"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/spring-webmvc/5.3.8/spring-webmvc.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width,initial-scale=1">
  <meta charset="utf-8">


  <title>묻:mo_od</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

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

<style>
b{
font-size: 24px;
}
li {
   display: flex;
   align-items: center;
   margin: 30px;
   margin-bottom: 30px;
}
*{
font-family: 'SUIT-Regular', normal;font-weight:900;
}
@font-face {
    font-family: 'KimjungchulMyungjo-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/KimjungchulMyungjo-Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}


</style>
</head>

<body>


  <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

       <h1 class="logo"><a href="/" style="font-family:'궁서'; font-size: 50px;">묻:<b class="logo2" style="font-family:'KimjungchulMyungjo-Bold'; font-size: 56px;">mo_od</b></a></h1>
      <nav id="navbar" class="navbar">
        <ul>

          <li><a href="/products/A2categoryList"><b>가 구</b></a></li>
          <li><a href="/products/B0categoryList"><b>조 명</b></a></li>
          <li><a href="/products/C0categoryList"><b>수 납</b></a></li>
			<c:if test="${!empty login_info.id}">
               <c:choose>
               <c:when test="${login_info.id == 'admin' }">
               <li style="padding-left: 30px;margin: 30px 0px 30px 50px;width: 100px;"><a class="getstarted scrollto" href="/admin/chart"><b>Admin</b></a></li>
               </c:when>
               <c:otherwise>
               <li style="padding-left: 0px;margin: 30px 0px 30px 25px;width: 100px;"><a class="getstarted scrollto" href="/users/mypage"><b>Mypage</b></a></li>
               </c:otherwise>
               </c:choose>
               <li><a class="getstarted scrollto" href="/users/logout"><b>Logout</b></a></li>
               

            </c:if>
         <c:if test="${empty login_info.id}">
            <li style="margin: 30px 0px 30px 28px;width: 100px;"><a class="getstarted scrollto" href="/users/join" ><b>Join</b></a></li>
            <li><a class="getstarted scrollto" href="/users/login"><b>Login</b></a></li>
         </c:if>
        </ul>


        
        
        
        <i class="bi bi-list mobile-nav-toggle" style="color: white;"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

<script>
$(document).ready(function() {
    $('.cart-btn').click(function(e) {
        e.preventDefault(); // a 태그의 기본 동작인 페이지 이동을 막습니다.
        if (${empty login_info.id}) {
            if(confirm("로그인이 필요한 서비스입니다. 로그인 화면으로 이동할까요?")) {
                location.href = '/catelogin.do';
            }
        } else {
            location.href = '/cart.do';
        }
    });
});
</script>
<jsp:include page="/WEB-INF/common/RecentlyViewProduct.jsp"/>