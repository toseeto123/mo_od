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
	font-size: 24px;
	font-weight: bold;
	margin: 0 1px;
}
.order-info {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  margin-left: 100px;
  margin-top: 20px;
  font-size: 16px;
}

.order-info h2, .order-info h4 {
  margin: 0;
}

.order-info h2 span, .order-info h4 small {
  font-weight: normal;
  color: #555;
}

.order-info h2 {
  font-size: 24px;
  margin-bottom: 5px;
}

.order-info h4 {
  margin-bottom: 3px;
}

.order-info h4 small {
  font-size: 14px;
}

.order-info h4 small, .order-info h4 small {
  color: #888;
}

.order-info .total {
  font-size: 18px;
  font-weight: bold;
  color: #333;
  margin-left: 5px;
}

.order-info .total:before {
  content: "₩";
}

.tabnav{
 margin-bottom:0px;
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
						alt="${orders.pro_name}"
						title="${orders.pro_name}"
						class="img-fluid"
						style="width: 250px; height: 250px; position: absolute; right: 150px;">
					<p style="text-align: center; margin-top: 30px;">
						<input type="hidden" value="${orders.userno}"> <input
							type="hidden" value="${orders.pro_number}">
					<h2 style="margin-left: 100px;">주문번호:<span> ${orders.orderId}</span></h2>
					<h2 style="margin-left: 100px;">결제일: <span>${orders.approved_at}</span></h2><br>	
					<h4 style="margin-left: 100px;">상품명: <small>${orders.pro_name}</small></h4>
					<h4 style="margin-left: 100px;">상품정보: <small>${orders.pro_maindesctitle }</small></h4>
					<h4 style="margin-left: 100px;">수 량 : <small style="display: inline;">${orders.count}</small></h4>
					<p style="margin-left: 100px;">가 격 : <span class="total"><fmt:formatNumber
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