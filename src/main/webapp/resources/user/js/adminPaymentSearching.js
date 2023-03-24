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



function mainPagingEngine(url){
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

				
				const tables = document.getElementById("tables");
			
			while (tables.firstChild) {
	  			tables.removeChild(tables.firstChild);
			}		
			
			tables.innerHTML = '';
			let text = '';
			for(var i=0; i<tableData.list.length; i++){
			var fullDate = new Date(tableData.list[i].payDate);
			var month = (fullDate.getMonth() < 9 ? '0' : '') + (fullDate.getMonth()+1);
			console.log(month);
			var date = fullDate.getFullYear() + '-' + month + '-' + fullDate.getDate();
				text = text +
				"<table id='table' class='table' style='margin-top:5%; margin-left:15%; width:70%;'>"
                +"<thead id='thead'>"
                +"<tr>"
                	+"<th id='orderNo' style='width:20%;'>주문번호 : " + tableData.list[i].orderNo + "</th>"
                	+"<th colspan='3' ></th>"
                	+"<th>결제날짜 : " + date + "</th>"
                +"</tr>"
                +"<tr>"
                +"<th id='name' scope='col'>이름 : " + tableData.list[i].name + "</th>"
                +"<th id='address' colspan='3' scope='col'>주소 : " + tableData.list[i].address +" </th>"       
              	+"<th id='phone' scope='col' style='width:30%;'>연락처 : " + tableData.list[i].phone + "</th>"
                +"</tr>"
                  +"<tr>"
                    +"<th scope='col'>상품번호</th>"
                    +"<th scope='col'>상품명</th>"
                    +"<th scope='col'>상품금액</th>"
                    +"<th scope='col'>수량</th>"
                    +"<th scope='col'>금액</th>"
                  +"</tr>"
                +"</thead>"                
                +"<tbody>";		
                		for(var j=0; j<tableData.productList.length; j++){
                		if(tableData.productList[j].orderNo == tableData.list[i].orderNo){
                			text =  text +"<tr>"
                    		+"<th scope='row'>" + tableData.productList[j].productNo +"</th>"
                    		+"<td>" + tableData.productList[j].productName +"</td>"
                    		+"<td>&#8361; " + tableData.productList[j].price +" </td>"
                    		+"<td> " + tableData.productList[j].productCount + " </td>"
                    		+"<td>&#8361; " + tableData.productList[j].productCount*tableData.productList[j].price + "</td>"
                  			+"</tr>"
                		}       		
                 
				}
				                                    
                text = text  +"<tr>"                  
                  	+"<td colspan='4' style='border-bottom:none;'></td>"
                  	+"<td id='memberAmount'>총금액: &#8361; " + tableData.list[i].amount + " </td>"
                  +"</tr>"                  
                  +"<tr>"
                  +"<td colspan='4' style='border-bottom:none'></td>"
                  +"<td style='border-bottom:none'>"
                  	+"<form action='#' method='post'>"
                  	+"<a href='#about' class='btn-get-started animate__animated'>주문취소</a>"
                  	+"</form>"
                  	+"</td>"
                  +"</tr>"
                  
                +"</tbody>"
              +"</table>";
				
				tables.innerHTML = text;
				
				
						
			}
			
			
			
			
			
				
				
			 
			 
			 
			 
			} else {
		console.log('Error: ' + this.statusText);
  		}

}



xhttp.open("GET", "/admin/payment.do/"+data.page+ "/" + data.searchWhat + "/" + data.search, true);
xhttp.send();
}
	
function colorChangeOver(event){//마우스 호버시
	event.style.color='#78E150';
}
function colorChangeOut(event){// 마우스 아웃시
	event.style.color='#deb887';
}
	
	
const searchInput = document.querySelector('input[type="search"]');

searchInput.addEventListener('keydown', function(event) {
  if (event.keyCode === 13) {
	  search();
  }
});