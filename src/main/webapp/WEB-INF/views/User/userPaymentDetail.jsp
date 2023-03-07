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
	<div class="content_box">
		<div class="order_wrap">
			<div class="order_tit">
				<h2 style="margin-top: 150px;">
					<b> 주문 상세 정보</b>
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
						<span>옵션</span>
						<span>상품명</span>
						<span>가격</span>
						<!--  userPaymentDatail에 나중에 ordernumber로 받아서 넘기-->
					</div>
				</div>
			</div>
		</div>
		<div class="order_wrap">
			<div class="order_tit">
				<h2 style="margin-top: 150px;">
					<b> 주문배송지 정보</b>
				</h2>
			</div>
			<span>받는사람</span>&nbsp;&nbsp;<span>김남수</span><br><br>
			<span>휴대폰</span>&nbsp;&nbsp;<span>010-8721-6143</span><br><br>
			<span>주소</span>&nbsp;&nbsp;<span>서울시 동대문구 왕산로 77 동대문베네스트2차 404호</span>
		</div>
		<div class="order_wrap">
			<div class="order_tit">
				<h2 style="margin-top: 150px;">
					<b> 결제 상세 정보</b>
				</h2>
			</div>
			<span>상품금액</span>&nbsp;&nbsp;<span>500000</span>&nbsp;&nbsp;<span>주문자</span>&nbsp;&nbsp;<span>500000</span><br><br>
			<span>휴대폰</span>&nbsp;&nbsp;<span>010-8721-6143</span>&nbsp;&nbsp;<span>이메일</span>&nbsp;&nbsp;<span>taipoone@gmail.com</span><br><br>
			<span>결제금액</span>&nbsp;&nbsp;<span>500000</span>&nbsp;&nbsp;<span>결제방법</span>&nbsp;&nbsp;<span>카카오페이</span>
		</div><br><br>
	</div>
		<jsp:include page="/WEB-INF/common/footer.jsp" />
</body>
</html>