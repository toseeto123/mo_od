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
a:hover{
	cursor:pointer;
}
</style>
</head>

<body>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/common/adminHeader.jsp" />

	<!-- ======= Hero Section ======= -->
	<section id="hero" style="overflow:hidden; height:auto;">
		<div class="hero-container">
			
			<c:forEach var="member" items="${member}">
              <table class="table" style="color:white; margin-top:5%; margin-left:15%; width:70%;">
                <thead>
                <tr>
                	<th style="width:20%;">주문번호 : ${member.orderNo}</th>
                </tr>
                <tr>
                <th scope="col">이름 : ${member.name}</th>
                <th scope="col">주소 : ${member.address}</th>
                <th scope="col" style="width:30%;">연락처 : ${member.phone}</th>
                </tr>
                  <tr>
                    <th scope="col">상품번호</th>
                    <th scope="col">상품명</th>
                    <th scope="col">상품가격</th>
                  </tr>
                </thead>
                
                <tbody>
				
				<c:forEach var="product" items="${map[member.orderNo]}">
                  <tr>
                    <th scope="row">${product.productNo}</th>
                    <td>${product.productName}</</td>
                    <td> &#8361; ${product.price}</td>
                  </tr>
                 </c:forEach> 
                  
                  <tr>
                  	<td colspan="2" style="border-bottom:none;"></td>
                  	<td>총금액: ${member.amount }</td>
                  </tr>
                  
                  <tr>
                  <td colspan="2" style="border-bottom:none"></td>
                  <td style="border-bottom:none">
                  	<form action="#" method="post">
                  	<a href="#about" class="btn-get-started animate__animated">주문취소</a>
                  	<a href="#about" class="btn-get-started animate__animated">주문확인</a>
                  	</form>
                  	</td>
                  </tr>
                  
                </tbody>
              </table>
              </c:forEach>
              <!-- End Default Table Example -->
 
					<!-- End Default Table Example -->
			<div id="modulePaging"
				style="display: inline-block; position: absolute; left: 50%; transform: translateX(-50%); font-size: 20px;">
				<c:if test="${prePage!=null }">
					<a href="/admin/adminMemberList.do/${prePage}">&lt;</a>
				</c:if>

				<c:forEach items="${ pagingNo }" var="no">
					<c:choose>
						<c:when test="${selectPage == no}">
                  &nbsp;<a style="color: green"
								href="/admin/payment.do/${no}">${no}</a>&nbsp;
                  </c:when>
						<c:otherwise>
                  &nbsp;<a href="/admin/payment.do/${no}">${no}</a>&nbsp;
                  </c:otherwise>
					</c:choose>
				</c:forEach>

				<c:if test="${nextPage != null }">
					<a href="/admin/payment.do/${nextPage}">&gt;</a>
				</c:if>
			</div>
			<div style="width: 100%; margin-top: 50px;"><jsp:include
					page="${pageContext.request.contextPath}/WEB-INF/common/footer.jsp" /></div>
		</div>
		<input type="hidden" value="${selectPage}" id="selectPage">

	</section>
	<!-- End Hero -->

</body>
</html>