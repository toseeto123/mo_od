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
  <link href="resources/assets/img/favicon.png" rel="icon">
  <link href="resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="resources/assets/css/style.css" rel="stylesheet">

<style>
	.navbar .headerMain li{ margin-right: 60px;
	
	}

.logo{ font-family:"궁서" }
.logo2{font-family:"굴림"}

</style>
<body>
<!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

      <h1 class="logo"><a href="/index.jsp">묻:<span class="logo2">mo_od</span></a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="/index.html" class="logo"><img src="resources/assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar">
        <ul class="headerMain">
          <li class="dropdown"><a href="#" >가 구</a>
                <ul>
                 <li><a href="/A0categoryList">매트리스</a></li>
                 <li><a href="/A1categoryList">침대 프레임</a></li>
                 <li><a href="/A2categoryList">소 파</a></li>

                </ul>
          </li>
          <li class="dropdown"><a href="#">조 명</a>
                <ul>
                  <li><a href="/B0categoryList">무드등</a></li>
                  <li><a href="/B1categoryList">스탠드조명</a></li>
                </ul>
          </li>
          <li class="dropdown"><a href="#">수 납</a>
                <ul>
                  <li><a href="/C1categoryList">옷장/행거</a></li>
                  <li><a href="/C0categoryList">서랍</a></li>
                </ul>
          </li>
          <li class="dropdown"><a href="#">시 공</a>
                <ul>
                 <li><a href="/D0categoryList">침 실</a></li>
                  <li><a href="/D1categoryList">거 실</a></li>
                  <li><a href="/D2categoryList">주 방</a></li>
                  <li><a href="/D3categoryList">욕 실</a></li>
                </ul>
          </li>
           </ul>
           <ul>
            
            <c:if test="${!empty login_info.id}">
               <li class="/login_info">${login_info.name } [ ${login_info.id } ]</li>
               <li><a href="/mypage.do"><span class="getstarted scrollto"> Mypage</span> </a></li>
               <li><a href="/logout.do"><span class="getstarted scrollto">Logout</span></a></li>
            </c:if>
            
         </ul>
          
          <!-- 알아서 이거 활용하자 -->
        <ul>
           <c:if test="${empty login_info.id}">
                            <li><a href="#">이건 알지?</a></li>
							<li><a class="getstarted scrollto" href="/join.do">회원가입</a></li>
							<li><a class="getstarted scrollto" href="/login.do">로그인</a></li>
							<li><a class="getstarted scrollto" href="/cate.do">장바구니</a></li>
			</c:if>
       </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
              </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

</body>


</head>

</html>