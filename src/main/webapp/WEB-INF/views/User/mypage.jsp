<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<style>
section {
	width: 1000px;
	margin: 0 auto;
}


</style>
<jsp:include page="/WEB-INF/common/header.jsp" />
</head>
<body>


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

	<div class="tabcontent">
		<div id="on">
			<jsp:include page="/WEB-INF/views/User/mypage_myInfo.jsp" />
		</div>
	</div>
	<div class="tabcontent">
		<div id="cate">
			<jsp:include page="/WEB-INF/views/User/my_cateinfo.jsp" />
		</div>
	</div>

	<div class="tabcontent">
		<div id="payDetail">
			<jsp:include page="/WEB-INF/views/User/userPaymentList.jsp" />
		</div>
	</div>


	<jsp:include page="/WEB-INF/common/footer.jsp" />
</body>

</html>