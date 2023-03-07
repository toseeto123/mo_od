<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chart</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>

<body>
	<jsp:include page="../../common/adminHeader.jsp" />

	<!-- ======= Hero Section ======= -->
	<section id="hero" style="height:1000px; overflow:hidden; height:auto;">
		<div class="hero-container">
			
			
              <table class="table" style="color:white; margin-top:5%; margin-left:15%; width:70%;">
                <thead>
                <tr>
                	<th style="width:20%;">주문번호 : ${list.get(0).order_no}</th>
                </tr>
                <tr>
                <th scope="col">이름 : ${list.get(0).user_name}</th>
                <th scope="col">주소 : ${list.get(0).user_addr}</th>
                <th scope="col" style="width:30%;">연락처 : ${list.get(0).user_phone}</th>
                </tr>
                  <tr>
                    <th scope="col">상품번호</th>
                    <th scope="col">상품명</th>
                    <th scope="col">상품가격</th>
                  </tr>
                </thead>
                <tbody>
				<c:forEach var="product" items="${list}">
                  <tr>
                    <th scope="row">${product.pd_code}</th>
                    <td>${product.pd_name}</td>
                    <td> &#8361; ${product.pd_price }</td>
                  </tr>
                  </c:forEach>
                  <tr>
                  	<td colspan="2" style="border-bottom:none;"></td>
                  	<td>총금액: </td>
                  </tr>
                  <tr>
                  <td colspan="2" style="border-bottom:none"></td>
                  <td style="border-bottom:none">
                  	<form action="#" method="post">
                  	<input type="hidden" value="${list.get(0).order_no}">
                  	<input style="margin-left:15%;" type="submit" value="주문취소">
                  	<input style="float:right; margin-right:15%;"  type="submit" value="주문확인">
                  	</form>
                  	</td>
                  </tr>
                </tbody>
              </table>
              
              <!-- End Default Table Example -->
 


			<div style="width:100%"><jsp:include page="../../common/footer.jsp" /></div>
		</div>
	</section>
	<!-- End Hero -->

</body>
</html>