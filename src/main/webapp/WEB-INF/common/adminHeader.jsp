<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>묻:mo_od</title>

  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

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
font-size: 18px;
}

li {
   display: flex;
   align-items: center;
   margin: 10px;
   margin-bottom: 0;
}
</style>


</head>
<body>
<!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">
      <h1 class="logo" style="font-family:'궁서'; font-size: 40px;"><a href="/admin/chart.do">묻:<span class="logo2" style="font-family:'굴림'; font-size: 40px;">mo_od</span></a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="/index.html" class="logo"><img src="resources/assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar">
        <ul class="headerMain">
          <li class="dropdown"><a href="/admin/adminProList.do" ><b>상품관리</b></a>
          
          		<ul>
                  <li><a href="/admin/insert.do"><b>상품등록</b></a></li>
                </ul>

          </li>
          <li class="dropdown"><a href="/admin/adminMemberList.do"><b>회원관리</b></a>
                
          </li>
          <li class="dropdown"><a href="/admin/admincate.do"><b>버킷</b></a>
                
          </li>
          <li class="dropdown"><a href="/admin/payment.do"><b>결제</b></a>
          </li>
           </ul>
           <ul>
          <!-- 알아서 이거 활용하자 -->
          <li><a href="/"><span class="getstarted scrollto"><b>클라이언트</b></span></a></li>
          
          <li><a href="/adminLogout.do"><span class="getstarted scrollto"><b>로그아웃</b></span></a></li>
       </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
              </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

</body>
</html>