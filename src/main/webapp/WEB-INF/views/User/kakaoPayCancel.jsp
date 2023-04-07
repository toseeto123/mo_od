<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<title>결제 취소</title>
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
background-color: #525252;
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
   border-bottom: 2px solid #525252;
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
   color: #525252;
   font-weight: bold;
}
.content_box {
   margin-top: 10px;
}
.mb-3{
 	font-size: 24px;
}
.btn-primary {
	background-color:#525252;
}

body {
	height:100%;
}

.returnbtn {
   color: white;
   background-color: #525252;
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
                        <h2 class="animate__animated animate__fadeInDown">결제 취소</h2>
                        <p class="animate__animated animate__fadeInUp">"${login_info.id}" 님 mo_od 를 이용해주셔서 감사합니다.</p>
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
               <li><span class="btnspan">02</span>주문서작성/결제</li>
               <li><span class="btnspan">03</span>결제완료</li>
               <li class="page_on"><span class="btnspan btnspan_on" >04</span>결제취소</li>
            </ol>
         </div>
         
         <div class="container">
      <div class="py-4 text-center"></div>

      <div class="row">
            <div class="col-md-12 order-md-1">
               <h2 class="mb-3" style="margin:18px 0 18px 0; color:#323232; font-size: 32px; font-weight: bold;"><i class="xi-user" style="color:#000;"></i> ${login_info.id}님주문 정보</h2>
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
         
               <h2 class="mb-3" style="margin:22px 0 22px 0; color:#323232; font-size: 32px; font-weight: bold;"><i class="xi-box" style="color:#000;"></i> 취소상품 정보</h2>
               <c:forEach var="info" items="${info}">
               	<div class="col-md-6 mb-3">
                     <label for="approved_at">결제승인시간 : </label> <strong>${info.approved_at}</strong>
                  </div>
                 <div class="col-md-6 mb-3">
                     <label for="firstName">상품명 : </label><strong>
                        ${info.item_name}</strong>
                  </div>
                  <div class="col-md-6 mb-3">
                     <label for="totalprice">총 결제 금액 : </label> <strong><fmt:formatNumber value="${info.amount.total}" type="currency" currencySymbol="₩" /></strong>
                  </div>
                  <div class="col-md-6 mb-3">
                     <label for="cancel_amount">취소된 금액 : </label> <strong><fmt:formatNumber value="${info.approved_cancel_amount.total}" type="currency" currencySymbol="₩" /></strong>
                  </div>

                  
               </div>
              
             </c:forEach>
                  </div>
               <hr>
               <label><a href="/"><button class="returnbtn"> mo_od의 또 다른 상품 구경하기</button></a></label> <br><br>
 
            </div>
      </div>
   </div>

</body>
<jsp:include page="/WEB-INF/common/footer.jsp" />
</html>