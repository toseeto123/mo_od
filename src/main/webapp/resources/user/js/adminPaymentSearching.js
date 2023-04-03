const data = {}
const pagingNo = [];
let preView = 0;
let nextView = 0;

function search(){
	data.page = 1,
	data.searchWhat = document.getElementById("searchWhat").value,
	data.search = document.getElementById("search").value
	
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

	  if (this.status == 200) {
	  
	 	 	const paging = document.getElementById("modulePaging");
			while(paging.firstChild){
				paging.removeChild(paging.firstChild);
			}
		
			const tableData = JSON.parse(this.responseText);
			
			let pagingNumber = "";
	  
		  	if(tableData.vo.prePage > 0){
				pagingNumber += "<a "+"id='preView'"+" style='color:#323232;' onclick='pageView(this)'>&lt;</a> ";
				preView = tableData.vo.prePage;
			}

	  		for(var q=0; q<tableData.vo.pagingNo.length; q++){
				if(data.page == tableData.vo.pagingNo[q]){
					pagingNumber += " &nbsp;<a "+"id='page"+q+"'"+" style='color:green' onclick='pageView(this)'>"+tableData.vo.pagingNo[q]+"</a>&nbsp; ";
				}else{
					pagingNumber += " &nbsp;<a "+"id='page"+q+"'"+" style='color:#323232;' onclick='pageView(this)'>"+tableData.vo.pagingNo[q]+"</a>&nbsp; ";
				}		
				pagingNo.push(tableData.vo.pagingNo[q]);
			}
			
			if(tableData.vo.nextPage > 0){
				pagingNumber += " <a "+"id='nextView'"+" style='color:#323232;' onclick='pageView(this)'>&gt;</a>"
				nextView = tableData.vo.nextPage;
			}	
			paging.innerHTML = pagingNumber;

				
				const tables = document.getElementById("tables");
			
			while (tables.firstChild) {
	  			tables.removeChild(tables.firstChild);
			}		
			
			tables.innerHTML = '';
			let text = "<table id='table' class='table'>"
                +"<thead id='thead'>"
                +"<tr>"
                	+"<th>주문번호</th>"
                	+"<th>이름</th>"
                	+"<th>연락처</th>"
                	+"<th>주소</th>"
                	+"<th>결제날짜</th>"
                	+"<th>총금액</th>"
                	+"<th>상세보기</th>"
                +"</tr>"
                +"</thead>"
                +"<tbody id='tbody'>"
                
                
			for(var i=0; i<tableData.list.length; i++){
			
			var fullDate = new Date(tableData.list[i].payDate);
			var month = (fullDate.getMonth() < 9 ? '0' : '') + (fullDate.getMonth()+1);
			var date = fullDate.getFullYear() + '-' + month + '-' + fullDate.getDate();
			var no = tableData.list[i].orderNo;
			console.log(tableData.list);
				text = text
				+ "<tr>"
				+"<td>" + no + "</td>"
                +"<td>" + tableData.list[i].name + "</td>"
                +"<td>" + tableData.list[i].phone + "</td>"
                +"<td>" + tableData.list[i].address + "</td>"
                +"<td>" + date + "</td>"
                +"<td>&#8361; " + tableData.list[i].amount + "</td>"
                +"<td><a href='/admin/paymentDetail?no="+no+"'>상세보기</a></td>"
                +"</tr>"
                
				

				
						
			}
			text = text 
				+"</tbody>"
				+"</table>"			
			tables.innerHTML = text;				
				
			 setTimeout(function(){
			 	var footer = document.querySelector('#modulePaging');
				var footerReal = document.querySelector('footer');
				var footerRect = footer.getBoundingClientRect();
				var footerRealRect = footerReal.getBoundingClientRect();
				if (footerRect.top + footerRect.height >= footerRealRect.top) {
					footerReal.classList.remove("footer");
				}	
			 }, 0);
				
			
			 
			 
			 
			} else {
		console.log('Error: ' + this.statusText);
  		}

}



xhttp.open("GET", "/admin/payment/"+data.page+ "/" + data.searchWhat + "/" + data.search, true);
xhttp.send();
}
	
function colorChangeOver(event){//마우스 호버시
	event.style.color='#323232;';
}
function colorChangeOut(event){// 마우스 아웃시
	event.style.color='#323232;';
}
	
	
const searchInput = document.querySelector('input[type="search"]');

searchInput.addEventListener('keydown', function(event) {
  if (event.keyCode === 13) {
	  search();
  }
});