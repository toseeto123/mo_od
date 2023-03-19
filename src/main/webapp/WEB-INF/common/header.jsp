<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="utf-8">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>묻:mo_od</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/assets/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/resources/assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Groovin - v4.10.0
  * Template URL: https://bootstrapmade.com/groovin-free-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
<script>
  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.")}var ch=function(){ch.c(arguments)};ch.q=[];ch.c=function(args){ch.q.push(args)};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x)}}if(document.readyState==="complete"){l()}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l)}})();

  ChannelIO('boot', {
    "pluginKey": "efdd564f-7f90-4014-9acf-5cdd2de2f595"
  });
</script>

  <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

       <h1 class="logo" style="font-family:'궁서';"><a href="/index.jsp">묻:<span class="logo2" style="font-family:'굴림';">mo_od</span></a></h1>
 
      <nav id="navbar" class="navbar">
        <ul>

          <li class="dropdown"><a href="#"><b>가 구</b> <i class="bi bi-chevron-down"></i></a>
                <ul>
                 <li><a href="/A0categoryList"><b>매트리스</b></a></li>
                 <li><a href="/A1categoryList"><b>침대 프레임</b></a></li>
                 <li><a href="/A2categoryList"><b>소 파</b></a></li>
                </ul>
          </li>
          <li class="dropdown"><a href="#"><b>조 명</b> <i class="bi bi-chevron-down"></i></a>
                <ul>
                  <li><a href="/B0categoryList"><b>무드등</b></a></li>
                  <li><a href="/B1categoryList"><b>스탠드조명</b></a></li>
                </ul>
          </li>
          <li class="dropdown"><a href="#"><b>수 납</b> <i class="bi bi-chevron-down"></i></a>
                <ul>
                  <li><a href="/C0categoryList"><b>옷장 / 행거</b></a></li>
                  <li><a href="/C1categoryList"><b>서 랍</b></a></li>
                </ul>
          </li>
          <li class="dropdown"><a href="#"><b>인테리어 시공</b> <i class="bi bi-chevron-down"></i></a>
                <ul>
                 <li><a href="/D0categoryList"><b>침 실</b></a></li>
                  <li><a href="/D1categoryList"><b>거 실</b></a></li>
                  <li><a href="/D2categoryList"><b>주 방</b></a></li>
                  <li><a href="/D3categoryList"><b>욕 실</b></a></li>
                </ul>
          </li>

              <c:if test="${!empty login_info.id}">
               <li class="/login_info">${login_info.name } [ ${login_info.id } ]</li>
               <li><a href="/mypage.do"><span class="getstarted scrollto"> Mypage</span> </a></li>
               <li><a href="/logout.do"><span class="getstarted scrollto">Logout</span></a></li>
               <li><a href="/cate.do"><span class="getstarted scrollto">Cate</span></a></li>
            </c:if>
            
            
            <!-- 알아서 이거 활용하자 -->

           <c:if test="${empty login_info.id}">
							<li><a class="getstarted scrollto" href="/join.do">회원가입</a></li>
							<li><a class="getstarted scrollto" href="/login.do">로그인</a></li>
							<li><a class="getstarted scrollto" href="/cate.do">장바구니</a></li>
			</c:if>



        </ul>
        
        
        
        
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

 
