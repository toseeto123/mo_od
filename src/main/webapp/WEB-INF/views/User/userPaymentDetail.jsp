<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


<script src="https://unpkg.com/phosphor-icons"></script>
<meta charset="UTF-8">
<title>결제리스트</title>
</head>
<body>
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
			<span>받는사람</span>&nbsp;&nbsp;<span>${login_info.name}</span><br><br>
			<span>휴대폰</span>&nbsp;&nbsp;<span>${login_info.phone}</span><br><br>
			<span>주소</span>&nbsp;&nbsp;<span>${login_info.adr}</span>
		</div>
		<div class="order_wrap">
			<div class="order_tit">
				<h2 style="margin-top: 150px;">
					<b> 결제 상세 정보</b>
				</h2>
			</div>
			<span>상품금액</span>&nbsp;&nbsp;<span>500000</span>&nbsp;&nbsp;<span>주문자</span>&nbsp;&nbsp;<span>500000</span><br><br>
			<span>휴대폰</span>&nbsp;&nbsp;<span>010-8721-6143</span>&nbsp;&nbsp;<span>이메일</span>&nbsp;&nbsp;<span>${login_info.email}</span><br><br>
			<span>결제금액</span>&nbsp;&nbsp;<span>500000</span>&nbsp;&nbsp;<span>결제방법</span>&nbsp;&nbsp;<span>카카오페이</span>
		</div><br><br>
	</div>
</body>
</html>