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
<title>결제상세</title>
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
</style>
</head>
<body>
	<div class="content_box">
		<div class="order_wrap" style="position: relative;">
			<div class="order_tit">
			</div>
			<c:forEach var="orders" items="${orders}">
				<div class="deleteplz">

					<img src="resources/assets/img/product/${orders.pro_img1 }"
						class="img-fluid"
						style="width: 160px; height: 160px; position: absolute; right: 150px;">
					<p style="text-align: center; margin-top: 30px;">


						<input type="hidden" value="${orders.userno}"> <input
							type="hidden" value="${orders.pro_number}">
					<h2 style="margin-left: 100px;">주문번호:<span> ${orders.orderId}</span></h2>
					<h2 style="margin-left: 100px;">결제일: <span>${orders.approved_at}</span></h2><br>	
					<h2 style="margin-left: 100px;">상품명: <span>${orders.pro_name}</span></h2>
					<p style="margin-left: 100px;">상품정보: <span>${orders.pro_maindesctitle }</span></p>
					<span style="margin-left: 100px;">수 량 : </span>
					<div class="amount" style="display: inline;">${orders.count}</div>
					<p style="margin-left: 100px;">
						가 격 : <span class="total"><fmt:formatNumber
								value="${orders.pro_price}" type="currency" currencySymbol="₩" /></span>
					</p>
					<br>
					<hr>
					

				</div>
			</c:forEach>
		</div>
	</div>

</body>
</html>