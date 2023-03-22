<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
a:hover {
	cursor: pointer;
}

*:focus {
	outline: 0;
}
</style>
</head>
<body>
	<jsp:include page="../../common/adminHeader.jsp" />

	<!-- ======= Hero Section ======= -->
	<section id="hero" style="background: white;">
		<div class="hero-container">
			<div style="width: 25%; margin-top: 5%; margin-left: 39%;">
				<select id="searchWhat">
					<option value="name">회원이름</option>
					<option value="pro_name">상품이름</option>
					<option value="seria">상품 고유번호</option>
				</select> <input type="search" id="search"> <input type="button"
					style="background: transparent; width: 70px; color: white; border-radius: 10px; border: 2px solid #deb887;"
					id="searchBtn" value="찾기"
					onMouseover="this.style.background='#d2b48c';"
					onMouseout="this.style.background='transparent'" onclick="search()">

			</div>

			<table class="table" id="table">
				<thead>
					<tr>
						<th scope="col">등록 번호</th>
						<th scope="col">회원 이름</th>
						<th scope="col">상품 이름</th>
						<th scope="col">상품 옵션</th>
						<th scope="col">상품 금액</th>
						<th scope="col">상품 수량</th>
						<th scope="col">상품 고유번호</th>
						<th scope="col">삭제</th>
					</tr>
				</thead>
				<tbody id="tbody">
					<c:forEach var="cateList" items="${cateList }">
						<tr class="deleteplz">
							<th scope="col">${cateList.cate_id }</th>
							<th scope="col">${cateList.name }</th>
							<th scope="col">${cateList.pro_name }</th>
							<th scope="col">${cateList.pro_option }</th>
							<th scope="col">${cateList.pro_price }</th>
							<th scope="col">${cateList.amount }</th>
							<th scope="col">${cateList.pro_serialnumber}</th>
							<th scope="col"><button type="button"
									onclick="deletecate(this)">삭제</button></th>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- End Default Table Example -->
			<div id="modulePaging"
				style="display: inline-block; position: absolute; left: 50%; transform: translateX(-50%); font-size: 20px;">
				<c:if test="${prePage!=null }">
					<a href="/admin/admincate.do/${prePage}">&lt;</a>
				</c:if>

				<c:forEach items="${ pagingNo }" var="no">
					<c:choose>
						<c:when test="${selectPage == no}">
				                  &nbsp;<a style="color: green"
								href="/admin/admincate.do/${no}">${no}</a>&nbsp;
				                  </c:when>
						<c:otherwise>
				                  &nbsp;<a href="/admin/admincate.do/${no}">${no}</a>&nbsp;
				                  </c:otherwise>
					</c:choose>
				</c:forEach>

				<c:if test="${nextPage != null }">
					<a href="/admin/admincatet.do/${nextPage}">&gt;</a>
				</c:if>
			</div>

			<div></div>
		</div>
		<input type="hidden" value="${selectPage}" id="selectPage">
	</section>
	<!-- End Hero -->
	<script type="text/javascript">
		 function deletecate(element){
			  const cateId = element.closest('tr').querySelector('th:first-of-type').textContent;
			  const data = { cateId: Number(cateId) };
			  console.log(cateId,data)
			    let xhr = new XMLHttpRequest();
			   xhr.open('POST', '/catedelete.do', true);
			   xhr.setRequestHeader('Content-Type', 'application/json');
			   xhr.onreadystatechange = function() {
				      if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
				    	  location.reload();
				      }
			}
			xhr.send(JSON.stringify(data));
			location.reload();
		}
			
		
		
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
		
			if(tableData.vo.prePage > 0){
				pagingNumber += "<a "+"id='preView'"+" style='color:#deb887' onMouseover='colorChangeOver(this)' onMouseout='colorChangeOut(this)' onclick='pageView(this)'>&lt;</a> ";
				preView = tableData.vo.prePage;
				}
		
		for(var q=0; q<tableData.vo.pagingNo.length; q++){
			if(data.page == tableData.vo.pagingNo[q]){
			pagingNumber += " &nbsp;<a "+"id='page"+q+"'"+" style='color:green' onclick='pageView(this)'>"+tableData.vo.pagingNo[q]+"</a>&nbsp; ";
			}else{
				pagingNumber += " &nbsp;<a "+"id='page"+q+"'"+" style='color:#deb887' onMouseover='colorChangeOver(this)' onMouseout='colorChangeOut(this)' onclick='pageView(this)'>"+tableData.vo.pagingNo[q]+"</a>&nbsp; ";
			}
			
			pagingNo.push(tableData.vo.pagingNo[q]);
		}
		if(tableData.vo.nextPage > 0){
			pagingNumber += " <a "+"id='nextView'"+" style='color:#deb887' onMouseover='colorChangeOver(this)' onMouseout='colorChangeOut(this)' onclick='pageView(this)'>&gt;</a>"
			nextView = tableData.vo.nextPage;
		}
		
		paging.innerHTML = pagingNumber;
		
		
		const tbody = document.getElementById("tbody");
		while (tbody.firstChild) {
			  tbody.removeChild(tbody.firstChild);
			}
		for(var i=0; i<tableData.list.length; i++){
			var newRow = document.createElement("tr");
			var btnTag = document.createElement("button");
			btnTag.addEventListener('click', () => deletecate(btnTag));
			var newCell = [];
			for(var t=0; t<8; t++){
				newCell.push(document.createElement("th"));
				newCell[t].setAttribute("scope", "col");
			}				
			newCell[0].innerHTML = tableData.list[i].cate_id;
			newCell[1].innerHTML = tableData.list[i].name;
			newCell[2].innerHTML = tableData.list[i].pro_name;
			newCell[3].innerHTML = tableData.list[i].pro_option;
			newCell[4].innerHTML = tableData.list[i].pro_price;
			newCell[5].innerHTML = tableData.list[i].amount;
			newCell[6].innerHTML = tableData.list[i].pro_serialnumber;
			btnTag.innerHTML = '삭제';
			newCell[7].appendChild(btnTag);
			for(var x=0; x<8; x++){
				newRow.appendChild(newCell[x]);
			}
			
			tbody.appendChild(newRow);
			} 
		
		}

		xhttp.open("GET", "/admin/admincate.do/"+data.page+ "/" + data.searchWhat + "/" + data.search, true);
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

	<jsp:include page="../../common/footer.jsp" />
</body>

</html>