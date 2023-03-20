<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<title>결제</title>

<link rel="canonical"
   href="https://getbootstrap.com/docs/4.6/examples/checkout/">



<!-- Bootstrap core CSS -->
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">



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
   font-size: 16px;
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
      font-size: 12px;
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
   font-size: 28px;
   color: #222222;
}

.order_wrap .order_tit ol li {
   float: left;
   font-size: 14px;
   color: #d1d1d1;
}

.order_wrap .order_tit li span {
   font-size: 16px;
   font-weight: bold;
}

.order_wrap .order_tit .page_on {
   color: #c8936ed4;
   font-weight: bold;
}
.content_box {
   margin-top: 10px;
}
</style>
<!-- Custom styles for this template -->
<link href="form-validation.css" rel="stylesheet">
<!-- jQuery -->
<script type="text/javascript"
   src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>
<jsp:include page="../../common/header.jsp" />
<body class="bg-light">
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
                        <h2 class="animate__animated animate__fadeInDown">주문 | 결제</h2>
                        <p class="animate__animated animate__fadeInUp">주문하시기 전에
                           회원정보와 결제금액을 반드시 확인하시기 바랍니다.</p>
                        <div>
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
               <li class="page_on"><span class="btnspan btnspan_on">02</span>주문서작성/결제</li>
               <li><span class="btnspan">03</span>주문완료</li>
            </ol>
         </div>
         </div>

   <div class="container">
      <div class="py-4 text-center"></div>

      <div class="row">

         <form class="needs-validation" novalidate action="/kakaoPay"
            method="post">
            <div class="col-md-12 order-md-1">
               <h4 class="mb-3">${login_info.id}님주문정보</h4>
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

               <div class="mb-3"><c:forEach var="orderprice" items="${orderprice}">
                  <label for="address">주문번호 : </label> <strong>${orderprice.orderId }</strong>
                  </c:forEach>
               </div>

               <hr class="mb-4">

               <%-- <h4 class="mb-3">단품 상품정보</h4>

               <div class="row">
                  <div class="col-md-6 mb-3">
                     <label for="cc-name"></label> 
                     <img alt="" src="${pageContext.request.contextPath}/resources/assets/img/product/" style="width: 80px; height: 80px;">
                      <small class="text-muted">상품명 :</small>
                  </div>
                  <div class="col-md-6 mb-3">
                     <label for="cc-number">가격 : </label><br><small class="text-muted">상품디테일명 : </small>
                  </div>
                     <div class="invalid-feedback">여기다가 가격정보입력</div><br>
                     <!--  userPaymentDatail에 나중에 ordernumber로 받아서 넘기-->
                  <hr class="mb-4"> --%>
               <h4 class="mb-4">결제 상품정보</h4>
               <c:forEach var="list" items="${list}">
                  <input type="hidden" name="pro_name" value=${list.pro_name }>



                  <div class="row">
                     <div class="col-md-6 mb-3">
                        <label for="cc-name"></label> <img alt=""
                           src="${pageContext.request.contextPath}/resources/assets/img/product/${list.pro_img1}"
                           style="width: 100px; height: 100px; margin-bottom: 10px;">

                        <div style="display: inline-block;">
                           <small class="text-muted">상품명 : ${list.pro_name}<br>옵 션 : ${list.pro_option}<br>설 명 : ${list.pro_maindesctitle}
                           </small>
                        </div>
                     </div>
                     <div class="col-md-6 mb-3">
                        <label for="cc-number">상품금액 : <fmt:formatNumber value="${list.pro_price}" type="currency" currencySymbol="₩" /></label><br><label for="cc-number">수 량 : ${list.amount}</label><br><label for="cc-number">총 금액 : <fmt:formatNumber value="${list.total}" type="currency" currencySymbol="₩" /></label>
                     </div>
                     
      
                     <br>
                     <!--  userPaymentDatail에 나중에 ordernumber로 받아서 넘기-->
                     <hr class="mb-4">

                  </div>
               </c:forEach>

               <c:set var="totalPrice" value="0" />
               <c:forEach var="list" items="${list}">
                  <c:set var="totalPrice" value="${totalPrice + list.pro_price}" />
               </c:forEach>
               <c:forEach var="orderprice" items="${orderprice}">
                  <button class="btn btn-primary btn-lg btn-block" type="submit" id="apibtn"><fmt:formatNumber value="${orderprice.price}" type="currency" currencySymbol="₩" />원 결제하기</button>
                  <input type="hidden" name="pro_price" value=${orderprice.price }>
                  <input type="hidden" name="orderId" value=${orderprice.orderId }>
                  <input type="hidden" name="userno" value=${login_info.no }>
                  </c:forEach>
                  
            </div>


         </form>
      </div>
   </div>



   </div>



   <script
      src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"></script>
   <script>
      window.jQuery
            || document
                  .write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')
   </script>
   <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

   <script src="form-validation.js"></script>

   <form method="post" action="/kakaoPay"></form>

   <script>
    var IMP = window.IMP; 
    IMP.init("imp40061745"); 
    var today = new Date();   
    var hours = today.getHours(); // 시
    var minutes = today.getMinutes();  // 분
    var seconds = today.getSeconds();  // 초
    var milliseconds = today.getMilliseconds();
    var makeMerchantUid = hours +  minutes + seconds + milliseconds;

   $("#apibtn").click(function () {
      // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
      // ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
      IMP.request_pay({
         pg : 'kakao',  //nicepay=nice.id , kcp=kcp.id, kginicis=html5_inicis.id
            pay_method : 'card',
            merchant_uid: "IMP"+makeMerchantUid, 
            name : '당근 10kg',
            amount : 1004,
            buyer_email : 'Iamport@chai.finance',
            buyer_name : '포트원 기술지원팀',
            buyer_tel : '010-1234-5678',
            buyer_addr : '서울특별시 강남구 삼성동',
            buyer_postcode : '123-456'
            
         }, function (rsp) {
            console.log(rsp);
         if (rsp.success) {
            var msg = '결제가 완료되었습니다.';
            msg += '결제 금액 : ' + rsp.paid_amount;
            // success.submit();
            // 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
            // 자세한 설명은 구글링으로 보시는게 좋습니다.
         } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
         }
            alert(msg);
      });
   }); 
</script>


   <jsp:include page="../../common/footer.jsp" />