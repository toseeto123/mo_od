<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Chart</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/common/adminHeader.jsp" />
<style>
select, option{
	height: 30px;
	font-size: 18px;
}

#hero{
	height: auto;
	margin-bottom: 100px;
}
.searchParent{
	text-align: center;
}
.search{
	display: inline-block;
}
a{
	color: #c8936ed4;
}
a:hover {
	cursor: pointer;	
	color: #78E150;
}
*:focus { outline: 0; }
input[type=button]{
	color: white;
	background: #d2b48c;  
	width:100px; 
	border-radius:10px; 
	border: none;
	font-size: 20px;
}
input[type=search]{
	font-size: 18px;
}
footer{
	margin-top: 40px;
}
</style>

</head>

<body>

	<section id="hero"class="container"  style="background: white;">
	<div class="searchParent">
			<div class="search" style="margin-top: 110px; margin-bottom: 50px;">
			<select id="searchWhat">
				<option value="name">이름</option>
				<option value="orderNo">주문번호</option>
				<option value="payDate">결제날짜</option>
				<option value="phone">연락처</option>
			</select> <input type="search" id="search">
			
			
			<input type="button" 
				id="searchBtn" value="찾기" onclick="search()">
				</div>
			</div>
		<div class="hero-container">
			<div id="tables">
			<c:forEach var="member" items="${member}">
              <table id="table" class="table" style="margin-top:5%; margin-left:15%; width:70%;">
                <thead id="thead">
                <tr>
                	<th id="orderNo" style="width:20%;">주문번호 : ${member.orderNo}</th>
                	<th colspan="3" ></th>
                	<th>결제날짜 : ${member.payDate}</th>
                </tr>
                <tr>
                <th id="name" scope="col">이름 : ${member.name}</th>
                <th id="address" colspan="3" scope="col">주소 : ${member.address}</th>
                <th id="phone" scope="col" style="width:30%;">연락처 : ${member.phone}</th>
                </tr>
                  <tr>
                    <th scope="col">상품번호</th>
                    <th scope="col">상품명</th>
                    <th scope="col">상품금액</th>
                    <th scope="col">수량</th>
                    <th scope="col">금액</th>
                  </tr>
                </thead>
                
                <tbody id="tbody">
				
				<c:forEach var="product" items="${map[member.orderNo]}">
                  <tr id="product">
                    <th id="productNo" scope="row">${product.productNo}</th>
                    <td id="productNam">${product.productName}</</td>
                    <td id="price">&#8361; ${product.price}</td>
                    <td id="productCount"> ${product.productCount}</td>
                    <td id="amount">&#8361; ${product.productCount*product.price}</td>
                  </tr>
                 </c:forEach> 
                  
                  <tr>
                  	<td colspan="4" style="border-bottom:none;"></td>
                  	<td id="memberAmount">총금액: &#8361; ${member.amount }</td>
                  </tr>
                  
                  <tr>
                  <td colspan="4" style="border-bottom:none"></td>
                  <td style="border-bottom:none">
                  	<form action="#" method="post">
                  	<a onClick="$('#myModal${member.orderNo}').modal('show');" class="btn-get-started animate__animated">주문취소</a>
                  	</form>
                  	</td>
                  </tr>
                  
                </tbody>
              </table>
              
              	<div class="modal fade" id="myModal${member.orderNo}">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">결제 취소</h5>
					<button type="button" style="background: transparent; border: none;" class="close"
						onClick="$('#myModal${member.orderNo}').modal('hide');" data-dismiss="modal"
						aria-label="Close">
						<span class="span" aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="d-flex align-items-center justify-content-center">


						<div class="card-body">
							<div class="form-group">
								
							</div>
							<div class="form-group">
								<h5>결제를 취소하시겠습니까?</h5>
							</div>
							<div class="form-group text-center">
							<input type="button" onClick="location.href = '/admin/kakaoPayCancel?orderid=${member.orderNo}';" value="결제 취소">
								<input type="button" onClick="$('#myModal${member.orderNo}').modal('hide');" value="닫기">								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
              
              </c:forEach>
              </div>
              <!-- End Default Table Example -->
 
					<!-- End Default Table Example -->
			<div id="modulePaging"
				style="display: inline-block; position: absolute; left: 50%; transform: translateX(-50%); font-size: 20px;">
				<c:if test="${prePage!=null }">
					<a href="/admin/adminMemberList/${prePage}">&lt;</a>
				</c:if>

				<c:forEach items="${ pagingNo }" var="no">
					<c:choose>
						<c:when test="${selectPage == no}">
                  &nbsp;<a style="color: green"
								href="/admin/payment/${no}">${no}</a>&nbsp;
                  </c:when>
						<c:otherwise>
                  &nbsp;<a href="/admin/payment/${no}">${no}</a>&nbsp;
                  </c:otherwise>
					</c:choose>
				</c:forEach>

				<c:if test="${nextPage != null }">
					<a href="/admin/payment.do/${nextPage}">&gt;</a>
				</c:if>
			</div>
			
		</div>
		<input type="hidden" value="${selectPage}" id="selectPage">

	</section>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/user/js/adminPaymentSearching.js"></script> 

</body>
<footer><jsp:include
					page="${pageContext.request.contextPath}/WEB-INF/common/footer.jsp" /></footer>
</html>