<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">


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
											<th scope="col">회원</th>
											<th scope="col">버킷</th>
											<th scope="col">제고 현황</th>
											<th scope="col">뭐 들어가지</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">1</th>
											<td>뭐들어가지</td>
											<td>뭐들어가지</td>
											<td>뭐들어가지</td>
										</tr>
										<tr>
											<th scope="row">2</th>
											<td>뭐들어가지</td>
											<td>뭐들어가지</td>
											<td>뭐들어가지</td>
										</tr>
										<tr>
											<th scope="row">3</th>
											<td>뭐들어가지</td>
											<td>뭐들어가지</td>
											<td>뭐들어가지</td>
										</tr>
										<tr>
											<th scope="row">4</th>
											<td>뭐들어가지</td>
											<td>뭐들어가지</td>
											<td>뭐들어가지</td>
										</tr>
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