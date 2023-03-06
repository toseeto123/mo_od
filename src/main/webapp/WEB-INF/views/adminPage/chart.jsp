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
	<jsp:include page="../../common/adminHeader.jsp" />

	<!-- ======= Hero Section ======= -->
	<section id="hero">
		<div class="hero-container">
			<div id="heroCarousel" data-bs-interval="5000"
				class="carousel slide carousel-fade" data-bs-ride="carousel">
				<div class="carousel-inner">

					<div class="carousel-item active">
						<div class="carousel-container">
							<div>							
								<div style="position: absolute; top:15%; left:25%;">
								<canvas id="myChart1" style="width:300px; height:300px;"></canvas>
								</div>
								<div style="position: absolute; top:15%; right:25%;">
								<canvas id="myChart2"  style="width:300px; height:300px"></canvas>
								</div>								
								<div style="position: absolute; top:60%; left:25%;">
								<canvas id="myChart3"  style="width:300px; height:300px"></canvas>
								</div>
								<div style="position: absolute; top:60%; right:25%;">
								<canvas id="myChart4"  style="width:300px; height:300px"></canvas>
								</div>
							</div>
							<div></div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!-- End Hero -->


	<jsp:include page="../../common/footer.jsp" />
	<script>
	const ctx1 = document.getElementById('myChart1');
  new Chart(ctx1, {
    type: 'bar',
    data: {
      labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
      datasets: [{
        label: '# of Votes',
        data: [12, 19, 3, 5, 2, 3],
        backgroundColor: 'rgba(0, 103, 153, 1)',
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });

  
  const ctx2 = document.getElementById('myChart2').getContext('2d');
  const myChart2 = new Chart(ctx2, {
      type: 'doughnut',
      data: {
          labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
          datasets: [{
              label: '# of Votes',
              data: [16, 19, 3, 5, 2, 3],
              backgroundColor: [
                  'rgb(255, 99, 132)',
                  'rgb(54, 162, 235)',
                  'rgb(255, 205, 86)',
                  'rgb(75, 192, 192)',
                  'rgb(153, 102, 255)',
                  'rgb(255, 159, 64)'
              ],
              borderWidth: 1
          }]
      },
      options: {
          responsive: true,
          maintainAspectRatio: false
      }
  });

  
  // Line chart를 그릴 데이터를 정의합니다.
  const data3 = {
    labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
    datasets: [{
      label: 'My First Dataset',
      data: [65, 59, 80, 81, 56, 55, 40],
      fill: false,
      borderColor: 'rgb(75, 192, 192)',
      tension: 0.1
    }]
  };

  // Line chart의 옵션을 정의합니다.
  const options3 = {
    scales: {
      y: {
        beginAtZero: true
      }
    }
  };

  // Canvas 요소를 선택하고, Line chart를 생성합니다.
  const ctx3 = document.getElementById('myChart3').getContext('2d');
  const myChart3 = new Chart(ctx3, {
    type: 'line',
    data: data3,
    options: options3
  });

  
  
  // Bubble chart를 그릴 데이터를 정의합니다.
  const data4 = {
    datasets: [{
      label: 'My Dataset',
      data: [{
        x: 20,
        y: 30,
        r: 15
      }, {
        x: 40,
        y: 10,
        r: 10
      }, {
        x: 60,
        y: 40,
        r: 25
      }, {
        x: 80,
        y: 60,
        r: 20
      }],
      backgroundColor: 'rgba(255, 99, 132, 0.2)',
      borderColor: 'rgba(255, 99, 132, 1)',
      borderWidth: 1
    }]
  };

  // Bubble chart의 옵션을 정의합니다.
  const options4 = {
    scales: {
      x: {
        type: 'linear',
        position: 'bottom'
      },
      y: {
        type: 'linear',
        position: 'left'
      }
    }
  };

  // Canvas 요소를 선택하고, Bubble chart를 생성합니다.
  const ctx4 = document.getElementById('myChart4').getContext('2d');
  const myChart4 = new Chart(ctx4, {
    type: 'bubble',
    data: data4,
    options: options4
  });
</script>
</body>

</html>