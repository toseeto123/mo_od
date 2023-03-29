<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 관리자</title>
<jsp:include page="../../common/adminHeader.jsp" />
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
.footer{
	position: absolute;
	top: 130%;
	width: 100%;
}
</style>
</head>
<body>
	
	
	<section id="hero" style="background: white; height: auto;" class="container">
		<div class="searchParent">
			<div class="search" style="margin-top: 110px; margin-bottom: 50px;">
				<select id="searchWhat">
					<option value="name">상품명</option>
					<option value="id">일련번호</option>
				</select> <input type="search" id="search"> 
				<input type="button" id="searchBtn" value="찾기" onclick="search()">
				<input type="button" id="searchBtn" value="상품등록" onclick="location.href='/admin/insert'">
			</div>
			<table class="table"  id="table">
				<thead>
					<tr>
						<th scope="col">이미지</th>
						<th scope="col">카테고리</th>
						<th scope="col">상품일련번호</th>
						<th scope="col">상품명</th>
						<th scope="col">가격</th>
						<th scope="col">품절여부(판매여부)</th>
					</tr>
				</thead>
				<tbody id="tbody">

					<c:forEach var="list" items="${list}">
						<tr>
							<th scope="col"><img alt=""
								src="/resources/assets/img/product/${list.pro_img1}"
								style="width: 60px; height: 60px;"></th>

							<th><c:if test="${list.pro_categoryserial  eq 'A0' }">
                  가구 > 매트리스
                  </c:if> <c:if test="${list.pro_categoryserial  eq 'A1' }">
                  가구 > 침대프레임
                  </c:if> <c:if test="${list.pro_categoryserial  eq 'A2' }">
                  가구 > 침대프레임
                  </c:if> <c:if test="${list.pro_categoryserial  eq 'B0' }">
                  조명 > 무드등
                  </c:if> <c:if test="${list.pro_categoryserial  eq 'B1' }">
                  조명 > 스탠드조명
                  </c:if> <c:if test="${list.pro_categoryserial  eq 'C0' }">
                  수납 > 옷장/행거
                  </c:if> <c:if test="${list.pro_categoryserial  eq 'C1' }">
                  수납 > 서랍
                  </c:if> <c:if test="${list.pro_categoryserial  eq 'D0' }">
                  침실시공
                  </c:if> <c:if test="${list.pro_categoryserial  eq 'D1' }">
                  거실시공
                  </c:if> <c:if test="${list.pro_categoryserial  eq 'D2' }">
                  주방시공
                  </c:if> <c:if test="${list.pro_categoryserial  eq 'D3' }">
                  욕조시공
                  </c:if></th>
							<th scope="col">${list.pro_categoryserial}${list.pro_number}</th>

							<th scope="col">
							<a href="/admin/adminProDetail?pro_number=${list.pro_number}">${list.pro_name}</a>
							</th>
							<th scope="col"><fmt:formatNumber value="${list.pro_price}"
									type="currency" currencySymbol="₩" /></th>
							<c:if test="${list.pro_soldout eq 0}">
								<th scope="col">판매중</th>
							</c:if>
							<c:if test="${list.pro_soldout eq 1}">
								<th scope="col">판매중지</th>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="modulePaging"
				style="display: inline-block; position: absolute; left: 50%; transform: translateX(-50%);  font-size: 20px;">
				<c:if test="${prePage!=null }">
					<a href="/admin/adminProList/${prePage}">&lt;</a>
				</c:if>

				<c:forEach items="${ pagingNo }" var="no">
					<c:choose>
						<c:when test="${selectPage == no}">
                  &nbsp;<a style="color: green"
								href="/admin/adminProList/${no}">${no}</a>&nbsp;
                  </c:when>
						<c:otherwise>
                  &nbsp;<a href="/admin/adminProList/${no}">${no}</a>&nbsp;
                  </c:otherwise>
					</c:choose>
				</c:forEach>

				<c:if test="${nextPage != null }">
					<a href="/admin/adminProList/${nextPage}">&gt;</a>
				</c:if>

			</div>
		</div>
		<input type="hidden" value="${selectPage}" id="selectPage">
	</section>
	<!-- End Hero -->


	<script type="text/javascript">
	const data = {}
	const pagingNo = [];
	let preView = 0;
	let nextView = 0;
	function search(){
		data.page = 1,
		data.searchWhat = document.getElementById("searchWhat").value,
		data.search = document.getElementById("search").value
		console.log(searchWhat,search)
		if(data.search.trim() == '' || data.search == null){
			data.search = '(none)'
		}
		mainPagingEngine();
	}
	
	function pageView(event){
		if(event.id == 'preView'){
			data.page = preView;
		}else if(event.id == 'nextView'){
			data.page = nextView;
		}else{
			data.page = document.getElementById(event.id).innerHTML;
		}
		mainPagingEngine();
	}
	
	
	
	function mainPagingEngine(){
		const xhttp = new XMLHttpRequest();
		
		xhttp.onload = function() {
		const paging = document.getElementById("modulePaging");
		while(paging.firstChild){
			paging.removeChild(paging.firstChild);
		}
	
		const tableData = JSON.parse(this.responseText);
		let pagingNumber = "";
		console.log(tableData.vo)
		console.log(tableData.vo.page)
		console.log(tableData.vo.pagingNo)
		console.log(tableData.vo.nextPage)
		console.log(tableData.vo.prePage)
	
		if(tableData.vo.prePage > 0){
			pagingNumber += "<a "+"id='preView'"+" style='cursor:pointer; color:#deb887' onMouseover='colorChangeOver(this)' onMouseout='colorChangeOut(this)' onclick='pageView(this)'>&lt;</a> ";
			preView = tableData.vo.prePage;
			}
	
	for(var q=0; q<tableData.vo.pagingNo.length; q++){
		if(data.page == tableData.vo.pagingNo[q]){
		pagingNumber += " &nbsp;<a "+"id='page"+q+"'"+" style='cursor:pointer; color:green' onclick='pageView(this)'>"+tableData.vo.pagingNo[q]+"</a>&nbsp; ";
		}else{
			pagingNumber += " &nbsp;<a "+"id='page"+q+"'"+" style='cursor:pointer; color:#deb887' onMouseover='colorChangeOver(this)' onMouseout='colorChangeOut(this)' onclick='pageView(this)'>"+tableData.vo.pagingNo[q]+"</a>&nbsp; ";
		}
		
		pagingNo.push(tableData.vo.pagingNo[q]);
	}
	if(tableData.vo.nextPage > 0){
		pagingNumber += " <a "+"id='nextView'"+" style='cursor:pointer; color:#deb887' onMouseover='colorChangeOver(this)' onMouseout='colorChangeOut(this)' onclick='pageView(this)'>&gt;</a>"
		nextView = tableData.vo.nextPage;
	}
	
	paging.innerHTML = pagingNumber;
	
	
	const tbody = document.getElementById("tbody");
	while (tbody.firstChild) {
		  tbody.removeChild(tbody.firstChild);
		}
	
	for(var i=0; i<tableData.list.length; i++){
		var newRow = document.createElement("tr");
		var aTag = document.createElement("a");
		var img = document.createElement("img");
		img.style = "width: 60px; height: 60px;";
		img.setAttribute("src", "/resources/assets/img/product/"+tableData.list[i].pro_img1);
		aTag.setAttribute("href", "/admin/adminProDetail?pro_number="+tableData.list[i].pro_number);
		var newCell = [];
		for(var t=0; t<7; t++){
			newCell.push(document.createElement("td"));
			newCell[t].setAttribute("scope", "col");
		}				
		newCell[0].appendChild(img);
		img.innerHTML = tableData.list[i].pro_img1;
		
		if (tableData.list[i].pro_categoryserial == 'A0') {
			newCell[1].innerHTML = "가구 > 매트리스";
		} if(tableData.list[i].pro_categoryserial == 'A1') {
			newCell[1].innerHTML = "가구 > 침대프레임";
		} if(tableData.list[i].pro_categoryserial == 'A2') {
			newCell[1].innerHTML = "가구 > 소파";
		} if(tableData.list[i].pro_categoryserial == 'B0') {
			newCell[1].innerHTML = "조명 > 무드등";
		} if(tableData.list[i].pro_categoryserial == 'B1') {
			newCell[1].innerHTML = "조명 > 스탠드 조명";
		} if(tableData.list[i].pro_categoryserial == 'C0') {
			newCell[1].innerHTML = "수납 > 옷장/행거";
		} if(tableData.list[i].pro_categoryserial == 'C1') {
			newCell[1].innerHTML = "수납 > 서랍";
		} if(tableData.list[i].pro_categoryserial == 'D0') {
			newCell[1].innerHTML = "침실시공";
		} if(tableData.list[i].pro_categoryserial == 'D1') {
			newCell[1].innerHTML = "거실시공";
		} if(tableData.list[i].pro_categoryserial == 'D2') {
			newCell[1].innerHTML = "주방시공";
		} if(tableData.list[i].pro_categoryserial == 'D3') {
			newCell[1].innerHTML = "욕조시공";
		}
		
		newCell[2].innerHTML = tableData.list[i].pro_serialnumber;
		newCell[3].appendChild(aTag);
		aTag.innerHTML = tableData.list[i].pro_name;
		newCell[4].innerHTML = "₩"+tableData.list[i].pro_price;
		
		if(tableData.list[i].pro_soldout == '0') {
				newCell[5].innerHTML = "판매중";
		} if(tableData.list[i].pro_soldout == '1') {
				newCell[5].innerHTML = "판매중지";
		}
		
		for(var x=0; x<7; x++){
			newRow.appendChild(newCell[x]);
		}
		
		tbody.appendChild(newRow);
		} 
	}
	xhttp.open("GET", "/admin/adminProList/"+data.page+ "/" + data.searchWhat + "/" + data.search, true);
	xhttp.send();
	}
	
		function colorChangeOver(event){
			event.style.color='#78E150';
		}
		function colorChangeOut(event){
			event.style.color='#deb887';
		}
		
		
		const searchInput = document.querySelector('input[type="search"]');
		searchInput.addEventListener('keydown', function(event) {
		  if (event.keyCode === 13) {
			  search();
		  }
		});
		
	</script>
	
</body>
	<footer class="footer"><jsp:include page="../../common/footer.jsp" /></footer>
</html>