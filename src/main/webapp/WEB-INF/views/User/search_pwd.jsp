<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비밀번호 재설정</title>
<style>
body{
	overflow-x: hidden;
}
input[type=button] {
	background: #c8936ed4;
	border: 1px solid #c8936ed4;
	color: white;
	border-radius: 6px;
}

span.span {
	color: #c8936ed4;
}
.modal-dialog {
  display: flex;
  align-items: center;
  min-height: calc(100% - 3.5rem);
}
.link {
	font-size: 20px;
	width:150px;
	height:auto;
}
footer {
	position: fixed;
	bottom: 0;
	width: 100%;
}
</style>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<jsp:include page="/WEB-INF/common/header.jsp" />
</head>
<body>
	<section id="hero" style="height: 200px;">
		<div class="hero-container">
			<div id="heroCarousel" data-bs-interval="5000"
				class="carousel slide carousel-fade" data-bs-ride="carousel">
				<ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

				<div class="carousel-inner" role="listbox">

					<!-- Slide 1 -->
					<div class="carousel-item active"
						style="background-image: url(resources/assets/img/slide/cate1.jpg); height: 500px;">

						<h2 class="animate__animated animate__fadeInDown"
							style="text-align: center; line-height: 200px;">비밀번호 재설정</h2>

					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="d-flex align-items-center justify-content-center">
		<div class="row justify-content-center mt-5">
			<div class="col-md-6">
				<div class="card border-0">
					<div class="card-body">


						<div class="row">

							<div class="card-body">
								<div class="form-group row">
									<label class="col-3 col-form-label" for="id">아이디</label>
									<div class="col-6">
										<input type="text" class="form-control" id="id" name="id"
											placeholder="아이디를 입력해주세요" required autofocus>
									</div>
									<input type="button" class="col-3" value="아이디 확인"
										onClick="idValidate()">
									<div class="col-3"></div>
									<div class="col-7">
										<span class="span" id="idCheck"></span>
									</div>
								</div>
							</div>

							<div class="card-body">
								<div class="form-group row">
									<label class="col-3 col-form-label" for="email">이메일</label>

									<div class="col-6">
										<input type="text" class="form-control" id="email"
											name="email" placeholder="이메일을 입력해주세요" required>
									</div>
									<input type="button" class="col-3" value="보내기"
										onclick="emailValidate();">
									<div class="col-3"></div>
									<div class="col-6">
										<span class="span" id="emailCheck"></span>
									</div>
								</div>

							</div>
							<div class="card-body">
								<div class="form-group row">
									<label class="col-3 col-form-label" for="number">인증번호</label>
									<div class="col-6">
										<input type="text" class="form-control" id="number"
											placeholder="인증번호 입력">
									</div>
									<input type="button" class="col-3" value="확인"
										onClick="numValidate()">
									<div class="col-3"></div>
									<div class="col-7">
										<span class="span" id="time"></span> <input type="hidden"
											id="status" value="pwd"> <input type="hidden"
											id="storage">
									</div>
								</div>
							</div>
							<div class="card-body">

								<div class="form-group row">
									<div class="col-6" style="padding-left:70px">
										<input type="button" class="link" value="아이디 찾기" onclick="location.href='/searchId'">
									</div>
									<div class="col-6 text-right" style="padding-right:70px">
										<input type="button" class="link" value="돌아가기" onclick="location.href='/login.do'">
									</div>

								</div>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">비밀번호 재설정</h5>
					<button type="button" class="close"
						onClick="$('#myModal').modal('hide');" data-dismiss="modal"
						aria-label="Close">
						<span class="span" aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="d-flex align-items-center justify-content-center">


						<div class="card-body">
							<div class="form-group">
								
							</div>
							<div class="form-group">
								<h5>임시비밀번호가 이메일로 발송됩니다.</h5>
							</div>
							<div class="form-group text-center">
								<input type="button" onClick="passwordChange()" value="비밀번호 재설정">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


<input type="hidden" id="emailStorage">
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		
	<script src="/resources/user/js/findPwd.js"></script>
		

</body>
<footer><jsp:include page="/WEB-INF/common/footer.jsp" /></footer>
</html>