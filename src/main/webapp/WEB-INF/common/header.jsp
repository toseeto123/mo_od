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
b{
font-size: 18px;
}

li {
   display: flex;
   align-items: center;
   margin: 20px;
   margin-bottom: 20px;
}

</style>
</head>

<body>


  <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

       <h1 class="logo" style="font-family:'궁서'; font-size: 40px;"><a href="/">묻:<b class="logo2" style="font-family:'굴림'; font-size: 40px;">mo_od</b></a></h1>
 
      <nav id="navbar" class="navbar">
        <ul>

          <li class="dropdown"><a href="/AcategoryList"><b>가 구</b> <i class="bi bi-chevron-down"></i></a>
                <ul>
                 <li><a href="/A0categoryList"><b>매트리스</b></a></li>
                 <li><a href="/A1categoryList"><b>침대 프레임</b></a></li>
                 <li><a href="/A2categoryList"><b>소 파</b></a></li>
                </ul>
          </li>
          <li class="dropdown"><a href="/BcategoryList"><b>조 명</b> <i class="bi bi-chevron-down"></i></a>
                <ul>
                  <li><a href="/B0categoryList"><b>무드등</b></a></li>
                  <li><a href="/B1categoryList"><b>스탠드조명</b></a></li>
                </ul>
          </li>
          <li class="dropdown"><a href="/CcategoryList"><b>수 납</b> <i class="bi bi-chevron-down"></i></a>
                <ul>
                  <li><a href="/C0categoryList"><b>옷장 / 행거</b></a></li>
                  <li><a href="/C1categoryList"><b>서 랍</b></a></li>
                </ul>
          </li>
			<c:if test="${!empty login_info.id}">

               

               <li class="/login_info" style="color : white;">${login_info.name } [ ${login_info.id } ]</li>
               <c:choose>
               <c:when test="${login_info.id == 'admin' }">
               <li><a href="/admin/chart.do"><span class="getstarted scrollto"> <b>Admin</b></span> </a></li>
               </c:when>
               <c:otherwise>
               <li><a href="/mypage.do"><span class="getstarted scrollto"> <b>Mypage</b></span> </a></li>
               </c:otherwise>
               </c:choose>
               <li><a href="/logout.do"><span class="getstarted scrollto"><b>Logout</b></span></a></li>
               

            </c:if>
			<c:if test="${empty login_info.id}">
				<li><a class="getstarted scrollto" href="/join.do"><b>회원가입</b></a></li>
				<li><a class="getstarted scrollto" href="/login.do"><b>로그인</b></a></li>
				
			</c:if>
        </ul>

        
        
        
        <i class="bi bi-list mobile-nav-toggle"></i>
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
<jsp:include page="../../WEB-INF/common/RecentlyViewProduct.jsp"/>
 
