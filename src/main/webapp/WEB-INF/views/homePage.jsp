<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html lang="en">
 <script src="https://unpkg.com/@phosphor-icons/web"></script>

<jsp:include page="../../WEB-INF/common/header.jsp" />

<body>

  <!-- ======= Hero Section ======= -->
  <section id="hero">
    <div class="hero-container">
      <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

        <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

        <div class="carousel-inner" role="listbox">

          <!-- Slide 1 -->
          <div class="carousel-item active" style="background-image: url(resources/assets/img/slide/mood.png);">
            <div class="carousel-container">
              <div class="carousel-content">
                <h2 class="animate__animated animate__fadeInDown">Grow Your Business</h2>
                <p class="animate__animated animate__fadeInUp">Ut velit est quam dolor ad a aliquid qui aliquid. Sequi ea ut et est quaerat sequi nihil ut aliquam. Occaecati alias dolorem mollitia ut. Similique ea voluptatem. Esse doloremque accusamus repellendus deleniti vel. Minus et tempore modi architecto.</p>
                <div>
                  <a href="#about" class="btn-get-started animate__animated animate__fadeInUp scrollto">Read More</a>
                </div>
              </div>
            </div>
          </div>

          <!-- Slide 2 -->
          <div class="carousel-item" style="background-image: url(resources/assets/img/slide/slide-2.jpg);">
            <div class="carousel-container">
              <div class="carousel-content">
                <h2 class="animate__animated animate__fadeInDown">Lorem Ipsum Dolor</h2>
                <p class="animate__animated animate__fadeInUp">Ut velit est quam dolor ad a aliquid qui aliquid. Sequi ea ut et est quaerat sequi nihil ut aliquam. Occaecati alias dolorem mollitia ut. Similique ea voluptatem. Esse doloremque accusamus repellendus deleniti vel. Minus et tempore modi architecto.</p>
              </div>
            </div>
          </div>

          <!-- Slide 3 -->
          <div class="carousel-item" style="background-image: url(resources/assets/img/slide/slide-3.jpg);">
            <div class="carousel-container">
              <div class="carousel-content">
                <h2 class="animate__animated animate__fadeInDown">Sequi ea ut et est quaerat</h2>
                <p class="animate__animated animate__fadeInUp">Ut velit est quam dolor ad a aliquid qui aliquid. Sequi ea ut et est quaerat sequi nihil ut aliquam. Occaecati alias dolorem mollitia ut. Similique ea voluptatem. Esse doloremque accusamus repellendus deleniti vel. Minus et tempore modi architecto.</p>
                
              </div>
            </div>
          </div>

        </div>

        <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
          <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
        </a>

        <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
          <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
        </a>

      </div>
    </div>
  </section><!-- End Hero -->

  <main id="main">
    

    <!-- ======= Portfolio Section ======= -->
    <section id="portfolio" class="portfolio">
      <div class="container">

        <div class="section-title">
          <h2>Popular Items</h2>
          <p>많은 사랑을 받고있는 mo_od 상품</p>
        </div>

        <div class="row">
          <div class="col-lg-12 d-flex justify-content-center">
            <ul id="portfolio-flters">
              <li data-filter="*" class="filter-active">전체보기</li>
              <li data-filter=".filter-app">가구</li>
              <li data-filter=".filter-card">조명</li>
              <li data-filter=".filter-web">수납</li>
            </ul>
          </div>
        </div>

        <div class="row portfolio-container">
        
	<c:forEach var="Alist" items="${Alist}" begin="0" end="0">
          <div class="col-lg-4 col-md-6 portfolio-item filter-app" onclick="location.href='${Alist.pro_number }'" style="cursor: pointer">
            <div class="portfolio-wrap">
              <img src="resources/assets/img/product/${Alist.pro_img1 }" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>${Alist.pro_name }</h4>
                <p><fmt:formatNumber value="${Alist.pro_price}" type="currency" currencySymbol="₩" /></p>
                <div class="portfolio-links">
                </div>
              </div>
            </div>
          </div>
          </c:forEach>

