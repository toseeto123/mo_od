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
          <div class="carousel-item" style="background-image: url(resources/assets/img/slide/slide3.jpg);">
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
    <section id="portfolio" class="portfolio" style="padding-bottom: 80px; padding-top: 100px;">
      <div class="container">

        <div class="section-title">
          <b style="font-size: 30px; color: #c8936ed4;">많은 사랑을 받고있는 mo_od 상품</b>
        </div>

        <div class="row">
          <div class="col-lg-12 d-flex justify-content-center">
            <ul id="portfolio-flters">
              <li data-filter="*" class="filter-active" style="font-size: 20px;">전체보기</li>
              <li data-filter=".filter-app" style="font-size: 20px;">가구</li>
              <li data-filter=".filter-card" style="font-size: 20px;">조명</li>
              <li data-filter=".filter-web" style="font-size: 20px;">수납</li>
            </ul>
          </div>
        </div>

        <div class="row portfolio-container">
        
	<c:forEach var="Alist" items="${Alist}" begin="0" end="0">
          <div class="col-lg-4 col-md-6 portfolio-item filter-app" onclick="location.href='/product/${Alist.pro_number }'" style="cursor: pointer">
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
          <div class="col-lg-4 col-md-6 portfolio-item filter-card" onclick="location.href='/product/${Blist.pro_number }'" style="cursor: pointer">
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
          <div class="col-lg-4 col-md-6 portfolio-item filter-web" onclick="location.href='/product/${Clist.pro_number }'" style="cursor: pointer">
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
          <div class="col-lg-4 col-md-6 portfolio-item filter-app" onclick="location.href='/product/${Alist.pro_number }'" style="cursor: pointer">
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
          <div class="col-lg-4 col-md-6 portfolio-item filter-card" onclick="location.href='/product/${Blist.pro_number }'" style="cursor: pointer">
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
          <div class="col-lg-4 col-md-6 portfolio-item filter-web" onclick="location.href='/product/${Clist.pro_number }'" style="cursor: pointer">
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
          <div class="col-lg-4 col-md-6 portfolio-item filter-card" onclick="location.href='/product/${Blist.pro_number }'" style="cursor: pointer">
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
          <div class="col-lg-4 col-md-6 portfolio-item filter-web" onclick="location.href='/product/${Clist.pro_number }'" style="cursor: pointer">
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
          <div class="col-lg-4 col-md-6 portfolio-item filter-app" onclick="location.href='/product/${Alist.pro_number }'" style="cursor: pointer">
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
    <section id="team" class="team" style="padding-top: 0;">
      <div class="container">

        <div class="section-title">
          <b style="font-size: 30px; color: #c8936ed4;">mo_od 배테랑 직원들의 전문시공</b>
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




  </main><!-- End #main -->
	
	<jsp:include page="../../WEB-INF/common/footer.jsp" />
