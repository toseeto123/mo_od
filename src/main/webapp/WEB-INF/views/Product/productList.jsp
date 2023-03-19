<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Inner Page - Groovin Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/assets/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

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
   <section id="hero" style="height: 400px;">
      <div class="hero-container">
         <div id="heroCarousel" data-bs-interval="5000"
            class="carousel slide carousel-fade" data-bs-ride="carousel">
            <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

            <div class="carousel-inner" role="listbox">

               <!-- Slide 1 -->
               <div class="carousel-item active"
                  style="background-image: url(../resources/assets/img/slide/cate1.jpg); height: 500px;">
                  <div class="carousel-container">
                     <div class="carousel-content">
                        <h2 class="animate__animated animate__fadeInDown">
                        <c:forEach var="list" items="${list}" begin="0" end="0">
          		  <c:if test="${list.pro_categoryserial  eq 'A0' }">
                  매트리스
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'A1' }">
                  침대프레임
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'A2' }">
                  소 파
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'B0' }">
                  무드등
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'B1' }">
                  스탠드조명
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'C0' }">
                  옷장/행거
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'C1' }">
                  서랍
                  </c:if>
        </c:forEach>
                        </h2>
                        <p class="animate__animated animate__fadeInUp">묻:mo_od</p>
                        <div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>

<!-- ======= Breadcrumbs ======= -->
<c:forEach var="list" items="${list}" begin="0" end="0">
      <section id="breadcrumbs" class="breadcrumbs">
         <div class="container">

            <div class="d-flex align-items-center">
               
               <ol>
                  <li><a href="#">대카테고리</a>&nbsp; <i class="fa fa-angle-right" aria-hidden="true"></i></li>
                  
                  <c:if test="${list.pro_categoryserial  eq 'A0' }">
                  <li><a href="#">매트리스</a></li>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'A1' }">
                  <li><a href="#">침대프레임</a></li>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'A2' }">
                  <li><a href="#">소 파</a></li>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'B0' }">
                  <li><a href="#">무드등</a></li>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'B1' }">
                  <li><a href="#">스탠드조명</a></li>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'C0' }">
                  <li><a href="#">옷장/행거</a></li>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'C1' }">
                  <li><a href="#">서랍</a></li>
                  </c:if>
                  
               </ol>
            </div>

         </div>
      </section>
      </c:forEach>
      
      <!-- End Breadcrumbs -->

    <!-- ======= Team Section ======= -->
    <section id="team" class="team">
      <div class="container">

        <div class="section-title">       
    
        </div>

        <div class="row">
<c:forEach var="list" items="${list}">
          <div class="col-xl-3 col-lg-4 col-md-6">
          
            <div class="member" style="background-color: white;">  
 				<img src="${pageContext.request.contextPath}/resources/assets/img/product/${list.pro_img1}" alt="" class="img-fluid" style="width: 306px; height: 306px;">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>${list.pro_name}</h4>
                  <span><fmt:formatNumber value="${list.pro_price}" type="currency" currencySymbol="₩" /></span>
                  <div class="social">
                    <a href="/product/${list.pro_number}">상세보기</a>
                  </div>
                </div>
              </div>
            </div>
            
          </div>
          </c:forEach>


        </div>

      </div>
    </section><!-- End Team Section -->
<section>
<c:forEach var="list" items="${list}">

<!-- A0번 카테고리 -->
                  <c:if test="${list.pro_categoryserial  eq 'A0' }">
                  
                  <div style="display:inline-block;  position:absolute; left:50%; transform:translateX(-50%); font-size:20px;">
                  
                  
                  <c:if test="${prePage!=null }">
                  <a href="/A0categoryList/${prePage}">&lt;</a>
                  </c:if>
                  
                  <c:forEach items="${ pagingNo }" var="no">
                  <c:choose>
                  <c:when test="${selectPage == no}">
                  &nbsp;<a style="color:green" href="/A0categoryList/${no}">${no}</a>&nbsp;
                  </c:when>
                  <c:otherwise>
                  &nbsp;<a href="/A0categoryList/${no}">${no}</a>&nbsp;
                  </c:otherwise>
                  </c:choose>
                  </c:forEach>

                  <c:if test="${nextPage != null }">
                  <a href="/A0categoryList/${nextPage}">&gt;</a>
                  </c:if>
                  </div>
                  </c:if>
                  
                  
                  
<!-- A1번 카테고리 -->                  
                  <c:if test="${list.pro_categoryserial  eq 'A1' }">
                  
                  <div style="display:inline-block;  position:absolute; left:50%; transform:translateX(-50%); font-size:20px;">
                  
                  
                  <c:if test="${prePage!=null }">
                  <a href="/A1categoryList/${prePage}">&lt;</a>
                  </c:if>
                  
                  <c:forEach items="${ pagingNo }" var="no">
                  <c:choose>
                  <c:when test="${selectPage == no}">
                  &nbsp;<a style="color:green" href="/A1categoryList/${no}">${no}</a>&nbsp;
                  </c:when>
                  <c:otherwise>
                  &nbsp;<a href="/A1categoryList/${no}">${no}</a>&nbsp;
                  </c:otherwise>
                  </c:choose>
                  </c:forEach>

                  <c:if test="${nextPage != null }">
                  <a href="/A1categoryList/${nextPage}">&gt;</a>
                  </c:if>
                  </div>
                  
                  </c:if>
                  
                  
