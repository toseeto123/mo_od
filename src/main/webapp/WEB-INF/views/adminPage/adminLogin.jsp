<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
   <title>Home</title>
    <link rel="stylesheet" href="/resources/user/css/login.css"/>
    
     <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <script type="text/javascript" src="/resources/user/js/main.js"></script>
    
   
</head>
<body>

 <div class="wrap">
            <div class="form-wrap">
                <div class="button-wrap">
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="login()">LOG IN</button>
                </div>
                <div class="social-icons">
              <div style="font-size:30px;"><p style="display:inline; font-family:궁서;">묻:</p><p style="display:inline; font-family:굴림;">mo_od</p></div>
                </div>
                <form id="login" action="/adminLogin.do" class="input-group" method="post">
               
                    <input type="text" name="id" class="input-field" placeholder="Enter Id" required autofocus>
                    <input type="password" name="pwd" class="input-field" placeholder="Enter Password" required>

					<c:if test="${ msg == false }">
                    	<br><br>
                	     <p style="color:red; font-size: 10px;" >존재하지 않는 아이디 또는 비밀번호 입니다</p>
					</c:if>
					
                    <br><br>
                    <div>
                    <button class="submit" style="width: 130px; float:left;">Login</button>
                    <input type="button" class="submit" value="Client" onclick="location.href='/'" style="width: 130px; float:right;">
                    </div>
                </form>
            </div>
             
        </div>
</body>
</html>