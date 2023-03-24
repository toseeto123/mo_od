<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="description">
<meta content="" name="keywords">

<jsp:include page="/WEB-INF/common/header.jsp" />

	<main id="main">
<c:if test="${list.pro_number eq list.pro_number }">
		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs" style="height: 70px; padding-bottom: 80px; font-size: 22px;">
			<div class="container">

				<div class="d-flex align-items-center">
					
					<ol>
						<li><a href="#">인테리어 시공</a>&nbsp; <i class="fa fa-angle-right" aria-hidden="true"></i></li>
						
						<c:if test="${list.pro_categoryserial  eq 'D0' }">
						<li><a href="#">침 실</a>&nbsp; <i class="fa fa-angle-right" aria-hidden="true"></i></li>
						</c:if>
						<c:if test="${list.pro_categoryserial  eq 'D1' }">
						<li><a href="#">거 실</a>&nbsp; <i class="fa fa-angle-right" aria-hidden="true"></i></li>
						</c:if>
						<c:if test="${list.pro_categoryserial  eq 'D2' }">
						<li><a href="#">주 방</a>&nbsp; <i class="fa fa-angle-right" aria-hidden="true"></i></li>
						</c:if>
						<c:if test="${list.pro_categoryserial  eq 'D3' }">
						<li><a href="#">욕 실</a>&nbsp; <i class="fa fa-angle-right" aria-hidden="true"></i></li>
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

					<div class="col-lg-8"  style="width: 700px; height: 700px;">
						<div class="portfolio-details-slider swiper" >
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
					<form method="post" action="userPayment.do">
						<div class="portfolio-info">
							<h3>${list.pro_maindesctitle}</h3>
							<ul>
								<li><pre>외에 여러포트폴리오가 준비되어있습니다.
집마다 구조가 다르다보니, 문의부탁드립니다.

<a href="#contact">*시공 문의</a></pre></li>				
							</ul>
							
						</div>
</c:if>
						<div class="portfolio-description">
							
							
						</div>
					</div>
					
				
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

<section id="contact" class="contact">
      <div class="container">

        <div class="section-title">
          <h2>문의사항</h2>
          <p>시공 관련 문의사항 아래연락처로 문의</p>
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
              <p><a href="tel:+155895548855">Ex) 010-1234-5678</a></p>
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
                <input type="email" class="form-control" name="email" id="email" placeholder="이메일" data-rule="email" data-msg="Please enter a valid email">
              </div>
            </div>
            <div class="form-group mt-3">
              <input type="text" class="form-control" name="subject" id="subject" placeholder="주제" required>
            </div>
            <div class="form-group mt-3">
              <textarea class="form-control" name="message" rows="5" placeholder="입력 해주세요" required></textarea>
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

	</main>
	<!-- End #main -->

		<jsp:include page="/WEB-INF/common/footer.jsp" />


