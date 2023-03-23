<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../common/header.jsp" />

<meta charset="UTF-8">
<title>장바구니</title>
<style>
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

.plus_btn, .minus_btn, .delete_btn {
   width: 30px;
   height: 30px;
   background-color: #ccc;
   color: #FFF;
   border: none;
   border-radius: 5px;
   cursor: pointer;
   font-size: 18px;
   font-weight: bold;
   margin: 0 1px;
}

.plus_btn:hover, .minus_btn:hover, .delete_btn:hover {
   background-color: #FFA500;
}


.cateBtn , .btn_buy , .cancelbtn{
   background-color: #c8936ed4;
   width: 416px;
   height: 50px;
   border : none;
   border-radius: 30px;
   box-shadow: 1px 1px 1px 1px lightgray;

   
   
}
</style>
<script type="text/javascript">

window.onload = function() {
	updateTotalCount();
	minusTotalCount();
	if (${not empty login_info.id}) {
		 
	} else {
		var path = location.pathname;
		console.log(path);
		var login_chk = confirm('로그인이 필요한 서비스입니다. 로그인페이지로 이동하시겠습니까?');
		if (login_chk) {
			location.href = '/login.do?redirect=' + encodeURIComponent(path); // 현재 페이지 경로를 redirect 파라미터로 전달합니다.
		} else {
			
		}
	}
	
}

function parseCurrency(num) {
   return `₩` + num.toLocaleString('ko-KR');
}

function updateTotalCount() {
   const amountTotal = document.querySelector('.amount_total');
   const valueTotal = document.querySelector('.value_total');
   const totalValueInput = document.querySelector('.totalValueInput');
   const amountList = document.querySelectorAll('.amount');
   const totalList = document.querySelectorAll('.total');
   
   const amountArray = Array.from(amountList);
   const totalArray = Array.from(totalList);
   
   const totalAmount = amountArray.reduce(function(acc, element) {
      return acc + +element.innerText;
   }, 0);
   
   const totalValue = totalArray.reduce(function(acc, element) {
      const value = +(element.innerText.replace(/[\₩,]/g, ''));
      return acc + value;
   }, 0);
   
   amountTotal.innerText = totalAmount;
   valueTotal.innerText = parseCurrency(totalValue);
   totalValueInput.value = totalValue;
}

function minusTotalCount() {
   
   
   const amountTotal = document.querySelector('.amount_total');
   const valueTotal = document.querySelector('.value_total');
   const totalValueInput = document.querySelector('.totalValueInput');
   const amountList = document.querySelectorAll('.amount');
   const totalList = document.querySelectorAll('.total');
   
   const amountArray = Array.from(amountList);
   const totalArray = Array.from(totalList);
   
   const totalAmount = amountArray.reduce(function(acc, element) {
      return acc - +element.innerText;
   }, 0);
   
   const totalValue = totalArray.reduce(function(acc, element) {
      const value = +(element.innerText.replace(/[\₩,]/g, ''));
      return acc - value;
   }, 0);
   
   amountTotal.innerText = (totalAmount < 0) ? (-totalAmount).toString() : totalAmount.toString();
   valueTotal.innerText = (totalValue < 0) ? '₩' + parseCurrency(-totalValue).substring(1) : '₩' + parseCurrency(totalValue).substring(1);
   totalValueInput.value = Math.abs(totalValue);
}

function flush(type, element) {
   const itemWrapper = element.parentNode.parentNode;
     const resultElement = element.parentNode.previousElementSibling.previousElementSibling;
     let number = resultElement.innerText;

     const cateIdList = document.querySelectorAll('.cate_id');
     const cateIdArray = Array.from(cateIdList);
     const cateIdValues = cateIdArray.map(function(element) {
       return element.value;
     });
     
     const cateIdIndex = cateIdArray.indexOf(itemWrapper.querySelector('.cate_id'));
     const cateId = cateIdValues[cateIdIndex];
     
     
     
     const priceList = document.querySelectorAll('.pro_price');
     const priceArray = Array.from(priceList);
     const priceValues = priceArray.map((element) => element.value);
     
     const priceIndex = priceArray.indexOf(itemWrapper.querySelector('.pro_price'));
     const proprice = +priceValues[priceIndex];
     
     const amountDiv = itemWrapper.querySelector('.amount');
     const amount = +amountDiv.innerText;
     
     const totalPrice = (amount+1) * proprice;
     const totalSpan = itemWrapper.querySelector('.total');
     totalSpan.innerText = parseCurrency(totalPrice);
     
     // get the index of the current loop iteration

     
     if (type === 'plus') {
       number = parseInt(number) + 1;
     }
     const data = {
       number: number,
       proprice : proprice,
       cateId: cateId,
     };
     
/*      fetch('plus.do', { 
        method: 'POST', 
        headers: {'Content-Type': 'application/json'},
         body: JSON.stringify(data),
     }); */
     let xhr = new XMLHttpRequest();
     xhr.open('POST', 'plus.do', true);
     xhr.setRequestHeader('Content-Type', 'application/json'); // JSON 형태의 데이터 전송을 위한 설정

     xhr.onreadystatechange = function() {
       if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
         
       }
     };

     
       xhr.send(JSON.stringify(data)); // JSON 형태의 데이터 전송
     
     resultElement.innerText = number;
     updateTotalCount();
     
}

