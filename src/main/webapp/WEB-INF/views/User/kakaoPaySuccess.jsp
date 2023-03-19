<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>



<jsp:include page="/WEB-INF/common/header.jsp" />


   <section id="hero" style="height: 400px;">
      <div class="hero-container">
         <div id="heroCarousel" data-bs-interval="5000"
            class="carousel slide carousel-fade" data-bs-ride="carousel">
            <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

            <div class="carousel-inner" role="listbox">

               <!-- Slide 1 -->
               <div class="carousel-item active"
                  style="background-image: url(resources/assets/img/slide/cate1.jpg); height: 500px;">
                  <div class="carousel-container">
                     <div class="carousel-content">
                        <h2 class="animate__animated animate__fadeInDown">결제 완료</h2>
                        <p class="animate__animated animate__fadeInUp">"${login_info.id}" 님 mo_od 를 이용해주셔서　 감사합니다.</p>
                        <div>
                           <a href="/mypage.do" class="btn-get-started animate__animated animate__fadeInUp scrollto">결제 내역</a>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
결제일시:     [[${info.approved_at}]]<br/>
주문번호:    [[${info.partner_order_id}]]<br/>
상품명:    [[${info.item_name}]]<br/>
상품수량:    [[${info.quantity}]]<br/>
결제금액:    [[${info.amount.total}]]<br/>
결제방법:    [[${info.payment_method_type}]]<br/>

<h2>[[${info}]]</h2>




<jsp:include page="/WEB-INF/common/footer.jsp" />