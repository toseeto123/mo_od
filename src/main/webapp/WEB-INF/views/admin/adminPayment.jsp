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
			
			
              <table class="table" style="color:white; margin-top:5%; margin-left:15%; width:70%;">
                <thead>
                <tr>
                	<th style="width:20%;">주문번호 : <!-- ${list.get(0).order_no} --></th>
                </tr>
                <tr>
                <th scope="col">이름 : <!-- ${list.get(0).user_name} --></th>
                <th scope="col">주소 : <!-- ${list.get(0).user_addr} --></th>
                <th scope="col" style="width:30%;">연락처 : <!--  ${list.get(0).user_phone}--></th>
                </tr>
                  <tr>
                    <th scope="col">상품번호</th>
                    <th scope="col">상품명</th>
                    <th scope="col">상품가격</th>
                  </tr>
                </thead>
                
                <tbody>
				
				<!--<c:forEach var="product" items="${list}">-->
                  <tr>
                    <th scope="row"><!-- ${product.pd_code} --></th>
                    <td><!-- ${product.pd_name} --></td>
                    <td> &#8361; <!-- ${product.pd_price } --></td>
                  </tr>
                 <!--  </c:forEach>--> 
                  
                  <tr>
                  	<td colspan="2" style="border-bottom:none;"></td>
                  	<td>총금액: </td>
                  </tr>
                  
                  <tr>
                  <td colspan="2" style="border-bottom:none"></td>
                  <td style="border-bottom:none">
                  	<form action="#" method="post">
                  	<!-- <input type="hidden" value="${list.get(0).order_no}"> -->
                  	<a href="#about" class="btn-get-started animate__animated">주문취소</a>
                  	<a href="#about" class="btn-get-started animate__animated">주문확인</a>
                  	</form>
                  	</td>
                  </tr>
                  
                </tbody>
              </table>
              
              <!-- End Default Table Example -->
 
			<div><div style="display:inline-block;  position:absolute; left:50%; transform:translateX(-50%); font-size:20px;"><a href="#">&lt;</a>
			<c:set var="page" value="${num }" />
			${page }
			&nbsp;<a href="/admin/payment.do/1">1</a>&nbsp;
			<a href="#">&gt;</a></div></div>
			
			<div style="width:100%; margin-top:50px;"><jsp:include page="${pageContext.request.contextPath}/WEB-INF/common/footer.jsp" /></div>
		</div>
	</section>
	<!-- End Hero -->

</body>
</html>