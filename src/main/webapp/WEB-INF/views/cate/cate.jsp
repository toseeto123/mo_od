<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<meta charset="UTF-8">
<title>장바구니</title>

<style>
body{
overflow-y: scroll;
}
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
	margin: 40px 100px 120px;
	padding: 20px 40px 25px 40px;
	border: 2px solid #c8936ed4;
	border-radius: 5px;
	height: 250px;
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
.delete_btn{
float: right;
margin-right: 50px;
width: 40px;
height: 40px;
margin-bottom: 40px;
}

.plus_btn:hover, .minus_btn:hover, .delete_btn:hover {
	background-color: #FFA500;
}

.cateBtn, .btn_buy, .cancelbtn {
	background-color: #c8936ed4;
	width: 416px;
	height: 50px;
	border: none;
	border-radius: 30px;
	box-shadow: 1px 1px 1px 1px lightgray;
	color:white;
}
footer {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
}
.btnhover{
font-size: 20px;
font-weight: 700;
}
.btnhover:hover{
background: #da8862;
}


</style>
<jsp:include page="../../common/header.jsp" />
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
<body>
	<form action="/products/cateorders" method="post">
	<input type="hidden" value="${login_info.adr }" name="adr">
		<section>
				<ul class="nav nav-pills nav-justified">
				  <li class="nav-item" >
				    <a class="nav-link active" href="/mypage.do" style="background: #c8936ed4; color:white; font-size: 16px;">회원 정보</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="/cate.do" style="background: #da8862; color:white; font-size: 16px;">장바 구니</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="/products/payMypage" style="background: #c8936ed4; color:white; font-size: 16px;">결제 내역</a>
				  </li>
				</ul>
		</section>
		<div class="content_box">
			<div class="order_wrap" style="position: relative;">
				<div class="order_tit">
					<ol>
						<li class="page_on" style="font-size: 20px;"><span
							class="btnspan btnspan_on">01</span>장바구니</li>
						<li style="font-size: 20px;"><span class="btnspan">02</span>주문서작성/결제</li>
						<li style="font-size: 20px;"><span class="btnspan">03</span>주문완료</li>
					</ol>
				</div>
				<c:choose>
				<c:when test="${empty map }"><h2 style="text-align: center; margin-top: 70px; margin-bottom: 70px;">장바구니에 담긴 상품이 없습니다.</h2></c:when>
				<c:otherwise>
				<c:forEach var="map" items="${map}">
					<div class="deleteplz" style="height: 225;">
						<img src="resources/assets/img/product/${map.pro_img1 }"
							class="img-fluid"
							alt="${map.pro_name}"
							title="${map.pro_maindesctitle}"
							style="width: 180px; height: 180px; position: absolute; right: 150px;">
						<p style="text-align: center; margin-top: 30px;">


							<input type="hidden" value="${map.user_no}" name="user_no"> <input
								type="hidden" value="${map.pro_number}" name="pro_number">
						<a href="/products/${map.pro_number }/${map.pro_name }"><h2 style="margin-left: 100px;">${map.pro_name}</h2></a>
						<p style="margin-left: 100px;">${map.pro_maindesctitle }</p>
						<span style="margin-left: 100px;">수 량 : </span>
						<div class="amount" style="display: inline;">${map.amount}</div>
						<input type="hidden" value="${map.cate_id}" name="cateId"
							class="cate_id" /> <span class="btnspan">
							<button type="button" class="plus_btn"
								onclick='flush("plus", this)' title="수량 추가">+</button>
							<button type="button" class="minus_btn"
								onclick='minus("minus", this)' title="수량 감소">-</button>
							<button class="delete_btn" type="button"
								onclick='deletecate(this)' title="상품 삭제">
								<i class="ph ph-trash"></i>
							</button>

						</span> <input type="hidden" value="${map.pro_price}" name="pro_price"
							class="pro_price" /> <br>
						<span style="margin-left: 100px;">옵 션 : </span>${map.pro_option }
						<p style="margin-left: 100px;">
							가 격 : <span class="total"><fmt:formatNumber
									value="${map.total}" type="currency" currencySymbol="₩" /></span>
						</p>
						<br>
						<hr>

					</div>
					<input type="hidden" value="${map.total }" name="total">
					

				</c:forEach>
				</c:otherwise>
				</c:choose>


				</p>
				<div class="price_sum" style="display: flex; justify-content: center;">
					<div class="price_sum_cont">
						<div class="price_sum_list">
							<dl style="font-size: 20px;">
								<dt style="text-align: center;">
									총 <strong class="amount_total">0</strong> 개의 상품 금액<span>
										: </span><strong class="value_total">0</strong> 원
								</dt>
								<dd>
									<input type="hidden" name="totalValue" id="totalValueInput"
										class="totalValueInput">
								</dd>
							</dl>
							<input type="hidden" value="${login_info.adr }" name="address">
							<input type="submit" value="주문하기" class="btn_buy btnhover"> <br>
							<br> <input type="button" value="더보러가기"
								class="cancelbtn btnhover" onclick="window.location='/mo_od';">

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
