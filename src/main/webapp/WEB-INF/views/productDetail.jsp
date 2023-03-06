<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
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
						<li><a href="#">대카테고리</a>&nbsp;<i class="fa fa-angle-right" aria-hidden="true"></i></li>
						
						<li><a href="proList.do">중카테고리</a> <i class="fa fa-angle-right" aria-hidden="true"></i></li>
						
					</ol>
					<strong>${list.pro_name}</<strong>
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
									<img src="resources/assets/img/portfolio/portfolio-1.jpg" alt="">
								</div>

								<div class="swiper-slide">
									<img src="resources/assets/img/portfolio/portfolio-2.jpg" alt="">
								</div>

								<div class="swiper-slide">
									<img src="resources/assets/img/portfolio/portfolio-3.jpg" alt="">
								</div>

							</div>
							<div class="swiper-pagination"></div>
						</div>
					</div>

					<div class="col-lg-4">
					<form>
						<div class="portfolio-info">
							<h3>${list.pro_name}</h3>
							<ul>
								<li><strong>서브상세설명</strong>: ${list.pro_desc1}</li>
								<li><strong>제품번호</strong>: Aa101</li>
								<li><strong>가 격</strong>:${list.pro_price}</li>	
								<li><strong>옵 션</strong>:
								<label for="chk_option" ><span class="chk_option">${list.pro_option1}</span></label>
								<input type="checkbox" value="daaaa" id="chk_option">&nbsp;&nbsp;
								
								<label for="chk_option 2" ><span class="chk_option">${list.pro_option2}</span></label>
								<input type="checkbox" value="daaaa" id="chk_option 2">&nbsp;&nbsp;
								
								<label for="chk_option 3" ><span class="chk_option">${list.pro_option3}</span></label>
								<input type="checkbox" value="daaaa" id="chk_option 3">&nbsp;&nbsp;
							<li>				
							</ul>
							
						</div>

						<div class="portfolio-description">
							<h2>상세설명-제목</h2>
							<p>${list.pro_desc2}</p>
							<input type="submit" value="결제하기" class="payBtn">
						</div>
					</div>
					
</c:if>					
</form>

<style>
.chk_option{
	cursor: pointer;
}

.payBtn{
	background-color: red;
	width: 416px;
	height: 50px;
	
	
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