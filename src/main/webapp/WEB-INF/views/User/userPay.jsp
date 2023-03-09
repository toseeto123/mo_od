<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>결제</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.6/examples/checkout/">



<!-- Bootstrap core CSS -->
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">



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
</style>
<!-- Custom styles for this template -->
<link href="form-validation.css" rel="stylesheet">
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>
<jsp:include page="../../common/header.jsp" />
<body class="bg-light">
	<div class="container">
		<div class="py-5 text-center">
			<h2>주문 | 결제</h2>
			<p class="lead">주문하시기 전에 회원정보와 결제금액을 반드시 확인하시기 바랍니다.</p>
		</div>

		<div class="row">
			<div class="col-md-4 order-md-2 mb-4">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-muted">버킷</span> <span
						class="badge badge-secondary badge-pill">3</span>
				</h4>
				<ul class="list-group mb-3">
					<li
						class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0">첫번째상품명 리스트로 뿌리기</h6>
							<small class="text-muted">pro_name가져오기</small>
						</div> <span class="text-muted">${map.pro_price} 상품금액</span>
					</li>
					<li
						class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0">두번째상품명 리스트로 뿌리</h6>
							<small class="text-muted">pro_name가져오기</small>
						</div> <span class="text-muted">${map.pro_price} 상품금액</span>
					</li>
					<li
						class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0">세번째상품들 리스트로뿌리</h6>
							<small class="text-muted">pro_name가져오기</small>
						</div> <span class="text-muted">${map.pro_price} 상품금액</span>
					</li>
					<li class="list-group-item d-flex justify-content-between"><span>Total
							$total_price</span> <strong>${map.total_price}</strong></li>
				</ul>
				<form action="/kakaoPay" method="post">
				<!-- 히든으로 정보담아서 보내기? -->
				<button class="btn btn-primary btn-lg btn-block" type="submit"
					id="apibtn">결제하기</button>
				</form>

			</div>
			<div class="col-md-8 order-md-1">
				<h4 class="mb-3">주문내역</h4>
				<form class="needs-validation" novalidate>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="firstName">이름</label> 
							<strong>${map.name}</strong>
						</div>
						<div class="col-md-6 mb-3">
							<label for="lastName">전화번호</label>
							<strong>${map.phone}</strong>
						</div>
					</div>

					<div class="mb-3">
						<label for="username">사용자ID</label>
						<div class="input-group">
							<strong>${map.id}</strong>
						</div>
					</div>

					<div class="mb-3">
						<label for="email">이메일 <span class="text-muted"></span></label>
						<strong>${map.email}</strong>
					</div>

					<div class="mb-3">
						<label for="address">주소</label> 
						<strong>${map.adr}</strong>
					</div>

					<hr class="mb-4">

					<h4 class="mb-3">상품정보</h4>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="cc-name"></label> 
							<span>${map.img1}</span>
							 <small
								class="text-muted">${map.pro_maindesc} 상품디테일명</small>
						</div>
						<div class="col-md-6 mb-3">
							<label for="cc-number">가격정보</label> < <small
								class="text-muted">${map.pro_price} 상품디테일명</small>
						</div>
							<div class="invalid-feedback">여기다가 가격정보입력</div>
						</div>
					</div>
				</form>
			</div>
		</div>

		<jsp:include page="/WEB-INF/common/footer.jsp" />
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')
	</script>
	<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

	<script src="form-validation.js"></script>

	<form method="post" action="/kakaoPay">
     
	</form>

    <script>
    var IMP = window.IMP; 
    IMP.init("imp40061745"); 
    var today = new Date();   
    var hours = today.getHours(); // 시
    var minutes = today.getMinutes();  // 분
    var seconds = today.getSeconds();  // 초
    var milliseconds = today.getMilliseconds();
    var makeMerchantUid = hours +  minutes + seconds + milliseconds;

	$("#apibtn").click(function () {
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
		IMP.request_pay({
			pg : 'kakao',  //nicepay=nice.id , kcp=kcp.id, kginicis=html5_inicis.id
            pay_method : 'card',
            merchant_uid: "IMP"+makeMerchantUid, 
            name : '당근 10kg',
            amount : 1004,
            buyer_email : 'Iamport@chai.finance',
            buyer_name : '포트원 기술지원팀',
            buyer_tel : '010-1234-5678',
            buyer_addr : '서울특별시 강남구 삼성동',
            buyer_postcode : '123-456'
            
			}, function (rsp) {
				console.log(rsp);
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '결제 금액 : ' + rsp.paid_amount;
				// success.submit();
				// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
				// 자세한 설명은 구글링으로 보시는게 좋습니다.
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
				alert(msg);
		});
	}); 
</script>
</body>
</html>