function minus(type, element) {
   const itemWrapper = element.parentNode.parentNode;
     const resultElement = element.parentNode.previousElementSibling.previousElementSibling;
     let number = resultElement.innerText;

     const cateIdList = document.querySelectorAll('.cate_id');
     const cateIdArray = Array.from(cateIdList);
     const cateIdValues = cateIdArray.map(function(element) {
       return element.value;
     });
     
     const cateIdIndex = cateIdArray.indexOf(itemWrapper.querySelector('.cate_id'));
     const cateId = cateIdValues[cateIdIndex];
     
     
     
     const priceList = document.querySelectorAll('.pro_price');
     const priceArray = Array.from(priceList);
     const priceValues = priceArray.map((element) => element.value);
     
     const priceIndex = priceArray.indexOf(itemWrapper.querySelector('.pro_price'));
     const proprice = +priceValues[priceIndex];
     
     const amountDiv = itemWrapper.querySelector('.amount');
     const amount = +amountDiv.innerText;
     
     const totalPrice = (amount-1) * proprice;
     const totalSpan = itemWrapper.querySelector('.total');
     if (totalPrice >= proprice) {
         totalSpan.innerText = parseCurrency(totalPrice);
       }
     
     // get the index of the current loop iteration

     
     if (type === 'minus' && number > 1) {
       number = parseInt(number) - 1;
     }
     const data = {
       number: number,
       proprice : proprice,
       cateId: cateId,
     };

     let xhr = new XMLHttpRequest();
     xhr.open('POST', 'minus.do', true);
     xhr.setRequestHeader('Content-Type', 'application/json'); // JSON 형태의 데이터 전송을 위한 설정

     xhr.onreadystatechange = function() {
       if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
         
       }
     };

     
       xhr.send(JSON.stringify(data)); // JSON 형태의 데이터 전송
     
     resultElement.innerText = number;
     minusTotalCount();
     
}
function deletecate(element) {
   const itemWrapper = element.parentNode.parentNode;
    const resultElement = element.parentNode.previousElementSibling.previousElementSibling;
    let number = resultElement.innerText;

    const cateIdList = document.querySelectorAll('.cate_id');
    const cateIdArray = Array.from(cateIdList);
    const cateIdValues = cateIdArray.map(function(element) {
      return element.value;
    });
    
    const cateIdIndex = cateIdArray.indexOf(itemWrapper.querySelector('.cate_id'));
    const cateId = cateIdValues[cateIdIndex];
    
         const priceList = document.querySelectorAll('.pro_price');
     const priceArray = Array.from(priceList);
     const priceValues = priceArray.map((element) => element.value);
     
     const priceIndex = priceArray.indexOf(itemWrapper.querySelector('.pro_price'));
     const proprice = +priceValues[priceIndex];
     
     const amountDiv = itemWrapper.querySelector('.amount');
     const amount = +amountDiv.innerText;
     
     const totalPrice = (amount-1) * proprice;
     const totalSpan = itemWrapper.querySelector('.total');
     
     if (totalPrice >= proprice) {
         totalSpan.innerText = parseCurrency(totalPrice);
       }
   let xhr = new XMLHttpRequest();
   xhr.open('POST', 'catedelete.do', true);
   xhr.setRequestHeader('Content-Type', 'application/json'); // JSON 형태의 데이터 전송을 위한 설정

   xhr.onreadystatechange = function() {
      if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
         const categoryItem = element.closest('.deleteplz');
         
         const deleteprice = parseFloat(itemWrapper.parentNode.querySelector('.value_total').innerText.replace(/[\₩,]/g, ''));
         const totalSpans = parseFloat(itemWrapper.querySelector('.total').innerText.replace(/[\₩,]/g, ''));
         
         const realtotal = deleteprice - totalSpans;
         const realamount = itemWrapper.parentNode.querySelector('.amount_total').innerText;
         
         const amountDiv = itemWrapper.querySelector('.amount');
         const amount = +amountDiv.innerText;
         const amountminus = realamount - amount;
         console.log(realamount)
         console.log(amountminus)
         
         
      if (categoryItem) {
         categoryItem.remove()
         const realrealtotal = document.querySelector('.value_total');
         realrealtotal.innerText = parseCurrency(realtotal);
         
         const realrealamount = document.querySelector('.amount_total');
         realrealamount.innerText = amountminus;
      }
      }
   };

   if (cateId != null) {
      const data = {
         number : number,
         cateId : cateId
      };
      xhr.send(JSON.stringify(data)); // JSON 형태의 데이터 전송
   minusTotalCount();
   }
}





