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

<script src="https://unpkg.com/phosphor-icons"></script>
<!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
        var IMP = window.IMP; 
        IMP.init("imp40061745"); 
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
    
        function requestPay() {
            IMP.request_pay({
                pg : 'nice.nictest00m',  //nicepay=nice.id , kcp=kcp.id, kginicis=html5_inicis.id
                pay_method : 'card',
                merchant_uid: "IMP"+makeMerchantUid, 
                name : '당근 10kg',
                amount : 1004,
                buyer_email : 'Iamport@chai.finance',
                buyer_name : '포트원 기술지원팀',
                buyer_tel : '010-1234-5678',
                buyer_addr : '서울특별시 강남구 삼성동',
                buyer_postcode : '123-456'
                
            }, function (rsp) { // callback
                if (rsp.success) {
                    console.log(rsp);
                } else {
                    console.log(rsp);
                }
            });
        }
    </script>
<meta charset="UTF-8">
<title>회원결제</title>
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
								<h2 class="animate__animated animate__fadeInDown">결제페이지</h2>
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
		<h2 style="margin-top: 150px;"><b>주문/결제</b></h2>
			</div>
		<br>
		<h3>주문자</h3>
			이름&nbsp;&nbsp;  <input type="text" placeholder="고객이름"><br><br>
			이메일&nbsp;<input type="text" placeholder="이메일"><br><br>
			주소&nbsp;&nbsp;<input type="text" placeholder="주소"><br><br>
			휴대전화 <input type="text" placeholder="고객이름"><br><br>
			<p style="text-align: center; margin-top: 30px;">주문 내역에 담긴 상품이 없습니다</p>
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
				<!-- 버튼 영역 -->
						<a class="order_btn" onclick="requestPay()">결제하기</a>
						<a class="reset_btn" onclick="reset()">결제취소</a>
						<a class="apibtn" onclick="kakao()">카카오페이</a>
			</div>
		</div>
	</div>
</div>		
<jsp:include page="/WEB-INF/common/footer.jsp" />
</body>
</html>