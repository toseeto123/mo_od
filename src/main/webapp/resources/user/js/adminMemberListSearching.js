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
			pagingNumber += "<a "+"id='preView'"+" style='color:#c8936ed4' onMouseover='colorChangeOver(this)' onMouseout='colorChangeOut(this)' onclick='pageView(this)'>&lt;</a> ";
			preView = tableData.vo.prePage;
			}
	
	for(var q=0; q<tableData.vo.pagingNo.length; q++){
		if(data.page == tableData.vo.pagingNo[q]){
		pagingNumber += " &nbsp;<a "+"id='page"+q+"'"+" style='color:green' onclick='pageView(this)'>"+tableData.vo.pagingNo[q]+"</a>&nbsp; ";
		}else{
			pagingNumber += " &nbsp;<a "+"id='page"+q+"'"+" style='color:#c8936ed4' onMouseover='colorChangeOver(this)' onMouseout='colorChangeOut(this)' onclick='pageView(this)'>"+tableData.vo.pagingNo[q]+"</a>&nbsp; ";
		}
		
		pagingNo.push(tableData.vo.pagingNo[q]);
	}
	if(tableData.vo.nextPage > 0){
		pagingNumber += " <a "+"id='nextView'"+" style='color:#c8936ed4' onMouseover='colorChangeOver(this)' onMouseout='colorChangeOut(this)' onclick='pageView(this)'>&gt;</a>"
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
		aTag.setAttribute("href", "/admin/adminMemberDetail/"+tableData.list[i].no);
		var newCell = [];
		for(var t=0; t<6; t++){
			newCell.push(document.createElement("td"));
			newCell[t].setAttribute("scope", "col");
			newCell[t].setAttribute("onClick", "location.href='/admin/adminMemberDetail/"+ tableData.list[i].no +"'")
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

	xhttp.open("GET", "/admin/adminMemberList/"+data.page+ "/" + data.searchWhat + "/" + data.search, true);
	xhttp.send();
	}
	
		function colorChangeOver(event){
			event.style.color='#D29953';
		}
		function colorChangeOut(event){
			event.style.color='#c8936ed4';
		}
		
		
		const searchInput = document.querySelector('input[type="search"]');

		searchInput.addEventListener('keydown', function(event) {
		  if (event.keyCode === 13) {
			  search();
		  }
		});
		