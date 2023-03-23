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
<jsp:include page="/WEB-INF/common/header.jsp" />
<title>결제상세</title>
<style>
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
	margin-bottom: 10px;
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

</style>
</head>
<body style="margin: 0 auto;">
	<section>
		<ul class="nav nav-pills nav-justified">
		  <li class="nav-item" >
		    <a class="nav-link active" href="/mypage.do" style="background: #c8936ed4; color:white;">회원 정보</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="/cate.do" style="background: #c8936ed4; color:white;">장바 구니</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="/products/payMypage" style="background: #c8936ed4; color:white;">결제 내역</a>
		  </li>
		</ul>
	</section>
	<div class="content_box">
		<div class="order_wrap" style="position: relative;">
			<div class="order_tit">
			</div>
			<c:choose>
			<c:when test="${empty orders }"> <h2 style="text-align: center; margin-top: 280px; margin-bottom: 285px;">결제 내역이 존재하지 않습니다.</h2></c:when>
			<c:otherwise>
			<c:forEach var="orders" items="${orders}">
				<div class="deleteplz">
					<img src="/resources/assets/img/product/${orders.pro_img1 }"
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
			</c:otherwise>
			</c:choose>
		</div>
	</div>
<jsp:include page="/WEB-INF/common/footer.jsp" />
</body>
</html>