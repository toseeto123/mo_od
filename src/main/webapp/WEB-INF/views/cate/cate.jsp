<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../common/header.jsp" />
<script src="https://unpkg.com/phosphor-icons"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/spring-webmvc/5.3.8/spring-webmvc.min.js"></script>
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
	width: 1600px;
	margin: auto;
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
    color: #2b2bfc;
    font-weight: bold;
}
.price_sum {
	margin: 40px 100px 50px ;
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
	display : table-cell;
	padding: 5px 10px 5px 10px;
	font-size: 16px;
	text-align: right;
	display: table-cell;
}
.price_sum_cont .price_sum_list dl{
	display: block;
}
</style>
<script type="text/javascript">


function flush(type) {
	  const resultElement = document.getElementById('amount');
	  let number = resultElement.innerText;

	  let xhr = new XMLHttpRequest(); // XMLHttpRequest 객체 생성
	  xhr.open('POST', 'update.do', true); 
	  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); // 요청 헤더 설정

	  xhr.onreadystatechange = function() {
	    if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
	      // 서버로부터 응답이 왔을 때 처리할 내용
	    	resultElement.innerHtml = this.responseText;
	    }
	  };

	  if (type === 'plus') {
	    number = parseInt(number) + 1;
	  }

	  xhr.send(`number=${number}`); // 서버로 number 값을 전송
	  resultElement.innerText = number;
	}
	
function minus(type) {
	  const resultElement = document.getElementById('amount');
	  let number = resultElement.innerText;

	  let xhr = new XMLHttpRequest(); // XMLHttpRequest 객체 생성
	  xhr.open('POST', 'minusupdate.do', true); 
	  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); // 요청 헤더 설정

	  xhr.onreadystatechange = function() {
	    if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
	      // 서버로부터 응답이 왔을 때 처리할 내용
	      resultElement.innerHtml = this.responseText;
	    }
	  };

	  if (type === 'minus') {
	    number = parseInt(number) - 1;
	  }

	  xhr.send(`number=${number}`); // 서버로 number 값을 전송
	  resultElement.innerText = number;
	}
	
</script>
</head>
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
								<h2 class="animate__animated animate__fadeInDown">초히트 대 인기 상품</h2>
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
	<div class="order_wrap">
	<div class="order_tit">
		<h2 style="margin-top: 150px;"><b>장바구니</b></h2>
		<ol  style="width: 200px;">
			<li class="page_on"><span>01</span>장바구니</li>
			<li><span>02</span>주문서작성/결제</li>
			<li><span>03</span>주문완료</li>
		</ol>
			</div>
			<p style="text-align: center; margin-top: 30px;">
			<c:forEach var="map" items="${map}">
			<input type="hidden" value="${map.user_no }">
			<input type="hidden" value="${map.pro_number }">
			<div id="amount">${map.amount}</div>
			<span>
				<button class="plus_btn"onclick='flush("plus")'>+</button>
				<button class="minus_btn"onclick='minus("minus")'>-</button>
			</span>
			
				<p>${map.pro_name}</p><p>${map.pro_price }</p><p>${map.pro_maindesctitle }</p>
				<img src="resources/assets/img/product/${map.pro_img1 }" class="img-fluid" style="width: 206px; height: 206px;">
				
			</c:forEach>
			</p>
		</div>
		<div class="price_sum">
			<div class="price_sum_cont">
			<div class="price_sum_list">
				<dl style="font-size: 20px;">
					<dt>총
					<strong>0</strong>
					개의 상품 금액
					</dt>
					<dd>
					<strong>0</strong>
					원
					<span><i class="ph-plus-circle" style="font-size: 20px; color:blue;"></i></span>
					배송비
					<strong>0</strong>
					원
					<span><i class="ph-equals" style="font-size: 20px; color:blue;"></i></span>
					합계
					<strong>0</strong>
					원
					</dd>
				</dl>
				
			</div>
		</div>
	</div>
</div>

</body>
<jsp:include page="../../common/footer.jsp" />
</html>