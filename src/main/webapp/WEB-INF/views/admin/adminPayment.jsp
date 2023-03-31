<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	margin: 110px 0;
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
	padding: 20px 0 26px;
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
			<c:forEach var="member" items="${member}">
              <table id="table" class="table">
                <thead id="thead">
                <tr>
                	<th id="orderNo" style="width:20%;">주문번호 : ${member.orderNo}</th>
                	<th colspan="3" ></th>
                	<th>결제날짜 : ${member.payDate}</th>
                </tr>
                <tr>
                <th id="name" scope="col">이름 : ${member.name}</th>
                <th id="address" colspan="3" scope="col">주소 : ${member.address}</th>
                <th id="phone" scope="col">연락처 : ${member.phone}</th>
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
                  	<a onClick="$('#myModal${member.orderNo}').modal('show');" style="padding: 4px 20px; background: #323232; border: none; color: white;" class="btn-get-started animate__animated">주문취소</a>
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
<script defer>
var footer = document.querySelector('#modulePaging');
var footerReal = document.querySelector('footer');
var footerRect = footer.getBoundingClientRect();
var footerRealRect = footerReal.getBoundingClientRect();
if (footerRect.top + footerRect.height >= footerRealRect.top) {
	footerReal.classList.remove("footer");
}	
</script>
</body>

</html>