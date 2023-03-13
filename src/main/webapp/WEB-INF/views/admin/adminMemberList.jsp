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
						<th scope="col" style="width: 10%;">회원번호</th>
						<th scope="col" style="width: 10%;">아이디</th>
						<th scope="col" style="width: 10%;">이름</th>
						<th scope="col" style="width: 20%;">연락처</th>
						<th scope="col">이메일</th>
						<th scope="col">상세정보</th>
					</tr>

				</thead>

				<tbody>
					<c:forEach var="user" items="${userList}">
						<tr>
							<th scope="col">${user.no}</th>
							<th scope="col">${user.id}</th>
							<th scope="col">${user.name}</th>
							<th scope="col">${user.phone}</th>
							<th scope="col">${user.email}</th>
							<th scope="col"><a
								href="/admin/adminMemberDetail.do/${user.no}">상세정보</a></th>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- End Default Table Example -->
	   <div style="display:inline-block;  position:absolute; left:50%; transform:translateX(-50%); font-size:20px;">
			<c:if test="${prePage!=null }">
				<a href="/admin/adminMemberList.do/${prePage}">&lt;</a>
			</c:if>

			<c:forEach items="${ pagingNo }" var="no">
				<c:choose>
					<c:when test="${selectPage == no}">
                  &nbsp;<a style="color: green"
							href="/admin/adminMemberList.do/${no}">${no}</a>&nbsp;
                  </c:when>
					<c:otherwise>
                  &nbsp;<a href="/admin/adminMemberList.do/${no}">${no}</a>&nbsp;
                  </c:otherwise>
				</c:choose>
			</c:forEach>

			<c:if test="${nextPage != null }">
				<a href="/admin/adminProList.do/${nextPage}">&gt;</a>
			</c:if>
	</div>
			<div style="width: 100%; margin-top: 50px;"><jsp:include
					page="${pageContext.request.contextPath}/WEB-INF/common/footer.jsp" /></div>
		</div>
	</section>
	<!-- End Hero -->

</body>
</html>