<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
   content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.101.0">
<title>결제완료</title>
<style>

.bd-placeholder-img {
   font-size: 1.125rem;
   text-anchor: middle;
   -webkit-user-select: none;
   -moz-user-select: none;
   -ms-user-select: none;
   user-select: none;
}

@media ( min-width : 768px) {
   .bd-placeholder-img-lg {
      font-size: 3.5rem;
   }
}

img {
   width: 15vmin;
   height: 15vmin;
}


ol {
   display: flex;
   flex-wrap: wrap;
   justify-content: center;
   align-items: center;
   margin: 0;
   padding: 0;
   list-style: none;
   margin-bottom: 0;
   
}

li {
   display: flex;
   align-items: center;
   margin: 10px;
   margin-bottom: 0;
}

li .btnspan {
   display: inline-flex;
   justify-content: center;
   align-items: center;
   width: 30px;
   height: 30px;
   border-radius: 50%;
   background-color: #ccc;
   margin-right: 5px;
   font-size: 20px;
   color: #fff;
}
li .btnspan_on{
background-color: #c8936ed4;
}

@media only screen and (max-width: 768px) {
   ol {
      position: fixed;
      bottom: 0;
      left: 0;
      width: 100%;
      background-color: #f8f9fa;
      padding: 10px;
      box-sizing: border-box;
      z-index: 999;
      
   }
   li {
      margin: 5px;
   }
   li .btnspan {
      width: 20px;
      height: 20px;
      font-size: 18px;
   }
}
.order_wrap {
   max-width: 1200px;
   width: 100%;
   margin: auto;
}

@media only screen and (max-width: 768px) {
   .order_wrap {
      max-width: 768px;
   }
}

@media only screen and (max-width: 576px) {
   .order_wrap {
      max-width: 576px;
   }
}

.order_wrap .order_tit {
   overflow: hidden;
   border-bottom: 2px solid #c8936ed4;
   margin-bottom: 10px;
}

.order_wrap .order_tit ol {
   float: right;
   line-height: 62px;
}

.order_wrap .order_tit h2 {
   float: left;
   font-size: 32px;
   color: #222222;
}

.order_wrap .order_tit ol li {
   float: left;
   font-size: 20px;
   color: #d1d1d1;
}

.order_wrap .order_tit li span {
   font-size: 22px;
   font-weight: bold;
}

.order_wrap .order_tit .page_on {
   color: #c8936ed4;
   font-weight: bold;
}
.content_box {
   margin-top: 10px;
}
.mb-3{
 	font-size: 24px;
}
.btn-primary {
	background-color:#c8936ed4;
}

body {
	height:100%;
}
a {
 font-size: 20px;
}
.returnbtn {
   background-color: #c8936ed4;
   width: 416px;
   height: 50px;
   border : none;
   border-radius: 30px;
   box-shadow: 1px 1px 1px 1px lightgray;
}

</style>
</head>
<jsp:include page="/WEB-INF/common/header.jsp" />
<body>

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
                        <p class="animate__animated animate__fadeInUp">"${login_info.name}"님 mo_od를 <br> 이용해주셔서 감사합니다.</p>
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
      <div class="content_box">
      <div class="order_wrap" style="position: relative;">
         <div class="order_tit">
            <ol>
               <li><span class="btnspan">01</span>장바구니</li>
               <li><span class="btnspan">02</span>주문서작성/결제</li>
               <li class="page_on"><span class="btnspan btnspan_on" >03</span>주문완료</li>
            </ol>
         </div>
         
         <div class="container">
      <div class="py-4 text-center"></div>

      <div class="row">
            <div class="col-md-12 order-md-1">
               <h4 class="mb-3">주문자 정보</h4>
               <div class="row">
                  <div class="col-md-6 mb-3">
                     <label for="firstName">성 함 : </label><strong>
                        ${login_info.name}</strong>
                  </div>
                  <div class="col-md-6 mb-3">
                     <label for="lastName">전화번호 : </label> <strong>${login_info.phone}</strong>
                  </div>
                  <div class="col-md-6 mb-3">
                     <label for="address">주소 : </label> <strong>${login_info.adr}</strong>
                  </div>
                  <div class="col-md-6 mb-3">
                     <label for="lastName">E-mail : </label> <strong>${login_info.email}</strong>
                  </div>

               </div>
		
               <div class="mb-3">
                  <label for="address">주문번호 : </label> <strong>${info.partner_order_id }</strong>
               </div>
				
			  <hr>
         
               <h4 class="mb-4">결제 상품정보</h4>
               <c:forEach var="info" items="${info}">
                 <div class="col-md-6 mb-3">
                     <label for="firstName">상품명 : </label><strong>
                        ${info.item_name}</strong>
                  </div>
                  <div class="col-md-6 mb-3">
                     <label for="lastName">주문 수량 : </label> <strong>${info.quantity}</strong>
                  </div>
                  <div class="col-md-6 mb-3">
                     <label for="address">결제 금액 : </label> <strong>${info.amount.total}</strong>
                  </div>
                  <div class="col-md-6 mb-3">
                     <label for="lastName">결제승인시간 : </label> <strong>${info.approved_at}</strong>
                  </div>
				
               </div>
              
		
             </c:forEach>
                  </div>
               <hr>
               <label><a href="/mo_od"><button class="returnbtn"> mo_od의 또 다른 상품 구경하기</button></a></label> <br><br>
               
 
 			
 
            </div>
      </div>
   </div>
<%-- 결제일시:     [[${info.approved_at}]]<br/>
주문번호:    [[${info.partner_order_id}]]<br/>
상품명:    [[${info.item_name}]]<br/>
상품수량:    [[${info.quantity}]]<br/>
결제금액:    [[${info.amount.total}]]<br/>
결제방법:    [[${info.payment_method_type}]]<br/> --%>

<%-- <h2>[[${info}]]</h2> --%>

</body>
<jsp:include page="/WEB-INF/common/footer.jsp" />
</html>