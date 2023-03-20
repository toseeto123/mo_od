<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chart</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>

<body>
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/common/adminHeader.jsp" />

	<!-- ======= Hero Section ======= -->
	<section id="hero">
		<div class="hero-container">
			<div id="heroCarousel" data-bs-interval="5000"
				class="carousel slide carousel-fade" data-bs-ride="carousel">
				<div class="carousel-inner">

					<div class="carousel-item active">
						<div class="carousel-container" style="background: white;">
							<div>
								<div
									style="position: absolute; top: 15%; left: 25%; width: 300px; height: 300px;">
									<canvas id="myChart1" style="width: 300px; height: 300px;"></canvas>
								</div>
								<div
									style="position: absolute; top: 15%; right: 25%; width: 300px; height: 300px;">
									<canvas id="myChart2" style="width: 300px; height: 300px"></canvas>
								</div>
								<div
									style="position: absolute; top: 60%; left: 25%; width: 300px; height: 300px;">
									<canvas id="myChart3" style="width: 300px; height: 300px"></canvas>
								</div>
								<div
									style="position: absolute; top: 60%; right: 25%; width: 300px; height: 300px;">
									<canvas id="myChart4" style="width: 300px; height: 300px"></canvas>
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
							
							<c:set var="index4" value="0" />
							<c:forEach var="list" items="${chart4}">
							<input type="hidden" id="gender${index4}" value="${list.gender}">
							<input type="hidden" id="week2${index4}" value="${list.week}">
							<input type="hidden" id="productCount${index4}" value="${list.productCount}">
							<input type="hidden" id="categorySerial${index4}" value="${list.categorySerial}">							
							<input type="hidden" value="${index4=index4+1}">
							</c:forEach>
							<input type="hidden" id="chartValue4" value="${index4}">
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!-- End Hero -->


	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/common/footer.jsp" />
	<script>
	
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
	
	
	const chartDictionary = {};
	const womanChartData = [];
	const manChartData = [];
	const categorySerial = [];
	const productCount = []; 
	for(var i = 0; i<document.getElementById('chartValue4').value; i++){
		 chartDictionary['y'] = document.getElementById('week2'+i).value;
		 productCount.push(document.getElementById('productCount'+i).value);
		chartDictionary['r'] = document.getElementById('productCount'+i).value;
		chartDictionary['x'] = document.getElementById('categorySerial'+i).value;
		categorySerial.push(document.getElementById('categorySerial'+i).value)
		if(document.getElementById('gender'+i).value == 'F'){
			womanChartData.push(chartDictionary);

		}else{
			manChartData.push(chartDictionary)
		}		
	}
	let max = 0;
	for(var i=0; i<productCount.length; i++){
		max = max + productCount[i];
	}
	for(var i = 0; i<womanChartData.length; i++){
		womanChartData[i]['r'] = womanChartData[i]['r']/max*100;
	}
	for(var i = 0; i<manChartData.length; i++){ 
		manChartData[i]['r'] = manChartData[i]['r']/max*100;
	}
	

		// Get the canvas element
		const ctx1 = document.getElementById('myChart1').getContext('2d');

		// Define the data for the chart
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

		// Set options for the chart
		const options1 = {
				
				scales: {
		          x:{
		        	  title:{
		        		  display:true,
		        		  text:'상품코드',
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

		// Create the chart
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
							label : '장바구니횟수',
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

		// Line chart를 그릴 데이터를 정의합니다.
		const data3 = {
			labels : chartWeek1,
			datasets : [ {
				label : '요일별 매출(올해)',
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

		// Canvas 요소를 선택하고, Line chart를 생성합니다.
		const ctx3 = document.getElementById('myChart3').getContext('2d');
		const myChart3 = new Chart(ctx3, {
			type : 'line',
			data : data3,
			options : options3
		});

		// Bubble chart를 그릴 데이터를 정의합니다.
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

		// Bubble chart의 옵션을 정의합니다.
		const options4 = {
			scales : {
				
				x : { 
					labels: categorySerial,
					title:{
	        		  display:true,
	        		  text:'카테고리(판매비율)',
	        		  font:{
	        			  size:14,
	        			  weight:'bold'
	        		  }
	        	  },
					type : 'category',
					position : 'bottom'
				},
				y : {
					labels : [ '토요일', '금요일', '목요일', '수요일', '화요일', '월요일', '일요일'],
					type : 'category',
					position : 'left',
					 title:{
		        		  display:true,
		        		  text:'요일',
		        		  font:{
		        			  size:14,
		        			  weight:'bold'
		        		  }
		        	  }
				}
			}
		};

		// Canvas 요소를 선택하고, Bubble chart를 생성합니다.
		const ctx4 = document.getElementById('myChart4').getContext('2d');
		const myChart4 = new Chart(ctx4, {
			type : 'bubble',
			data : data4,
			options : options4
		});
	</script>
</body>

</html>