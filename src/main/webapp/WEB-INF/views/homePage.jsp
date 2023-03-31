<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>

<html lang="en">
 <script src="https://unpkg.com/@phosphor-icons/web"></script>

<jsp:include page="/WEB-INF/common/header.jsp" />
<style>
*{
font-family: 'SUIT-Regular', normal;font-weight:900;
}
.animate__fadeInDown{
 font-size:30px;
}

.animate__fadeInUp {
 font-size:22px;
}

@media (max-width: 991px) {
  #hero .carousel-content h2 {
    font-size: 3rem;
  }

  #hero .carousel-content p {
    font-size: 1.5rem;
  }
}

@media (max-width: 767px) {
  #hero .carousel-content h2 {
    font-size: 2.5rem;
  }

  #hero .carousel-content p {
    font-size: 1.25rem;
  }
}

@media (max-width: 768px) {
    .section-title b {
      font-size: 3vw;
      letter-spacing: 3px;
    }
  }
  @media (max-width: 768px) {
    .carousel-content p {
      font-size: 16px;
    }
  }
  
  @media (min-width: 768px) and (max-width: 992px) {
    .carousel-content p {
      font-size: 20px;
    }
  }
  
  @media (min-width: 992px) {
    .carousel-content p {
      font-size: 24px;
    }
  }

</style>
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
                <h2 class="animate__animated animate__fadeInDown">나만의 작은 문명 mo_od </h2>
                <p class="animate__animated animate__fadeInUp"> 여러분의 취향을 가득담은 mo_od를 통해 나만의 문명을 완성해보세요</p>
              </div>
            </div>
          </div>

          <!-- Slide 2 -->
          <div class="carousel-item" style="background-image: url(resources/assets/img/slide/mood2.png);">
            <div class="carousel-container">
              <div class="carousel-content">
                <h2 class="animate__animated animate__fadeInDown">3월의 mo_od</h2>
                <p class="animate__animated animate__fadeInUp">3월의 mo_od로 가득채워진 아이템들을 만나보세요</p>
              </div>
            </div>
          </div>

          <!-- Slide 3 -->
          <div class="carousel-item" style="background-image: url(resources/assets/img/slide/mood3.png);">
            <div class="carousel-container">
              <div class="carousel-content">
                <h2 class="animate__animated animate__fadeInDown">컬러에 담겨진 mo_od </h2>
                <p class="animate__animated animate__fadeInUp"> 여러분의 감성을 자극하는 mo_od의 컬러를 만나보세요 </p>
                
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
    <section id="portfolio" class="portfolio" style="padding-bottom: 50px; padding-top: 50px;">
      <div class="container">
        <div class="section-title">
          <b style="font-size: 30px; color: #323232; letter-spacing: 5px;">많은 사랑을 받고있는 상품</b>
        </div>

       <!--  <div class="row">
          <div class="col-lg-12 d-flex justify-content-center">
            <ul id="portfolio-flters">
              <li data-filter="*" class="filter-active" style="font-size: 20px;">전체보기</li>
              <li data-filter=".filter-app" style="font-size: 20px;">가구</li>
              <li data-filter=".filter-card" style="font-size: 20px;">조명</li>
              <li data-filter=".filter-web" style="font-size: 20px;">수납</li>
            </ul>
          </div>
        </div> -->

        <div class="row portfolio-container">
        
		<c:forEach var="Alist" items="${Alist}" begin="0" end="0">
          <div class="col-lg-4 col-md-6 portfolio-item filter-app" onclick="location.href='/products/${Alist.pro_number }/${Alist.pro_name}/${Alist.pro_img1.substring(0, Alist.pro_img1.lastIndexOf('.'))}'" style="cursor: pointer">
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
          <div class="col-lg-4 col-md-6 portfolio-item filter-card" onclick="location.href='/products/${Blist.pro_number }/${Blist.pro_name}/${Blist.pro_img1.substring(0, Blist.pro_img1.lastIndexOf('.'))}'" style="cursor: pointer">
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
          <div class="col-lg-4 col-md-6 portfolio-item filter-web" onclick="location.href='/products/${Clist.pro_number }/${Clist.pro_name}/${Clist.pro_img1.substring(0, Clist.pro_img1.lastIndexOf('.'))}'" style="cursor: pointer">
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
          <div class="col-lg-4 col-md-6 portfolio-item filter-app" onclick="location.href='/products/${Alist.pro_number }/${Alist.pro_name}/${Alist.pro_img1.substring(0, Alist.pro_img1.lastIndexOf('.'))}'" style="cursor: pointer">
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
          <div class="col-lg-4 col-md-6 portfolio-item filter-card" onclick="location.href='/products/${Blist.pro_number }/${Blist.pro_name}/${Blist.pro_img1.substring(0, Blist.pro_img1.lastIndexOf('.'))}'" style="cursor: pointer">
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
          <div class="col-lg-4 col-md-6 portfolio-item filter-web" onclick="location.href='/products/${Clist.pro_number }/${Clist.pro_name}/${Clist.pro_img1.substring(0, Clist.pro_img1.lastIndexOf('.'))}'" style="cursor: pointer">
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
          
          <%--  <c:forEach var="Alist" items="${Alist}" begin="2" end="2">
          <div class="col-lg-4 col-md-6 portfolio-item filter-app" onclick="location.href='/products/${Alist.pro_number }/${Alist.pro_name}/${Alist.pro_img1.substring(0, Alist.pro_img1.lastIndexOf('.'))}'" style="cursor: pointer">
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
          
           <c:forEach var="Blist" items="${Blist}" begin="2" end="2">
          <div class="col-lg-4 col-md-6 portfolio-item filter-card" onclick="location.href='/products/${Blist.pro_number }/${Blist.pro_name}/${Blist.pro_img1.substring(0, Blist.pro_img1.lastIndexOf('.'))}'" style="cursor: pointer">
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
          <div class="col-lg-4 col-md-6 portfolio-item filter-web" onclick="location.href='/products/${Clist.pro_number }/${Clist.pro_name}/${Clist.pro_img1.substring(0, Clist.pro_img1.lastIndexOf('.'))}'" style="cursor: pointer">
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
          </c:forEach> --%>

        </div>

      </div>
    </section>

  </main><!-- End #main -->
</body>
	<jsp:include page="../../WEB-INF/common/footer.jsp" />
</html>