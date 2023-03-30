<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chart</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>


b{
	text-align: center;
	font-family: 'SUIT-Regular', normal;font-weight:900;
}
	
.chartTitle{
	text-align: center;
}
	
.grid-container {
	background-color:#f5f6f7;
	margin: 0 auto;	
	width: 1000px;
	display: grid;
	grid-template-rows: auto;
	grid-template-columns: repeat(2, 1fr);
	column-gap: 100px;
}
.chart1, .chart2{
background-color:#f5f6f7;
	margin-top: 100px;
}
.chart3, .chart4{
background-color:#f5f6f7;
	margin-top: 100px;
	margin-bottom: 100px;
}

.chart-item {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 500px;
  height: 300px;
}

#myChart1, #myChart2, #myChart3, #myChart4{
	width: 500px;
	height: 300px;
}


#myChart1{
	grid-row: 1;
	grid-column: 1;
}
#myChart2{
	grid-row: 1;
	grid-column: 2;
}
#myChart3{
 	 grid-row: 2;
 	 grid-column: 1;
}
#myChart4{
	grid-row: 2;
	grid-column: 2;
}
</style>
</head>
<header>
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/common/adminHeader.jsp" />
</header>
<body>


<div style="background-color:#f5f6f7;">
	<div class="grid-container">
	<div class="chart1">
  <div class="chart-container">
     <div class="chartTitle"><b style="padding-left:50px;">상품별 주문 횟수</b></div>
    <div class="chart-item">
      <canvas id="myChart1"></canvas>
    </div>
  </div>
</div>

<div class="chart2">
  <div class="chart-container">
    <div class="chartTitle"><b style="padding-left:20px;">상품별 버킷 횟수</b></div>
    <div class="chart-item">
      <canvas id="myChart2"></canvas>
    </div>
  </div>
</div>
  
<div class="chart3">
  <div class="chart-container">
    <div class="chartTitle"><b style="padding-left:50px;">주간 매출</b></div>
    <div class="chart-item">
      <canvas id="myChart3"></canvas>
    </div>
  </div>
</div>
  
<div class="chart4">
  <div class="chart-container">
    <div class="chartTitle"><b>카테고리별 구매분포도</b></div>
    <div class="chart-item">
      <canvas id="myChart4"></canvas>
    </div>
  </div>
</div>
</div>
	</div>						
							<c:set var="index1" value="0" />
							<c:forEach var="list" items="${chart1}">
							<input type="hidden" id="serialNumber1${index1}" value="${list.serialNumber}">
							<input type="hidden" id="payCount1${index1}" value="${list.payCount}">
							<input type="hidden" value="${index1=index1+1}">
							</c:forEach>
							<input type="hidden" id="chartValue1" value="${index1}">
							
							<c:set var="index2" value="0" />
							<c:forEach var="list" items="${chart2}">
							<input type="hidden" id="serialNumber2${index2}" value="${list.serialNumber}">
							<input type="hidden" id="bucketCount1${index2}" value="${list.bucketCount}">
							<input type="hidden" value="${index2=index2+1}">
							</c:forEach>
							<input type="hidden" id="chartValue2" value="${index2}">
							
							<c:set var="index3" value="0" />
							<c:forEach var="list" items="${chart3}">
							<input type="hidden" id="week1${index3}" value="${list.week}">
							<input type="hidden" id="sales1${index3}" value="${list.sales}">
							<input type="hidden" value="${index3=index3+1}">
							</c:forEach>
							<input type="hidden" id="chartValue3" value="${index3}">
	
				
	

