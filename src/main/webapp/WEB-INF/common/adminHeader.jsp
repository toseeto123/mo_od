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

  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

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
*{
font-family: 'SUIT-Regular', normal;font-weight:900;
}
b{
font-size: 20px;
}
li {
   display: flex;
   align-items: center;
   margin: 10px;
   margin-bottom: 0;
}
*{
font-family: 'SUIT-Regular', normal;font-weight:900;
}
</style>
</head>

<body>


  <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

       <h1 class="logo"><a href="/admin/chart" style="font-family:'궁서'; font-size: 50px;">묻:<b class="logo2" style="font-family:'굴림'; font-size: 56px;">mo_od</b></a></h1>
 
      <nav id="navbar" class="navbar">
        <ul>

          <li class="dropdown"><a href="/admin/adminProList"><b>상품관리</b></a>
                <ul>
                 <li><a href="/admin/insert"><b>상품등록</b></a></li>
                </ul>
          </li>
          <li class="dropdown"><a href="/admin/adminMemberList"><b>회원관리</b></a>
          </li>
          <li class="dropdown"><a href="/admin/admincate"><b>버 킷</b></a>
          </li>
          
          <li class="dropdown"><a href="/admin/payment"><b>결 제</b></a>
          </li>
          <li style="padding-left: 0px;margin: 40px 0px 30px 25px; width: 100px;"><a class="getstarted scrollto" href="/"><b>Client</b></a></li>
          <li><a class="getstarted scrollto" href="/adminLogout"><b>Logout</b></a></li>
		
        </ul>


        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->


<jsp:include page="/WEB-INF/common/RecentlyViewProduct.jsp"/>