</script>
</head>
<body style="font-size: 22px; ">
<form action="/products/cateorders" method="post">
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
                        <h2 class="animate__animated animate__fadeInDown">초히트 대 인기
                           상품</h2>
                        <p class="animate__animated animate__fadeInUp">지금 바로 클릭해보세요</p>
                        <div>
                           <a href="#about"
                              class="btn-get-started animate__animated animate__fadeInUp scrollto">Click</a>
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
               <li class="page_on"><span class="btnspan btnspan_on">01</span>장바구니</li>
               <li><span class="btnspan">02</span>주문서작성/결제</li>
               <li><span class="btnspan">03</span>주문완료</li>
            </ol>
         </div>
         <c:forEach var="map" items="${map}">
            <div class="deleteplz">

               <img src="resources/assets/img/product/${map.pro_img1 }"
                  class="img-fluid"
                  style="width: 160px; height: 160px; position: absolute; right: 150px;">
               <p style="text-align: center; margin-top: 30px;">


                  <input type="hidden" value="${map.user_no}"> <input type="hidden" value="${map.pro_number}" name="pro_number">
               <h2 style="margin-left: 100px; ">${map.pro_name}</h2>
               <p style="margin-left: 100px;">${map.pro_maindesctitle }</p>
               <span style="margin-left: 100px;">수 량 : </span>
               <div class="amount" style="display: inline;">${map.amount}</div>
               <input type="hidden" value="${map.cate_id}" name="cateId"
                  class="cate_id" /> <span class="btnspan">
                  <button type="button" class="plus_btn" onclick='flush("plus", this)' title="수량 추가">+</button>
                  <button type="button" class="minus_btn" onclick='minus("minus", this)' title="수량 감소">-</button>
                  <button class="delete_btn" type="button" onclick='deletecate(this)' title="상품 삭제">
                     <i class="ph ph-trash"></i>
                  </button>
                  
               </span> <input type="hidden" value="${map.pro_price}" name="pro_price"
                  class="pro_price" />

            <br><span style="margin-left: 100px;">옵 션 : </span>${map.pro_option }
               <p style="margin-left: 100px;">
                  가 격 : <span class="total"><fmt:formatNumber
                        value="${map.total}" type="currency" currencySymbol="₩" /></span>
               </p>
               <br>
               <hr>

            </div>
            <input type="hidden" value="${map.total }" name="total">
 
            
         </c:forEach>



         </p>
         <div class="price_sum">
            <div class="price_sum_cont">
               <div class="price_sum_list">
                  <dl style="font-size: 20px;">
                     <dt>
                        총 <strong class="amount_total">0</strong> 개의 상품 금액<span> : </span><strong class="value_total">0</strong> 원
                     </dt>
                     <dd>
                                   <input type="hidden" name="totalValue" id="totalValueInput" class="totalValueInput">
                     </dd>
                  </dl>
                  <input type="hidden" value="${login_info.adr }" name="address">
                  <input type="submit" value="바로결제하기" class="btn_buy"> <br><br>
                  <input type="button" value="메인페이지로 이동" class="cancelbtn" onclick="window.location='/mo_od';">
				
               </div>
            </div>
         </div>
      </div>
   </div>
   </form>
</body>
<jsp:include page="../../common/footer.jsp" />
<script>
 
</script>

</html>