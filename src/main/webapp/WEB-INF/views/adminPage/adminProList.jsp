<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../common/adminHeader.jsp" />

	<!-- ======= Hero Section ======= -->
	<section id="hero" style="background: white;">
		<div class="hero-container">
			<div id="heroCarousel" data-bs-interval="5000"
				class="carousel slide carousel-fade" data-bs-ride="carousel"
				style="background: white;">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="carousel-container" style="background: white;">
							<div>

								<table class="table">
									<thead>
										<tr>
											<th scope="col">상품일련번호</th>
											<th scope="col">카테고리</th>
											<th scope="col">상품명</th>
											<th scope="col">가격</th>
											<th scope="col">품절여부(판매여부)</th>
										</tr>
									</thead>
									<tbody>
									
										<tr>
											<th scope="row">Aa101</th>
											<td>가구>매트리스</td>
											<td>마약매트리스</td>
											<td>120,000원</td>
											<td>1 or 0</td>
										</tr>
										<tr>
											<th scope="row">검색기능</th>
											<td>페이징기능</td>
											<td>추가예정</td>
											<td>카테고리별 검색</td>
											<td>상품명검색</td>
										</tr>
										<c:forEach var="list" items="${list}">
										<tr> 
											<th scope="row">${list.pro_name}</th>
											<td>${list.pro_number}</td>
											<td>${list.pro_option1}</td>
											<td>${list.pro_desc1}</td>
											<td>${list.pro_option3}</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>

								<div></div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
	<!-- End Hero -->


	<jsp:include page="../../common/footer.jsp" />
</body>

</html>