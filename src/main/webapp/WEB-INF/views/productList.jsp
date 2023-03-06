<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Inner Page - Groovin Bootstrap Template</title>
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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
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

<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">

				<div class="d-flex align-items-center">
					
					<ol>
						<li><a href="#">대카테고리</a>&nbsp;<i class="fa fa-angle-right" aria-hidden="true"></i></li>
						
						<li><a href="#">중카테고리</a></li>
						
					</ol>
				</div>

			</div>
		</section>
		<!-- End Breadcrumbs -->

    <!-- ======= Team Section ======= -->
    <section id="team" class="team">
      <div class="container">

        <div class="section-title">
          <h2>중카테고리명</h2>
        </div>

        <div class="row">
<c:forEach var="list" items="${list}">
          <div class="col-xl-3 col-lg-4 col-md-6">
            <div class="member">
              <img src="resources/assets/img/team/team-1.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>${list.pro_name}</h4>
                  <span>${list.pro_desc1}</span>
                  <div class="social">
                    <a href="${list.pro_number }">상세보기</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          </c:forEach>


        </div>

      </div>
    </section><!-- End Team Section -->



  <!-- Vendor JS Files -->
  <script src="resource/assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="resource/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resource/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="resource/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="resource/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="resource/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="resource/assets/js/main.js"></script>
<jsp:include page="/WEB-INF/common/footer.jsp" />
</body>

</html>