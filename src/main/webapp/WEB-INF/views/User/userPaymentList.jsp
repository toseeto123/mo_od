<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script src="https://unpkg.com/phosphor-icons"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/spring-webmvc/5.3.8/spring-webmvc.min.js"></script>
   <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<meta charset="UTF-8">

<title>결제상세</title>
<style>

section {
   width: 1000px;
   margin: 0 auto;
   padding-bottom : 0px;
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
   border-bottom: 2px solid #525252;
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
   color: #525252;
   font-weight: bold;
}

.price_sum {
   margin: 40px 100px 50px;
   padding: 20px 40px 25px 40px;
   border: 2px solid #525252;
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
      font-size: 12px;
   }
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
.cancelbox{
margin:0 auto;
border-radius: 5px;
padding: 10px;
text-align: center;
width: 300px;

}
.btn-primary {
	background:#525252;
	border: none;
	padding: 10px;
	border-radius: 5px;
	font-size: 20px;
	color:white;
}
.cancelbox span{
	font-size: 20px;
}

.btn-primary:hover{
	background: #323232;
}

  .dropdown-toggle.active {
    background-color: #323232 !important;
  }
  
  i{
  color:#fff; 
  font-size: 25px; 
  vertical-align:bottom;
  }
    @media (max-width: 768px) {
  .nav-pills {
    flex-direction: column;
  }
  .nav-link {
    font-size: 14px;
    padding: 0.5rem 1rem;
  }
  
   section{ 
   	width: 500px; 
	margin: 0 auto; 
   } 


</style>
<jsp:include page="/WEB-INF/common/header.jsp" />
</head>
<body style="margin: 0 auto; overflow-y: scroll;">


   <section>
      <ul class="nav nav-pills nav-justified">
        <li class="nav-item" >
          <a class="nav-link active" href="/users/mypage" style="background: #525252; color:#fff; font-weight: 700;"><i class="xi-profile"></i> 회원 정보</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/users/bucket" style="background: #525252; color:#fff; font-weight: 700;"><i class="xi-cart"></i> 장바 구니</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/products/payMypage" style="background: #323232; color:#fff; font-weight: 700;"><i class="xi-list-dot"></i> 결제 내역</a>
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
  <button style="background: #525252; border: none;"class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton${orderid.orderid}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <span>주문번호: ${orderid.orderid}</span>　<span style="margin: 0 60px 0 60px;">결제일:<fmt:formatDate value="${orderid.successTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span> <c:if test="${orderid.success eq '구매 확정'}"><span style="letter-spacing:8px;">구매확정</span></c:if><c:if test="${orderid.success eq '결제 완료'}"><span style="letter-spacing:1px;">결제취소가능</span></c:if>
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton${orderid.orderid}" style=" border: 2px solid #525252;">
  
        <form action="/User/kakaoPayCancel" id="cancel-form">
    <c:forEach var="order" items="${orders}">
      <c:if test="${order.orderid == orderid.orderid}">
    <input type="hidden" value="${orderid.orderid }" name="orderId">
  	<input type="hidden" value="${order.tid }" name="tid">
    <input type="hidden" value="${order.pro_number }" name="pro_number">
    <input type="hidden" value="${orderid.total}" name="price">
    <input type="hidden" value="${orderid.success}" name="paystatus">
 <div class="deleteplz" style="display:flex; flex-wrap: wrap; align-items:center;  border-bottom: 1px solid lightgray; margin: 50px;" >

<img src="/resources/assets/img/product/${order.pro_img1 }"
  alt="${order.pro_name}"
  title="${order.pro_name}"
  class="img-fluid"
  style="width: 200px; height: 200px;max-width: 100%; margin-bottom: 45px;">

<div style="display: flex; flex-direction: row; justify-content: space-between; align-items: center; font-size: 1.2em; margin: 10px 10px;">
  <div style="text-align: left;width: 400px; height: 200px;">
    <span>상 품 명 : <b style="font-size: 23px; color:#525252">${order.pro_name}</b></span><br><br>
    <span>옵 션 : <small>${order.pro_option}</small></span><br><br>
    <span>상품정보 : <small>${order.pro_maindesctitle}</small></span>
  </div>

  <div style="text-align: left;width: 200px; height: 200px;">
    <span>수 량 : <small style="display: inline;">${order.count}</small></span><br><br>
    <span>가 격 : <small class="total"><fmt:formatNumber value="${order.price}" type="currency" currencySymbol="₩" /></small></span>
  </div>
</div>

</div>
      </c:if>
    </c:forEach>
    
    <div class="cancelbox">
    <c:if test="${orderid.success eq '결제 완료'}">
    <button type="button" class="btn-primary" onclick="confirmCancel()"><fmt:formatNumber value="${orderid.total}" type="currency" currencySymbol="₩" />　주문취소</button>
    </c:if>
    <c:if test="${orderid.success eq '구매 확정'}">
    <span style="white-space: nowrap;">구매확정 상태에는 결제취소가 불가능합니다.</span>
    </c:if>
    </div>
        </form>
  </div>
</c:forEach>
</div>
         </c:otherwise>
         </c:choose>
      </div>
   </div>
<script>
function confirmCancel() {
    if (confirm("주문을 취소하시겠습니까? \n결제승인시간 기준 24시간 이후 자동 구매확정 상태가됩니다.")) {
        document.getElementById("cancel-form").submit();
    } else {
        return false;
    }
}

$(function() {
    $('.dropdown-toggle').click(function() {
      var orderId = $(this).attr('id').replace('dropdownMenuButton', '');
      var dropdownMenu = $('.dropdown-menu').filter(function() {
        return $(this).attr('aria-labelledby') == 'dropdownMenuButton' + orderId;
      });
      $('.dropdown-menu').not(dropdownMenu).hide();
      dropdownMenu.slideToggle();
      
      // 드롭다운 버튼 활성화 클래스 추가/제거
      $(this).toggleClass('active');
      
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