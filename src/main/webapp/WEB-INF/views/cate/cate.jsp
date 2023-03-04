<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
			<p style="text-align: center; margin-top: 30px;">장바구니의 담겨 있는 상품이 없습니다</p>
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
					<span><img src="https://ninezstr5594.cdn-nhncommerce.com/data/skin/front/0782commonstore_CAPY/img/order/order_price_plus.png" alt="더하기"></span>
					배송비
					<strong>0</strong>
					원
					<span><img src="https://ninezstr5594.cdn-nhncommerce.com/data/skin/front/0782commonstore_CAPY/img/order/order_price_total.png" alt="합계"></span>
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