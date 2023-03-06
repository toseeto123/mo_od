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
	<section id="hero">
		<div class="hero-container" style=" position:absolute; top:10%; left:50%; transform:translateX(-50%); width:80%;">
				
              <table class="table" style="color:white;">
                <thead>
                <tr>
                	<th colspan="4">주문번호 : ${list.get(0).order_no}</th>
                </tr>
                  <tr>
                    <th scope="col">상품번호</th>
                    <th scope="col">상품명</th>
                    <th scope="col">연락처</th>
                    <th scope="col">상품가격</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">${list.get(0).pd_code}</th>
                    <td>${list.get(0).pd_name}</td>
                    <td>${list.get(0).user_phone}</td>
                    <td>${list.get(0).pd_price }</td>
                  </tr>
                  <tr>
                  	<td colspan="3"></td>
                  	<td>총금액: </td>
                  </tr>
                </tbody>
              </table>
              
              <!-- End Default Table Example -->
 


			
		</div>
	</section>
	<!-- End Hero -->


	<jsp:include page="../../common/footer.jsp" />
</body>

</html>