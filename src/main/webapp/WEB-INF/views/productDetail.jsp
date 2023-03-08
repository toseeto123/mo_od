<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Portfolio Details - Groovin Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Favicons -->
<link href="resources/assets/img/favicon.png" rel="icon">
<link href="resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="resources/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="resources/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="resources/assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: Groovin - v4.10.0
  * Template URL: https://bootstrapmade.com/groovin-free-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
<jsp:include page="/WEB-INF/common/header.jsp" />

	<main id="main">
<c:if test="${list.pro_number eq list.pro_number }">
		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">

				<div class="d-flex align-items-center">
					
					<ol>
						<li><a href="#">대카테고리</a>&nbsp; <i class="fa fa-angle-right" aria-hidden="true"></i></li>
						
						<c:if test="${list.pro_categoryserial  eq 'A0' }">
						<li><a href="A0categoryList">매트리스</a>&nbsp; <i class="fa fa-angle-right" aria-hidden="true"></i></li>
						</c:if>
						<c:if test="${list.pro_categoryserial  eq 'A1' }">
						<li><a href="A1categoryList">침대프레임</a>&nbsp; <i class="fa fa-angle-right" aria-hidden="true"></i></li>
						</c:if>
						<c:if test="${list.pro_categoryserial  eq 'B0' }">
						<li><a href="B0categoryList">무드등</a>&nbsp; <i class="fa fa-angle-right" aria-hidden="true"></i></li>
						</c:if>
						<c:if test="${list.pro_categoryserial  eq 'B1' }">
						<li><a href="B1categoryList">스탠드조명</a>&nbsp; <i class="fa fa-angle-right" aria-hidden="true"></i></li>
						</c:if>
						<c:if test="${list.pro_categoryserial  eq 'C0' }">
						<li><a href="C0categoryList">옷장/행거</a>&nbsp; <i class="fa fa-angle-right" aria-hidden="true"></i></li>
						</c:if>
						<c:if test="${list.pro_categoryserial  eq 'C1' }">
						<li><a href="C1categoryList">서랍</a>&nbsp; <i class="fa fa-angle-right" aria-hidden="true"></i></li>
						</c:if> 
						
					</ol>
					<strong> ${list.pro_name}</<strong>
				</div>

			</div>
		</section>
		<!-- End Breadcrumbs -->
		

		<!-- ======= Portfolio Details Section ======= -->
		<section id="portfolio-details" class="portfolio-details">
			<div class="container">

				<div class="row gy-4">

					<div class="col-lg-8">
						<div class="portfolio-details-slider swiper">
							<div class="swiper-wrapper align-items-center">

								<div class="swiper-slide">
									<img src="resources/assets/img/product/${list.pro_img1}" alt="">
								</div>
								<c:if test="${!empty list.pro_img2}">
								<div class="swiper-slide">
									<img src="resources/assets/img/product/${list.pro_img2}" alt="">
								</div>
								</c:if>
								<c:if test="${!empty list.pro_img3}">
								<div class="swiper-slide">
									<img src="resources/assets/img/product/${list.pro_img3}" alt="">
								</div>
								</c:if>
								<c:if test="${!empty list.pro_img4}">
								<div class="swiper-slide">
									<img src="resources/assets/img/product/${list.pro_img4}" alt="">
								</div>
								</c:if>
								<c:if test="${!empty list.pro_img5}">
								<div class="swiper-slide">
									<img src="resources/assets/img/product/${list.pro_img5}" alt="">
								</div>
								</c:if>
								

							</div>
							<div class="swiper-pagination"></div>
						</div>
					</div>

					<div class="col-lg-4">
					<form>
						<div class="portfolio-info">
							<h3>${list.pro_name}</h3>
							<ul>
								<li><strong>서브상세설명</strong>: ${list.pro_subdesc}</li>
								<li><strong>제품번호</strong>: ${list.pro_serialnumber }</li>
								<li><strong>가 격</strong>: <fmt:formatNumber value="${list.pro_price}" type="currency" currencySymbol="₩" /></li>	
								<li><strong>옵 션</strong>:<br>
								<c:if test="${empty list.pro_option1}">
								<label for="chk_option" ><span class="chk_option">선택안함</span></label>
								<input type="radio" value="daaaa" id="chk_option" name="radioOption" checked="checked"><br>
								</c:if>
								
								
								<c:if test="${!empty list.pro_option1}">
								<label for="chk_option 1" ><span class="chk_option">${list.pro_option1}</span></label>
								<input type="radio" value="daaaa" id="chk_option 1" name="radioOption"><br>
								</c:if>
								
								
						 		<c:if test="${!empty list.pro_option2}">
								<label for="chk_option 2" ><span class="chk_option">${list.pro_option2}</span></label>
								<input type="radio" value="daaaa" id="chk_option 2" name="radioOption"><br>
								</c:if>
								
								</c:if>
								<c:if test="${!empty list.pro_option3}">
								<label for="chk_option 3" ><span class="chk_option">${list.pro_option3}</span></label>
								<input type="radio" value="daaaa" id="chk_option 3" name="radioOption"><br>
								</c:if>
								
								
								
								
							<li>				
							</ul>
							
						</div>


					<form method="get" action="/order/${login_info.userId}" class="order_form">
						<div class="portfolio-description">
							<h2>${list.pro_maindesctitle}</h2>
							<pre>${list.pro_maindesc }</pre>
							<input type="hidden" name="orders[0].bookId" value="${list.pro_number}">
							<input type="hidden" name="orders[0].bookCount" value="">
							<input type="button" value="장바구니" class="cateBtn"><br><br>
							<input type="submit" value="결제하기" class="payBtn">
						</div>
					</div>
					</form>
				
