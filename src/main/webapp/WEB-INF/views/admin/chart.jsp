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
							<input type="hidden" id="category1${index1}" value="${list.category}">
							<input type="hidden" id="payCount1${index1}" value="${list.category_paycount}">
							<input type="hidden" value="${index1=index1+1}">
							</c:forEach>
							<input type="hidden" id="chartValue1" value="${index1}">
							
							<c:set var="index2" value="0" />
							<c:forEach var="list" items="${chart2}">
							<input type="hidden" id="pro_name${index2}" value="${list.pro_name}">
							<input type="hidden" id="pro_bucketcount${index2}" value="${list.pro_bucketcount}">
							<input type="hidden" value="${index2=index2+1}">
							</c:forEach>
							<input type="hidden" id="chartValue2" value="${index2}">
							
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
	
	const chartCategory1 = [];
	const chartPayCount1 = [];
	for(var i = 0; i<document.getElementById('chartValue1').value; i++){
		chartCategory1.push(document.getElementById('category1'+i).value);
		chartPayCount1.push(document.getElementById('payCount1'+i).value);
	}
	
	const chartProName2 = [];
	const chartBucketCount2 = [];
	for(var i = 0; i<document.getElementById('chartValue2').value; i++){
		chartProName2.push(document.getElementById('pro_name'+i).value);
		chartBucketCount2.push(document.getElementById('pro_bucketcount'+i).value);
	}

	
		// Get the canvas element
		const ctx1 = document.getElementById('myChart1').getContext('2d');

		// Define the data for the chart
		const data1 = {
			labels : chartCategory1,
			datasets : [ {
				label : '카테고리 별 주문횟수',
				data : chartPayCount1,
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
		        		  text:'카테고리',
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
						labels : chartProName2,
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
			labels : [ 'January', 'February', 'March', 'April', 'May', 'June',
					'July' ],
			datasets : [ {
				label : '주간 매출현황',
				data : [ 65, 59, 80, 81, 56, 55, 40 ],
				fill : false,
				borderColor : 'rgb(75, 192, 192)',
				tension : 0.1
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
			labels : [ '', 'January', 'February', 'March', 'April', 'May', 'June',
					'July' ],
			datasets : [ {
				label : '남자',
				data : [ {
					x : 'January',
					y : 30,
					r : 15
				}, {
					x : 'February',
					y : 10,
					r : 10
				}, {
					x : 'April',
					y : 40,
					r : 25
				}, {
					x : 80,
					y : 60,
					r : 20
				} ],
				backgroundColor : 'rgba(25, 99, 132, 0.2)',
				borderColor : 'rgba(25, 99, 132, 1)',
				borderWidth : 1
			},
			{
				label : '여자',
				data : [ {
					x : 'January',
					y : 50,
					r : 15
				}, {
					x : 'February',
					y : 30,
					r : 10
				}, {
					x : 'April',
					y : 20,
					r : 25
				}, {
					x : 80,
					y : 10,
					r : 20
				} ],
				backgroundColor : 'rgba(255, 99, 132, 0.2)',
				borderColor : 'rgba(255, 99, 132, 1)',
				borderWidth : 1
			} 
			]
		};

		// Bubble chart의 옵션을 정의합니다.
		const options4 = {
			scales : {
				
				x : { title:{
	        		  display:true,
	        		  text:'카테고리',
	        		  font:{
	        			  size:14,
	        			  weight:'bold'
	        		  }
	        	  },
					type : 'category',
					position : 'bottom'
				},
				y : {
					type : 'linear',
					position : 'left',
					 title:{
		        		  display:true,
		        		  text:'구매횟수',
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