<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<jsp:include page="/WEB-INF/common/header.jsp" />
<style>
section {
	height:500px;
	width:1000px;
	margin : 0 auto;
}
</style>
</head>
<body>

<section>

<ul class="nav nav-tabs" id="myTab">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#" id="first">내정보</a>
  </li>
  <li class="nav-item" id="second">
    <a class="nav-link" href="#">버킷내역</a>
    
  </li>
  <li class="nav-item" id="third">
    <a class="nav-link" href="#">결제내역</a>
  </li>
</ul>  

</section>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <script>
  $('#myTab a').on('click', function (event) {
	  event.preventDefault()
	  $(this).tab('show')
	})
  </script>
  <jsp:include page="/WEB-INF/common/footer.jsp" />
</body>

</html>