<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chart</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
a:hover {
	cursor: pointer;
}
</style>
</head>

<body>
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/common/adminHeader.jsp" />

	<!-- ======= Hero Section ======= -->
	<section id="hero" style="overflow: hidden; height: auto;">
		<div class="hero-container">


			<table class="table"
				style="color: white; margin-top: 5%; margin-left: 15%; width: 70%;">
				<thead>

					<tr>
						<th scope="col">회원번호</th>
						<td>${userInfo.no}</td>
					</tr>

				</thead>

				<tbody>
					<tr>
						<th scope="col">아이디</th>
						<td>${userInfo.id}</td>
					</tr>
					<tr>
						<th scope="col">이름</th>
						<td>${userInfo.name}</td>
					</tr>
					<tr>
						<th scope="col">성별</th>
						<td>${userInfo.gender}</td>
					</tr>
					<tr>
						<th scope="col">나이</th>
						<td>${userInfo.age}</td>
					</tr>
					<tr>
						<th scope="col">연락처</th>
						<td>${userInfo.phone}</td>
					</tr>
					<tr>
						<th scope="col">이메일</th>
						<td>${userInfo.email}</td>
					</tr>
					<tr>
						<th scope="col">주소</th>
						<td>${userInfo.adr}${userInfo.adr2} ${userInfo.adr3}</td>
					</tr>
					<tr>
						<td><a id="goBack" href="" onclick="e()">돌아가기</a></td>
					</tr>
				</tbody>
			</table>

			<!-- End Default Table Example -->


			<div style="width: 100%; margin-top: 50px;"><jsp:include
					page="${pageContext.request.contextPath}/WEB-INF/common/footer.jsp" /></div>
		</div>
	</section>
	<!-- End Hero -->
	<script>
	const referrer = document.referrer;
	const ref = referrer.split('/')
	let indexNo;
	var uri = '';
	for(var count=0; count<ref.length; count++){
		if(ref[count] == "admin"){
			indexNo = count;
		}
	}
	for(var index=indexNo; index<ref.length; index++){
		uri = uri+'/'+ref[index];
	}
	document.getElementById("goBack").href=uri;
</script>
</body>
</html>