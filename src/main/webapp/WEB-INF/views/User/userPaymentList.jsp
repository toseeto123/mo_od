<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/common/header.jsp" />
<script src="https://unpkg.com/phosphor-icons"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/spring-webmvc/5.3.8/spring-webmvc.min.js"></script>
<meta charset="UTF-8">

<title>결제상세</title>
<style>
section {
   width: 1000px;
   margin: 0 auto;
}
dl, ul, ol, li {
   list-style: none;
}

.content_box {
   float: left;
   width: 100%;
   background-color: white;
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

.price_sum {
   margin: 40px 100px 50px;
   padding: 20px 40px 25px 40px;
   border: 2px solid #c8936ed4;
   border-radius: 5px;
   height: 300px;
}

.price_sum_cont {
   display: table;
   float: right;
   text-align: right;
}

.price_sum_cont .price_sum_list {
   position: relative;
}

.price_sum_cont .price_sum_list dl {
   display: table-cell;
   padding: 5px 10px 5px 10px;
   font-size: 16px;
   text-align: right;
   display: table-cell;
}

.price_sum_cont .price_sum_list dl {
   display: block;
}

ol {
   display: flex;
   flex-wrap: wrap;
   justify-content: center;
   align-items: center;
   margin: 0;
   padding: 0;
   list-style: none;
}

li {
   display: flex;
   align-items: center;
   margin: 10px;
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

li .btnspan_on {
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
.btn-primary {
	background-color:#c8936ed4;
}


    .dropdown-toggle {
    width: 1180px;
        font-size: 20px;
        padding: 10px 20px;
        margin: 10px;
    }

.dropdown-menu {
  max-height: 500px;
  overflow-y: auto;
  width: 100%;
  padding: 30px;
}
footer{
   width: 100%;
   position: absolute;
   bottom: 0;
}



</style>
</head>
<body style="margin: 0 auto;">


   <section>
      <ul class="nav nav-pills nav-justified">
        <li class="nav-item" >
          <a class="nav-link active" href="/users/mypage" style="background: #c8936ed4; color:white;">회원 정보</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/users/bucket" style="background: #c8936ed4; color:white;">장바 구니</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/products/payMypage" style="background: #c8936ed4; color:white;">결제 내역</a>
        </li>
      </ul>
   </section>
   <div class="content_box">

      <div class="order_wrap" style="position: relative;">
         <div class="order_tit">
         </div>
         <c:choose>
         <c:when test="${empty orders }"> <h2 style="text-align: center; margin-top: 280px; margin-bottom: 285px;">결제 내역이 존재하지 않습니다.</h2></c:when>
         <c:otherwise>
            <div class="dropdown">
 <c:forEach var="orderid" items="${orderid}">
  <button style="background: #AD8E70;"class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton${orderid.orderId}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    주문번호: ${orderid.orderId} /결제일:${orderid.approved_at}
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton${orderid.orderId}">
  
        <form action="/User/kakaoPayCancel">
    <c:forEach var="order" items="${orders}">
      <c:if test="${order.orderId == orderid.orderId}">
    <input type="hidden" value="${order.orderId }" name="orderId">
  <input type="hidden" value="${order.tid }" name="tid">
    <input type="hidden" value="${order.pro_number }" name="pro_number">
    <input type="hidden" value="${order.price }" name="price">
 <div class="deleteplz" style="display:flex; flex-wrap: wrap; align-items:center;  border-bottom: 1px solid lightgray; margin-bottom: 50px; padding-bottom: 30px;" >

  <img src="/resources/assets/img/product/${order.pro_img1 }"
  alt="${order.pro_name}"
  title="${order.pro_name}"
  class="img-fluid"
  style="width: 150px; height: 150px; margin-right: 30px; max-width: 100%;">

<div style="display: flex; flex-direction: column; flex-grow: 1; font-size: 1.2em; margin: 10px 0;">
  <div style="text-align: left; margin-bottom: 10px;">
    <span>상품명: <small>${order.pro_name}</small></span><br>
    <span>옵션: <small>${order.pro_option}</small></span><br>
    <span>상품정보: <small>${order.pro_maindesctitle}</small></span>
  </div>

  <div style="text-align: left;">
    <span>수량: <small style="display: inline;">${order.count}</small></span><br>
    <span>가격: <small class="total"><fmt:formatNumber value="${order.price}" type="currency" currencySymbol="₩" /></small></span>
  </div>
</div>

</div>
      </c:if>
    </c:forEach>
    
    <input type="submit" value="주문취소" class=".btn-primary">
        </form>
  </div>
</c:forEach>
</div>
         </c:otherwise>
         </c:choose>
      </div>
   </div>
<script>
$(function() {
	  $('.dropdown-toggle').click(function() {
	    var orderId = $(this).attr('id').replace('dropdownMenuButton', '');
	    var dropdownMenu = $('.dropdown-menu').filter(function() {
	      return $(this).attr('aria-labelledby') == 'dropdownMenuButton' + orderId;
	    });
	    $('.dropdown-menu').not(dropdownMenu).hide();
	    dropdownMenu.slideToggle();
	    $(this).text(function(i, text){

	    });
	  });

	  $('.dropdown-item').click(function() {
	    var orderId = $(this).data('orderid');
	    console.log('Menu item clicked for order: ' + orderId);
	  });
	});

</script>
<jsp:include page="/WEB-INF/common/footer.jsp" />
</body>
</html>