</form>

<style>
.chk_option{
	cursor: pointer;
}

.cateBtn , .payBtn{
	background-color: #c8936ed4;
	width: 416px;
	height: 50px;
	border : none;
	border-radius: 30px;
	box-shadow: 1px 1px 1px 1px lightgray;

	
	
}
</style>

				</div>

			</div>
		</section>
		<!-- End Portfolio Details Section -->
    <!-- ======= Team Section ======= -->
    <section id="team" class="team">
      <div class="container">

        <div class="section-title">
          <h2>관련 상품</h2>
          <p>내용 내용 내용 내용 내용</p>
        </div>

        <div class="row">

          <div class="col-xl-3 col-lg-4 col-md-6">
            <div class="member">
              <img src="resources/assets/img/team/team-1.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Walter White</h4>
                  <span>Chief Executive Officer</span>
                  <div class="social">
                    <a href=""><i class="bi bi-twitter"></i></a>
                    <a href=""><i class="bi bi-facebook"></i></a>
                    <a href=""><i class="bi bi-instagram"></i></a>
                    <a href=""><i class="bi bi-linkedin"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.1s">
            <div class="member">
              <img src="resources/assets/img/team/team-2.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Sarah Jhonson</h4>
                  <span>Product Manager</span>
                  <div class="social">
                    <a href=""><i class="bi bi-twitter"></i></a>
                    <a href=""><i class="bi bi-facebook"></i></a>
                    <a href=""><i class="bi bi-instagram"></i></a>
                    <a href=""><i class="bi bi-linkedin"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.2s">
            <div class="member">
              <img src="resources/assets/img/team/team-3.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>William Anderson</h4>
                  <span>CTO</span>
                  <div class="social">
                    <a href=""><i class="bi bi-twitter"></i></a>
                    <a href=""><i class="bi bi-facebook"></i></a>
                    <a href=""><i class="bi bi-instagram"></i></a>
                    <a href=""><i class="bi bi-linkedin"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.3s">
            <div class="member">
              <img src="resources/assets/img/team/team-4.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Amanda Jepson</h4>
                  <span>Accountant</span>
                  <div class="social">
                    <a href=""><i class="bi bi-twitter"></i></a>
                    <a href=""><i class="bi bi-facebook"></i></a>
                    <a href=""><i class="bi bi-instagram"></i></a>
                    <a href=""><i class="bi bi-linkedin"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Team Section -->
	</main>
	<!-- End #main -->

		<jsp:include page="/WEB-INF/common/footer.jsp" />

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="resources/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="resources/assets/js/main.js"></script>

</body>

</html>