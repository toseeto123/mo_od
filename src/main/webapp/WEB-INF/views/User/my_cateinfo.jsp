<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/phosphor-icons"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/spring-webmvc/5.3.8/spring-webmvc.min.js"></script>
<meta charset="UTF-8">
<title>장바구니</title>
<style>
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

.plus_btn, .minus_btn , .delete_btn{
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

.plus_btn:hover, .minus_btn:hover , delete_btn:hover{
	background-color: #FFA500;
}
</style>
<script type="text/javascript">


window.onload = function() {
	updateTotalCount();
}

function parseCurrency(num) {
	return `₩` + num.toLocaleString('ko-KR');
}

function updateTotalCount() {
	const amountTotal = document.querySelector('.amount_total');
	const valueTotal = document.querySelector('.value_total');
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
	
	console.log(totalAmount);
	amountTotal.innerText = totalAmount;
	valueTotal.innerText = parseCurrency(totalValue);
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
     
     const totalPrice = amount * proprice;
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
     
     const totalPrice = amount * proprice;
     const totalSpan = itemWrapper.querySelector('.total');
     totalSpan.innerText = parseCurrency(totalPrice);
     
     // get the index of the current loop iteration

     
     if (type === 'minus') {
       number = parseInt(number) - 1;
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
     xhr.open('POST', 'minus.do', true);
     xhr.setRequestHeader('Content-Type', 'application/json'); // JSON 형태의 데이터 전송을 위한 설정

     xhr.onreadystatechange = function() {
       if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
         
       }
     };

     
       xhr.send(JSON.stringify(data)); // JSON 형태의 데이터 전송
     
     resultElement.innerText = number;
     updateTotalCount();
     
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
    console.log(cateIdIndex)
	let xhr = new XMLHttpRequest();
	xhr.open('POST', 'catedelete.do', true);
	xhr.setRequestHeader('Content-Type', 'application/json'); // JSON 형태의 데이터 전송을 위한 설정

	xhr.onreadystatechange = function() {
		if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
			const categoryItem = element.closest('.deleteplz');
		      if (categoryItem) {
		        categoryItem.remove();
		      }
		}
	};

	if (cateId != null) {
		const data = {
			number : number,
			cateId : cateId
		};
		xhr.send(JSON.stringify(data)); // JSON 형태의 데이터 전송
	}
}



</script>
</head>
<body>
	<div class="content_box">
		<div class="order_wrap" style="position: relative;">
			<div class="order_tit">
				<ol>
					<li class="page_on"><span class="btnspan">01</span>장바구니</li>
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


						<input type="hidden" value="${map.user_no}"> <input
							type="hidden" value="${map.pro_number}">
					<h2 style="margin-left: 100px;">${map.pro_name}</h2>
					<p style="margin-left: 100px;">${map.pro_maindesctitle }</p>
					<span style="margin-left: 100px;">수 량 : </span>
					<div class="amount" style="display: inline;">${map.amount}</div>
					<input type="hidden" value="${map.cate_id}" name="cateId"
						class="cate_id" /> <span class="btnspan">
						<button class="plus_btn" onclick='flush("plus", this)'>+</button>
						<button class="minus_btn" onclick='minus("minus", this)'>-</button>
						<button class="delete_btn" onclick='deletecate(this)'><i class="ph ph-trash"></i></button>
					</span> 
					<input type="hidden" value="${map.pro_price}" name="pro_price" class="pro_price" />


					<p style="margin-left: 100px;">
						가 격 : <span class="total"><fmt:formatNumber
								value="${map.total}" type="currency" currencySymbol="₩" /></span>
					</p>
					<hr>
				</div>
			</c:forEach>



			</p>
		</div>
		<div class="price_sum">
			<div class="price_sum_cont">
				<div class="price_sum_list">
					<dl style="font-size: 20px;">
						<dt>
							총 <strong class="amount_total">0</strong> 개의 상품 금액
						</dt>
						<dd>
							<span><i class="ph-equals"
								style="font-size: 20px; color: blue;"></i></span> 합계 <strong class="value_total">0</strong>
							원
						</dd>
					</dl>

				</div>
			</div>
		</div>
	</div>


</body>
</html>