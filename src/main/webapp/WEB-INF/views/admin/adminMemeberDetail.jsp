<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html style="background-color:#f5f6f7;">
<head>
<meta charset="UTF-8">
<title>Chart</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
input[type=button] {
	line-height: 24px;
	color: white;
	background: #323232;
	border: none;
	width: 100px;
	height: 30px;
}
</style>
</head>

<body style="background-color:#f5f6f7;">
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/common/adminHeader.jsp" />

	<!-- ======= Hero Section ======= -->

	<div>
			<table class="table"
				style="margin-top: 5%; margin-left: 15%; width: 70%;">
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
						<c:choose>
						<c:when test="${userInfo.gender == 'F'}">
							<td>여자</td>	
						</c:when>
						<c:when test="${userInfo.gender == 'M'}">
							<td>남자</td>
						</c:when>
						<c:otherwise>
							<td></td>
						</c:otherwise>
						</c:choose>
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
						<td><input type="button" onclick="goBack()" value="돌아가기"></td>
					</tr>
				</tbody>
			</table>

			<!-- End Default Table Example -->


			<div style="position: absolute; bottom:0; width:100%;"><jsp:include
					page="${pageContext.request.contextPath}/WEB-INF/common/footer.jsp" /></div>
		</div>
	
	<!-- End Hero -->
	<script>
	function goBack(){
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
		location.href=uri;
	}
</script>
</body>
</html>