<c:forEach var="Blist" items="${Blist}" begin="0" end="0">
          <div class="col-lg-4 col-md-6 portfolio-item filter-card" onclick="location.href='${Blist.pro_number }'" style="cursor: pointer">
            <div class="portfolio-wrap">
              <img src="resources/assets/img/product/${Blist.pro_img1 }" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>${Blist.pro_name }</h4>
                <p><fmt:formatNumber value="${Blist.pro_price}" type="currency" currencySymbol="₩" /></p>
                <div class="portfolio-links">                
                </div>
              </div>
            </div>
          </div>
          </c:forEach>
		<c:forEach var="Clist" items="${Clist}" begin="0" end="0">
          <div class="col-lg-4 col-md-6 portfolio-item filter-web" onclick="location.href='${Clist.pro_number }'" style="cursor: pointer">
            <div class="portfolio-wrap">
              <img src="resources/assets/img/product/${Clist.pro_img1 }" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>${Clist.pro_name }</h4>
                <p><fmt:formatNumber value="${Clist.pro_price}" type="currency" currencySymbol="₩" /></p>
                <div class="portfolio-links">
                </div>
              </div>
            </div>
          </div>
          </c:forEach>

          <c:forEach var="Alist" items="${Alist}" begin="1" end="1">
          <div class="col-lg-4 col-md-6 portfolio-item filter-app" onclick="location.href='${Alist.pro_number }'" style="cursor: pointer">
            <div class="portfolio-wrap">
              <img src="resources/assets/img/product/${Alist.pro_img1 }" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>${Alist.pro_name }</h4>
                <p><fmt:formatNumber value="${Alist.pro_price}" type="currency" currencySymbol="₩" /></p>
                <div class="portfolio-links">
                </div>
              </div>
            </div>
          </div>
          </c:forEach>

          <c:forEach var="Blist" items="${Blist}" begin="1" end="1">
          <div class="col-lg-4 col-md-6 portfolio-item filter-card" onclick="location.href='${Blist.pro_number }'" style="cursor: pointer">
            <div class="portfolio-wrap">
              <img src="resources/assets/img/product/${Blist.pro_img1 }" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>${Blist.pro_name }</h4>
                <p><fmt:formatNumber value="${Blist.pro_price}" type="currency" currencySymbol="₩" /></p>
                <div class="portfolio-links">   
                </div>
              </div>
            </div>
          </div>
          </c:forEach>
          
          <c:forEach var="Clist" items="${Clist}" begin="2" end="2">
          <div class="col-lg-4 col-md-6 portfolio-item filter-web" onclick="location.href='${Clist.pro_number }'" style="cursor: pointer">
            <div class="portfolio-wrap">
              <img src="resources/assets/img/product/${Clist.pro_img1 }" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>${Clist.pro_name }</h4>
                <p><fmt:formatNumber value="${Clist.pro_price}" type="currency" currencySymbol="₩" /></p>
                <div class="portfolio-links">
                </div>
              </div>
            </div>
          </div>
          </c:forEach>

          <c:forEach var="Blist" items="${Blist}" begin="2" end="2">
          <div class="col-lg-4 col-md-6 portfolio-item filter-card" onclick="location.href='${Blist.pro_number }'" style="cursor: pointer">
            <div class="portfolio-wrap">
              <img src="resources/assets/img/product/${Blist.pro_img1 }" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>${Blist.pro_name }</h4>
                <p><fmt:formatNumber value="${Blist.pro_price}" type="currency" currencySymbol="₩" /></p>
                <div class="portfolio-links">   
                </div>
              </div>
            </div>
          </div>
          </c:forEach>

          <c:forEach var="Clist" items="${Clist}" begin="1" end="1">
          <div class="col-lg-4 col-md-6 portfolio-item filter-web" onclick="location.href='${Clist.pro_number }'" style="cursor: pointer">
            <div class="portfolio-wrap">
              <img src="resources/assets/img/product/${Clist.pro_img1 }" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>${Clist.pro_name }</h4>
                <p><fmt:formatNumber value="${Clist.pro_price}" type="currency" currencySymbol="₩" /></p>
                <div class="portfolio-links">
                </div>
              </div>
            </div>
          </div>
          </c:forEach>
          
          <c:forEach var="Alist" items="${Alist}" begin="2" end="2">
          <div class="col-lg-4 col-md-6 portfolio-item filter-app" onclick="location.href='${Alist.pro_number }'" style="cursor: pointer">
            <div class="portfolio-wrap">
              <img src="resources/assets/img/product/${Alist.pro_img1 }" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>${Alist.pro_name }</h4>
                <p><fmt:formatNumber value="${Alist.pro_price}" type="currency" currencySymbol="₩" /></p>
                <div class="portfolio-links">
                </div>
              </div>
            </div>
          </div>
          </c:forEach>

        </div>

      </div>
    </section><!-- End Portfolio Section -->

    <!-- ======= Team Section ======= -->
    <section id="team" class="team">
      <div class="container">

        <div class="section-title">
          <h2>interior portfolio</h2>
          <p>mo_od 배테랑 직원들의 전문시공</p>
        </div>

        <div class="row">