<!-- A2번 카테고리 -->                  
                  <c:if test="${list.pro_categoryserial  eq 'A2' }">
                  
                  <div style="display:inline-block;  position:absolute; left:50%; transform:translateX(-50%); font-size:20px;">
                  
                  
                  <c:if test="${prePage!=null }">
                  <a href="/A2categoryList/${prePage}">&lt;</a>
                  </c:if>
                  
                  <c:forEach items="${ pagingNo }" var="no">
                  <c:choose>
                  <c:when test="${selectPage == no}">
                  &nbsp;<a style="color:green" href="/A2categoryList/${no}">${no}</a>&nbsp;
                  </c:when>
                  <c:otherwise>
                  &nbsp;<a href="/A2categoryList/${no}">${no}</a>&nbsp;
                  </c:otherwise>
                  </c:choose>
                  </c:forEach>

                  <c:if test="${nextPage != null }">
                  <a href="/A2categoryList/${nextPage}">&gt;</a>
                  </c:if>
                  </div>
                  
                  </c:if>
                  
<!-- B0번 카테고리 -->                  
                  <c:if test="${list.pro_categoryserial  eq 'B0' }">
                  
                  <div style="display:inline-block;  position:absolute; left:50%; transform:translateX(-50%); font-size:20px;">
                  
                  
                  <c:if test="${prePage!=null }">
                  <a href="/B0categoryList/${prePage}">&lt;</a>
                  </c:if>
                  
                  <c:forEach items="${ pagingNo }" var="no">
                  <c:choose>
                  <c:when test="${selectPage == no}">
                  &nbsp;<a style="color:green" href="/B0categoryList/${no}">${no}</a>&nbsp;
                  </c:when>
                  <c:otherwise>
                  &nbsp;<a href="/B0categoryList/${no}">${no}</a>&nbsp;
                  </c:otherwise>
                  </c:choose>
                  </c:forEach>

                  <c:if test="${nextPage != null }">
                  <a href="/B0categoryList/${nextPage}">&gt;</a>
                  </c:if>
                  </div>
                  
                  </c:if>                  
                  

<!-- B1번 카테고리 -->                  
                  <c:if test="${list.pro_categoryserial  eq 'B1' }">
                  
                  <div style="display:inline-block;  position:absolute; left:50%; transform:translateX(-50%); font-size:20px;">
                  
                  
                  <c:if test="${prePage!=null }">
                  <a href="/B1categoryList/${prePage}">&lt;</a>
                  </c:if>
                  
                  <c:forEach items="${ pagingNo }" var="no">
                  <c:choose>
                  <c:when test="${selectPage == no}">
                  &nbsp;<a style="color:green" href="/B1categoryList/${no}">${no}</a>&nbsp;
                  </c:when>
                  <c:otherwise>
                  &nbsp;<a href="/B1categoryList/${no}">${no}</a>&nbsp;
                  </c:otherwise>
                  </c:choose>
                  </c:forEach>

                  <c:if test="${nextPage != null }">
                  <a href="/B1categoryList/${nextPage}">&gt;</a>
                  </c:if>
                  </div>
                  
                  </c:if>

<!-- C0번 카테고리 -->                  
                  <c:if test="${list.pro_categoryserial  eq 'C0' }">
                  
                  <div style="display:inline-block;  position:absolute; left:50%; transform:translateX(-50%); font-size:20px;">
                  
                  
                  <c:if test="${prePage!=null }">
                  <a href="/C0categoryList/${prePage}">&lt;</a>
                  </c:if>
                  
                  <c:forEach items="${ pagingNo }" var="no">
                  <c:choose>
                  <c:when test="${selectPage == no}">
                  &nbsp;<a style="color:green" href="/C0categoryList/${no}">${no}</a>&nbsp;
                  </c:when>
                  <c:otherwise>
                  &nbsp;<a href="/C0categoryList/${no}">${no}</a>&nbsp;
                  </c:otherwise>
                  </c:choose>
                  </c:forEach>

                  <c:if test="${nextPage != null }">
                  <a href="/C0categoryList/${nextPage}">&gt;</a>
                  </c:if>
                  </div>
                  
                  </c:if>

<!-- C1번 카테고리 -->                  
                  <c:if test="${list.pro_categoryserial  eq 'C1' }">
                  
                  <div style="display:inline-block;  position:absolute; left:50%; transform:translateX(-50%); font-size:20px;">
                  
                  
                  <c:if test="${prePage!=null }">
                  <a href="/C1categoryList/${prePage}">&lt;</a>
                  </c:if>
                  
                  <c:forEach items="${ pagingNo }" var="no">
                  <c:choose>
                  <c:when test="${selectPage == no}">
                  &nbsp;<a style="color:green" href="/C1categoryList/${no}">${no}</a>&nbsp;
                  </c:when>
                  <c:otherwise>
                  &nbsp;<a href="/C1categoryList/${no}">${no}</a>&nbsp;
                  </c:otherwise>
                  </c:choose>
                  </c:forEach>

                  <c:if test="${nextPage != null }">
                  <a href="/C1categoryList/${nextPage}">&gt;</a>
                  </c:if>
                  </div>
                  
                  </c:if>

                  
  </c:forEach>
</section>

  <!-- Vendor JS Files -->
  <script src="resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="resources/assets/js/main.js"></script>
<jsp:include page="/WEB-INF/common/footer.jsp" />
</body>

</html>