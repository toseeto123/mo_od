<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<title>결제완료</title>
<jsp:include page="/WEB-INF/common/header.jsp" />
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

li .btnspan_on {
	background-color: #525252;
}

@media only screen and (max-width: 768px) {
	ol {
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

.mb-3 {
	font-size: 24px;
}

.btn-primary {
	background-color: #525252;
}

body {
	height: 100%;
}

.returnbtn {
	color: white;
	font-size: 20px;
	background-color: #525252;
	width: 416px;
	height: 50px;
	border: none;
	border-radius: 30px;
	box-shadow: 1px 1px 1px 1px lightgray;
	margin: 20px 0 20px 0;
}

.returnbtn:hover {
	background: #323232;
}

@media ( max-width : 768px) {
	.returnbtn {
		font-size: 90%;
		display: block;
		width: 180%;
		margin: 0 auto;
	}
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
								<h2 class="animate__animated animate__fadeInDown">결제 완료</h2>
								<p class="animate__animated animate__fadeInUp"
									style="width: 100%;">
									"${login_info.name}"님 mo_od를 이용해주셔서 감사합니다.<br> *결제승인시간 기준
									24시간 이후, 구매확정상태가되어, 결제취소가 불가능합니다.
								</p>
								<div>
									<a href="/products/payMypage"
										class="btn-get-started animate__animated animate__fadeInUp scrollto">결제
										내역</a>
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
					<li><span class="btnspan">02</span>주문서작성/결제</li>
					<li class="page_on"><span class="btnspan btnspan_on">03</span>주문완료</li>
				</ol>
			</div>

			<div class="container">
				<div class="row">
					<div class="col-md-12 order-md-1">

						<h2 class="mb-3"
							style="margin: 18px 0 18px 0; color: #323232; font-size: 32px; font-weight: bold;">
							<i class="xi-user" style="color: #000;"></i> ${login_info.id}님주문
							정보
						</h2>
						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="firstName">성 함 : </label><small>
									${login_info.name}</small>
							</div>
							<div class="col-md-6 mb-3">
								<label for="lastName">전화번호 : </label> <small>${login_info.phone}</small>
							</div>
							<div class="col-md-6 mb-3">
								<label for="address">주 소 : </label> <small>${login_info.adr}</small>
							</div>
							<div class="col-md-6 mb-3">
								<label for="lastName" style="letter-spacing: 1px;">E-mail
									: </label> <small>${login_info.email}</small>
							</div>

						</div>

						<div class="mb-3">
							<label for="address">주문 번호 : </label> <strong>${info.partner_order_id }</strong>
						</div>

						<hr>

						<h2 class="mb-3"
							style="margin: 22px 0 22px 0; color: #323232; font-size: 32px; font-weight: bold;">
							<i class="xi-box" style="color: #000;"></i> 결제상품 정보
						</h2>

						<c:forEach var="orders" items="${orders}" begin="0" end="0">
							<div class="col-md-6 mb-3">
								<label for="firstName" style="letter-spacing: 3px;">상 품
									명 : </label><small> ${info.item_name}</small>
							</div>
							<div class="col-md-6 mb-3">
								<label for="lastName">주문 수량 : </label> <small>${orders.row_count }</small>
							</div>
							<div class="col-md-6 mb-3">
								<label for="address">결제 금액 : </label> <small><fmt:formatNumber
										value="${orders.price }" type="currency" currencySymbol="₩" />원</small>
							</div>
							<div class="col-md-6 mb-3">
								<label for="lastName">결제 방식 : </label>
								<c:if test="${orders.payment_method eq 'MONEY'}">
									<small>카카오페이머니</small>
								</c:if>
								<c:if test="${orders.payment_method eq 'CARD'}">
									<small>카드 결제</small>
								</c:if>
							</div>
							<div class="col-md-6 mb-3">
								<label for="lastName">결제승인시간 : </label> <small><fmt:formatDate
										value="${orders.successTime}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
							</div>



							<hr>
						</c:forEach>
					</div>

				</div>

				<label class="returnbtnbox"><a href="/"><button
							class="returnbtn">mo_od의 또 다른 상품 구경하기</button></a></label> <br>
				<br>




			</div>
		</div>
	</div>
	<%-- 결제일시:     [[${info.approved_at}]]<br/>
주문번호:    [[${info.partner_order_id}]]<br/>
상품명:    [[${info.item_name}]]<br/>
상품수량:    [[${info.quantity}]]<br/>
결제금액:    [[${info.amount.total}]]<br/>
결제방법:    [[${info.payment_method_type}]]<br/> --%>

	<%-- <h2>[[${info}]]</h2> --%>

</body>
<jsp:include page="/WEB-INF/common/footer.jsp" />
</html>