<footer>
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/common/footer.jsp" />
		</footer>
	<script>
	let sum;
	const chartProduct1 = [];
	const chartPaycount1 = [];
	for(var i = 0; i<document.getElementById('chartValue1').value; i++){
		chartProduct1.push(document.getElementById('serialNumber1'+i).value);
		chartPaycount1.push(document.getElementById('payCount1'+i).value);
	}
	
	const chartProduct2 = [];
	const chartBucketCount2 = [];
	for(var i = 0; i<document.getElementById('chartValue2').value; i++){
		chartProduct2.push(document.getElementById('serialNumber2'+i).value);
		chartBucketCount2.push(document.getElementById('bucketCount1'+i).value);
	}
	const chartWeek1 = [];
	const chartSales1 = [];
	const chartData3 = {'일요일': 0, '월요일': 0, '화요일': 0, '수요일': 0, '목요일': 0, '금요일': 0, '토요일': 0};
	for(var i = 0; i<document.getElementById('chartValue3').value; i++){
		if(document.getElementById('week1'+i).value in chartData3){
			chartData3[document.getElementById('week1'+i).value] = document.getElementById('sales1'+i).value;
		}
	}
	const woman = ${chart4Woman};
	const man = ${chart4Man};
	const ages = ${chart4Age};
	const categorys = ${chart4Category};
	
	const womanChartData = [];	
	const manChartData = [];
	let sum4 = 0;
	for(var i=0; i<woman.length; i++){
		sum4 += woman[i].productCount
	}
	for(var i=0; i<man.length; i++){
		sum4 += man[i].productCount
	}
	console.log(sum4)
	
	for(var i=0; i<woman.length; i++){
		let womanData = {};
		womanData['x'] = woman[i].categorySerial
		womanData['y'] = woman[i].age		
		womanData['r'] = Math.floor(woman[i].productCount/sum4*100)
		womanChartData.push(womanData);
	}
	
	for(var i=0; i<man.length; i++){
		let manData = {};
		manData['x'] = man[i].categorySerial
		manData['y'] = man[i].age
		manData['r'] = Math.floor(man[i].productCount/sum4*100)
		manChartData.push(manData);
	}

		const ctx1 = document.getElementById('myChart1').getContext('2d');

		const data1 = {
			labels : chartProduct1,
			datasets : [ {
				label : '상품별 주문 횟수',
				data : chartPaycount1,
				backgroundColor : 'rgba(255, 99, 132, 0.2)',
				borderColor : 'rgba(255, 99, 132, 1)',
				borderWidth : 1
			} ]
		};

		const options1 = {
				
				scales: {
		          x:{
		        	  title:{
		        		  display:true,
		        		  text:'상품명',
		        		  font:{
		        			  size:14,
		        			  weight:'bold'
		        		  }
		        	  }
		          },
		          y:{
		        	  title:{
		        		  display:true,
		        		  text:'주문횟수',
		        		  font:{
		        			  size:14,
		        			  weight:'bold'
		        		  }
		        	  }
		          }
		        }
		};

		const myChart1 = new Chart(ctx1, {
			type : 'bar',
			data : data1,
			options : options1
		});

		const ctx2 = document.getElementById('myChart2').getContext('2d');
		const myChart2 = new Chart(ctx2,
				{
					type : 'doughnut',
					data : {
						labels : chartProduct2,
						datasets : [ {
							label : '버킷횟수',
							data : chartBucketCount2,
							backgroundColor : [ 'rgb(255, 99, 132)',
									'rgb(54, 162, 235)', 'rgb(255, 205, 86)',
									'rgb(75, 192, 192)', 'rgb(153, 102, 255)',
									'rgb(255, 159, 64)' ],
							borderWidth : 1
						} ]
					},
					options : {
						
						responsive : true,
						maintainAspectRatio : false
					}
				});

		const data3 = {
			labels : chartWeek1,
			datasets : [ {
				label : '주간 매출액',
				data : chartData3,
				fill : false,
				borderColor : 'rgb(75, 192, 192)',
				tension : 0.1,
				borderWidth : 1
			} ]
		};

		// Line chart의 옵션을 정의합니다.
		const options3 = {
				 
				scales: {
			          x:{
			        	  title:{
			        		  display:true,
			        		  text:'요일',
			        		  font:{
			        			  size:14,
			        			  weight:'bold'
			        		  }
			        	  }
			          },
			          y:{
			        	  title:{
			        		  display:true,
			        		  text:'매출',
			        		  font:{
			        			  size:14,
			        			  weight:'bold'
			        		  }
			        	  }
			          }
			        }
		};

		const ctx3 = document.getElementById('myChart3').getContext('2d');
		const myChart3 = new Chart(ctx3, {
			type : 'line',
			data : data3,
			options : options3
		});

		const data4 = {
			
			datasets : [ {
				label : '남자',
				data : manChartData,
				backgroundColor : 'rgba(25, 99, 132, 0.2)',
				borderColor : 'rgba(25, 99, 132, 1)',
				borderWidth : 1
			},
			{
				label : '여자',
				data : womanChartData,
				backgroundColor : 'rgba(255, 99, 132, 0.2)',
				borderColor : 'rgba(255, 99, 132, 1)',
				borderWidth : 1
			} 
			]
		};

		const options4 = {
			scales : {
				
				x : { 
					labels: categorys,
					title:{
	        		  display:true,
	        		  text:'상품 카테고리',
	        		  font:{
	        			  size:14,
	        			  weight:'bold'
	        		  }
	        	  },
					type : 'category',
					position : 'bottom'
				},
				y : {
					labels : ages,
					type : 'category',
					position : 'left',
					 title:{
		        		  display:true,
		        		  text:'나이',
		        		  font:{
		        			  size:14,
		        			  weight:'bold'
		        		  }
		        	  }
				}
			}
		};

		const ctx4 = document.getElementById('myChart4').getContext('2d');
		const myChart4 = new Chart(ctx4, {
			type : 'bubble',
			data : data4,
			options : options4
		}); 
	</script>
</body>

</html>