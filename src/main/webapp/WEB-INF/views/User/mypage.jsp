<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/common/header.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<style>
 section {
	width:1000px;
	margin : 0 auto;
}

/*tab css*/
.tab{float:left; width:600px; }
.tabnav{font-size:0;  border:1px solid #ddd; }
.tabnav li{display: inline-block;  text-align:center; border-right:1px solid #ddd;justify-content: flex-end;}
.tabnav li a:before{content:""; position:absolute; left:0; top:0px; width:100%; height:3px; }
.tabnav li a.active:before{background:#7ea21e;}
.tabnav li a.active{border-bottom:1px solid #fff;}
.tabnav li a{ position:relative; display:block; background: #f8f8f8; color: #000; padding:0 30px; line-height:46px; text-decoration:none; font-size:16px; }
.tabnav li a:hover,
.tabnav li a.active{background:#fff; color:#7ea21e; }
.tabcontent{padding: 20px;  border:1px solid #ddd; border-top:none;}
.on {height:100%;} 

</style>
</head>
<body>

<section>

<ul class="tabnav" id="myTab">
  <li class="on">
    <a class="nav-link active" aria-current="page" href="#" id="first">내정보</a>
  </li>
  <li>
    <a class="nav-link" href="#">버킷내역</a>
    
  </li>
  <li>
    <a class="nav-link" href="#">결제내역</a>
  </li>
  
  
</ul>  


<div class="tabcontent">
      <div id="on">
      <jsp:include page="/WEB-INF/views/User/mypage_myInfo.jsp" />
      
      
      
      
      
      </div>
</div>
<div class="tabcontent">
      <div >tab2 content</div>
</div>
<div class="tabcontent">
      <div>tab3 content</div>
</div>

</section>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script>
  $(function ($) {
	  $(".tabcontent").eq(0).show(0);
	  $(".tabnav li").click(function () {
	    var idx = $(this).index();
	    $(".tabcontent").hide();
	    $(".tabcontent").eq(idx).show();
	    $(".tabnav li").removeClass("on");
	    $(this).addClass("on");
	  });
	});
  
  </script>
  <jsp:include page="/WEB-INF/common/footer.jsp" />
</body>

</html>