<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chart</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
a:hover {
	cursor: pointer;	
}
*:focus { outline: 0; }
</style>
</head>

<body>
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/common/adminHeader.jsp" />
	
	<!-- ======= Hero Section ======= -->
	<section id="hero" style="overflow: hidden; height: auto;">
		<div class="hero-container">
			<div style="width:25%; margin-top:5%; margin-left:39%;">
			<select id="searchWhat">
				<option value="id">아이디</option>
				<option value="name">이름</option>
			</select> <input type="search" id="search">
			
			
			<input type="button" style="background: transparent; width:70px; color:white; border-radius:10px; border: 2px solid #deb887;"
				id="searchBtn" value="찾기" onMouseover="this.style.background='#d2b48c';" onMouseout="this.style.background='transparent'" onclick="search()">
				</div>
				
			<table class="table" id="table"
				style="color: white; margin-top: 5%; margin-left: 15%; width: 70%;">
				<thead>

					<tr>
						<th scope="col" style="width: 10%;">회원번호</th>
						<th scope="col" style="width: 10%;">아이디</th>
						<th scope="col" style="width: 10%;">이름</th>
						<th scope="col" style="width: 20%;">연락처</th>
						<th scope="col">이메일</th>
						<th scope="col">상세정보</th>
					</tr>

				</thead>

				<tbody id="tbody">
					<c:forEach var="user" items="${userList}">
						<tr>
							<th scope="col">${user.no}</th>
							<th scope="col">${user.id}</th>
							<th scope="col">${user.name}</th>
							<th scope="col">${user.phone}</th>
							<th scope="col">${user.email}</th>
							<th scope="col"><a
								href="/admin/adminMemberDetail.do/${user.no}">상세정보</a></th>
						</tr>
					</c:forEach>
				</tbody>
			</table>

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
								href="/admin/adminMemberList.do/${no}">${no}</a>&nbsp;
                  </c:when>
						<c:otherwise>
                  &nbsp;<a href="/admin/adminMemberList.do/${no}">${no}</a>&nbsp;
                  </c:otherwise>
					</c:choose>
				</c:forEach>

				<c:if test="${nextPage != null }">
					<a href="/admin/adminMemberList.do/${nextPage}">&gt;</a>
				</c:if>
			</div>
			<div style="width: 100%; margin-top: 50px;"><jsp:include
					page="${pageContext.request.contextPath}/WEB-INF/common/footer.jsp" /></div>
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
		var aTag = document.createElement("a");
		aTag.setAttribute("href", "/admin/adminMemberDetail.do/"+tableData.list[i].no);
		var newCell = [];
		for(var t=0; t<6; t++){
			newCell.push(document.createElement("td"));
			newCell[t].setAttribute("scope", "col");
		}				
		newCell[0].innerHTML = tableData.list[i].no;
		newCell[1].innerHTML = tableData.list[i].id;
		newCell[2].innerHTML = tableData.list[i].name;
		newCell[3].innerHTML = tableData.list[i].phone;
		newCell[4].innerHTML = tableData.list[i].email;
		aTag.innerHTML = '상세보기';
		newCell[5].appendChild(aTag);
		for(var x=0; x<6; x++){
			newRow.appendChild(newCell[x]);
		}
		
		tbody.appendChild(newRow);
		} 

	}

	xhttp.open("GET", "/admin/adminMemberList.do/"+data.page+ "/" + data.searchWhat + "/" + data.search, true);
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
<script type="text/javascript" src="/resources/user/js/adminMemberListSearching.js"></script>
</body>
</html>