<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
</style>

<script src="https://unpkg.com/phosphor-icons"></script>
<meta charset="UTF-8">
<title>결제리스트</title>
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
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
								<h2 class="animate__animated animate__fadeInDown">공통탭부분 인클루드 할거</h2>
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
				<h2 style="margin-top: 150px;">
					<b> 나의 주문 내역</b>
				</h2>
			</div>
			<br>
		</div>
		<div class="price_sum">
		<strong>주문넘버</strong> | <strong>주문일자</strong>
			<div class="price_sum_cont">
				<div class="price_sum_list">
					<div>
						<span>상품이미지</span>
						<span>카데고리</span>
						<span>상품명</span>
						<span>상품명</span>
						<span>가격</span>
						<!--  userPaymentDatail에 나중에 ordernumber로 받아서 넘기-->
						<span><a href="userPaymentDetail.do">주문상세</a></span>
					</div>
				</div>
			</div>
		</div>
	</div>
		<jsp:include page="/WEB-INF/common/footer.jsp" />
</body>
</html>