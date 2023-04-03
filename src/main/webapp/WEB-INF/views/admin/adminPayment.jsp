<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html style="background-color:#f5f6f7;">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>결 제</title>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/common/adminHeader.jsp" />

<style>
select, option{
	height: 30px;
	font-size: 18px;
}

#hero{
	height: auto;
}
.searchParent{
	text-align: center;
	margin: 170px 0 40px;
}
.search{
	display: inline-block;
}
a{
	color: #323232;
	cursor: pointer;
}
a:hover {
	cursor: pointer;	
	color: #323232;
}
*:focus { outline: 0; }
input[type=button]{
	color: white;
	background: #323232;  
	width:100px; 
	border: none;
	font-size: 20px;
	border-radius:10px;
}
input[type=search]{
	font-size: 18px;
}
section{
	padding: 0;
	margin: 0;
	text-align: center;
}
#tables{
	display: inline-block;
	padding: 0;
	margin: 0;
}
#table{
	width: 1200px;
	text-align: left;
}
#modulePaging{
	display: inline-block;
	padding: 30px 0;
}

.footer{
	position: absolute;
	bottom: 0;
	width: 100%;
}

</style>
</head>

<body style="background-color:#f5f6f7;">


	<div class="searchParent">
			<div class="search">
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
			<section style="padding: 0;
	margin: 0;">
			<div id="tables">
			
              <table id="table" class="table">
                <thead id="thead">
                <tr>
                	<th>주문번호</th>
                	<th>이름</th>
                	<th>연락처</th>
                	<th>주소</th>
                	<th>결제날짜</th>
                	<th>총금액</th>
                	<th>상세보기</th>
                </tr>
                </thead>
                
                <tbody id="tbody">
                <c:forEach var="member" items="${member}">
                <tr>
                <td>${member.orderNo}</td>
                <td>${member.name}</td>
                <td>${member.phone}</td>
                <td>${member.address}</td>
                <td>${member.payDate}</td>
                <c:set var="amount" value="0" />
                <c:forEach var="product" items="${map[member.orderNo]}">
                <input type="hidden" value="${amount = amount + (product.price*product.productCount)}">
                </c:forEach>
                <td>&#8361; ${amount}</td>
                <td><a href="/admin/paymentDetail?no=${member.orderNo}">상세보기</a>
                </td>
                </tr>
                  </c:forEach> 
                  </tbody>
              </table>
              
             
              </div>
              
              </section>
              <!-- End Default Table Example -->
 
					<!-- End Default Table Example -->
			<section>
			<div id="modulePaging"
				style="display: inline-block;">
				<c:if test="${prePage!=null }">
					<a href="/admin/payment/${prePage}">&lt;</a>
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
					<a href="/admin/payment/${nextPage}">&gt;</a>
				</c:if>
			</div>
			</section>
		
		<input type="hidden" value="${selectPage}" id="selectPage">

<footer class="footer"><jsp:include
					page="${pageContext.request.contextPath}/WEB-INF/common/footer.jsp" /></footer>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="/resources/user/js/adminPaymentSearching.js"></script> 
<script>
window.onload = function(){
	var footer = document.querySelector('#modulePaging');
	var footerReal = document.querySelector('footer');
	var footerRect = footer.getBoundingClientRect();
	var footerRealRect = footerReal.getBoundingClientRect();
	if (footerRect.top + footerRect.height >= footerRealRect.top) {
		footerReal.classList.remove("footer");
	}	
}
</script>
</body>

</html>