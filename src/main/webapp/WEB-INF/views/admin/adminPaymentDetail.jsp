<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html style="background-color:#f5f6f7;">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>결제상세</title>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/common/adminHeader.jsp" />

<style>
select, option{
	height: 30px;
	font-size: 18px;
}

#hero{
	height: auto;
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
	margin: 100px 0;
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

	
			<section style="padding: 0; margin: 0;">
			<div id="tables">
              <table id="table" class="table">
                <thead id="thead">
                <tr>
                	<th id="orderNo" style="width:20%;">주문번호 : ${member.orderNo}</th>
                	<th colspan="3" ></th>
                	<th>결제날짜 : ${member.payDate}</th>
                </tr>
                <tr>
                <th id="name" scope="col">이름 : ${member.name} </th>
                <th id="address" colspan="3" scope="col"><label for="adr">주소 : </label><input type="text" class="address_input_1" name="adr" id="adr" placeholder="우편번호" style="width: 80px;" value="${member.address.split('   ')[0]}" required>
						<input type="text" style="width: 240px;" class="address_input_2" name="adr2" id="adr2" placeholder="주소" value="${member.address.split('   ')[1]}" required>
						<input type="text" style="width: 120px;" class="address_input_3" name="adr3" id="adr3" placeholder="상세주소" value="${member.address.split('   ')[2]}" required>
						<a style="padding: 4px 20px; width: 80px; background: #323232; border: none; color: white;" class="btn-get-started animate__animated" onclick="sample6_execDaumPostcode()">우편번호찾기</a></th>
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
				
				<c:forEach var="product" items="${product}">
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
                  	<a href="javascript:location.href=document.referrer" style="padding: 4px 20px; background: #323232; border: none; color: white;" class="btn-get-started animate__animated">돌아가기</a>
                  	<a onClick="location.href='/admin/paymentModify/${member.orderNo}/'+document.getElementById('adr').value+'/'+document.getElementById('adr2').value+'/'+document.getElementById('adr3').value+'?path='+route" style="padding: 4px 20px; background: #323232; border: none; color: white;" class="btn-get-started animate__animated">수정하기</a>
                  	</form>
                  	</td>
                  </tr>
                  
                </tbody>
              </table>
              <div class="bottom" style="height: 30px;"></div>
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
              
              </div>
              
              </section>


<footer class="footer"><jsp:include
					page="${pageContext.request.contextPath}/WEB-INF/common/footer.jsp" /></footer>
					
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/user/js/main.js"></script>
<script defer>
var footer = document.querySelector('.bottom');
var footerReal = document.querySelector('footer');
var footerRect = footer.getBoundingClientRect();
var footerRealRect = footerReal.getBoundingClientRect();
if (footerRect.top + footerRect.height >= footerRealRect.top) {
	footerReal.classList.remove("footer");
}	
console.log(document.referrer.split('/'))
const path = [];
var q = document.referrer.split('/').length;
for(var i=0; i<document.referrer.split('/').length; i++){
	if(document.referrer.split('/')[i] == 'admin'){
		q = i;
	}
}
let route = '';
for(var j=q; j<document.referrer.split('/').length; j++){
	route = route +'/' + document.referrer.split('/')[j];
}
</script>
</body>

</html>