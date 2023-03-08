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
						</div> <span class="text-muted">$pro_price 상품금액</span>
					</li>
					<li
						class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0">두번째상품명 리스트로 뿌리</h6>
							<small class="text-muted">pro_name가져오기</small>
						</div> <span class="text-muted">$pro_price 상품금액</span>
					</li>
					<li
						class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0">세번째상품들 리스트로뿌리</h6>
							<small class="text-muted">pro_name가져오기</small>
						</div> <span class="text-muted">$pro_price 상품금액</span>
					</li>
					<li class="list-group-item d-flex justify-content-between"><span>Total
							$total_price</span> <strong>$total_price</strong></li>
				</ul>
				<button class="btn btn-primary btn-lg btn-block" type="submit"
					id="apibtn" onclick="return paycheck()">결제하기</button>
				

			</div>
			<div class="col-md-8 order-md-1">
				<h4 class="mb-3">주문내역</h4>
				<form class="needs-validation" novalidate>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="firstName">이름</label> <input type="text"
								class="form-control" id="firstName" placeholder="user.name"
								value="" required>
							<div class="invalid-feedback">이름은 필수입력입니다.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="lastName">전화번호</label> <input type="text"
								class="form-control" id="phone" placeholder="user.phone"
								value="" required>
							<div class="invalid-feedback">핸드폰 번호는 필수입력입니다.</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="username">UserID</label>
						<div class="input-group">
							<input type="text" class="form-control" id="userId"
								placeholder="user.id" required>
							<div class="invalid-feedback" style="width: 100%;">아이디는 필수
								입력값입니다.</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="email">이메일 <span class="text-muted">(옵션)</span></label>
						<input type="email" class="form-control" id="email"
							placeholder="user.email">
						<div class="invalid-feedback">이메일 아이디를 올바르게 입력 부탁드립니다.</div>
					</div>

					<div class="mb-3">
						<label for="address">Address</label> <input type="text"
							class="form-control" id="address" placeholder="user.adr" required>
						<div class="invalid-feedback">배송입력될 주소칸을 확인해주세요.</div>
					</div>

					<hr class="mb-4">

					<h4 class="mb-3">상품정보</h4>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="cc-name"></label> <img
								src="/resources/assets/img/product/GamsungF1.png"> <small
								class="text-muted">여기다가 상품디테일명가져오기</small>
						</div>
						<div class="col-md-6 mb-3">
							<label for="cc-number">가격정보</label> <input type="text"
								class="form-control" id="cc-number" placeholder="가격정보" required>
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

	<script>
		function paycheck() {
			if (!confirm("결제하시겠습니까?")) {
				return false;
			} else {
				alert("결제 완료");
			}
		}
	</script>
	
	<script>
		$(function() {
			$('#apibtn').click(function() {
				$.ajax({
					url : 'kakaopay',
					dataType : 'json',
					success : function(data) {
						// alert(resp.tid); //결제 고유 번호
						var box = resp.next_redirect_pc_url;
						//window.open(box); // 새창 열기
						location.href = box;
					},
					error : function(error) {
						alert(error);
					}
				});
			});
		});
	</script>
</body>
</html>