<c:if test="${!empty D0.pro_img1 }">
          <div class="col-xl-3 col-lg-4 col-md-6" onclick="location.href='D0categoryList'" style="cursor: pointer">
            <div class="member">
              <img src="resources/assets/img/product/${D0.pro_img1 }" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>침 실</h4>
                  <span>${D0.pro_maindesctitle}</span>
                </div>
              </div>
            </div>
          </div>
          </c:if>
<c:if test="${!empty D1.pro_img1 }">
          <div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.1s" onclick="location.href='D1categoryList'" style="cursor: pointer">
            <div class="member">
              <img src="resources/assets/img/product/${D1.pro_img1 }" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>거 실</h4>
                  <span>${D1.pro_maindesctitle}</span>
                </div>
              </div>
            </div>
          </div>
          </c:if>
<c:if test="${!empty D2.pro_img1 }">
          <div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.2s" onclick="location.href='D2categoryList'" style="cursor: pointer">
            <div class="member">
              <img src="resources/assets/img/product/${D2.pro_img1 }" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>주 방</h4>
                  <span>${D2.pro_maindesctitle}</span>
                </div>
              </div>
            </div>
          </div>
          </c:if>
<c:if test="${!empty D3.pro_img1 }">
          <div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.3s" onclick="location.href='D3categoryList'" style="cursor: pointer">
            <div class="member">
              <img src="resources/assets/img/product/${D3.pro_img1 }" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>욕 실</h4>
                  <span>${D3.pro_maindesctitle}</span>
                </div>
              </div>
            </div>
          </div>
</c:if>
        </div>

      </div>
    </section><!-- End Team Section -->



    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container">

        <div class="section-title">
          <h2>문의 사항</h2>
          <p></p>
        </div>

        <div class="row contact-info">

          <div class="col-md-4">
            <div class="contact-address">
              <i class="bi bi-geo-alt"></i>
              <h3>Address</h3>
              <address>EX) 인천 계양구 ~~동</address>
            </div>
          </div>

          <div class="col-md-4">
            <div class="contact-phone">
              <i class="bi bi-phone"></i>
              <h3>Phone Number</h3>
              <p><a href="tel:+155895548855">010-0000-0000</a></p>
            </div>
          </div>

          <div class="col-md-4">
            <div class="contact-email">
              <i class="bi bi-envelope"></i>
              <h3>Email</h3>
              <p><a href="mailto:info@example.com">sgreen12@naver.com</a></p>
            </div>
          </div>

        </div>

        <div class="form">
          <form action="forms/contact.php" method="post" role="form" class="php-email-form">
            <div class="row">
              <div class="col-md-6 form-group">
                <input type="text" name="name" class="form-control" id="name" placeholder="이름" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
              </div>
              <div class="col-md-6 form-group mt-3 mt-md-0">
                <input type="email" class="form-control" name="email" id="email" placeholder="이메일" data-rule="email" data-msg="Please enter a valid email"><br>
              </div>
              <div class="col-md-6 form-group">
                <input type="text" name="name" class="form-control" id="name" placeholder="휴대폰 - 없이 입력" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
              </div>
              <div class="col-md-6 form-group">
                <input type="text" name="name" class="form-control" id="name" placeholder="연락 가능 시간" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
              </div>
            </div>
            
            <div class="form-group mt-3">
              <textarea class="form-control" name="message" rows="5" placeholder="집구조,면적을 준비해주시면 빠른 상담진행이 가능합니다." required></textarea>
            </div>
            <div class="my-3">
              <div class="loading">Loading</div>
              <div class="error-message"></div>
              <div class="sent-message">Your message has been sent. Thank you!</div>
            </div>
            <div class="text-center"><button type="submit">보내기</button></div>
          </form>
        </div>

      </div>
    </section><!-- End Contact Section -->

  </main><!-- End #main -->
	
	<jsp:include page="../../WEB-INF/common/footer.jsp" />
	
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