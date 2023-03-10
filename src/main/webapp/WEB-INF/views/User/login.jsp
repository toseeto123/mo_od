<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
   <title>Home</title>
    <link rel="stylesheet" href="/resources/user/css/login.css"/>
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
                    <img src="/resources/user/img/fb.png" alt="naver">
                    <img src="/resources/user/img/tw.png" alt="kakao">
                    <img src="/resources/user/img/gl.png" alt="google">
                </div>
                <form id="login" action="/login.do" class="input-group" method="post">
                    <input type="text" name="id" class="input-field" placeholder="User name or Email" required autofocus>
                    <input type="password" name="pwd" class="input-field" placeholder="Enter Password" required>
                    
                
                   <c:choose>

                    <c:when test="${ msg == false == pwd }">
      		           <br><br>
                	     <p style="color:red; font-size: 10px;" >존재하지 않는 아이디 입니다</p>
                    </c:when> 

                   <c:when test="${ msg == false == id  } ">
      		             <br><br>
                	     <p style="color:red; font-size: 10px;" >존재하지 않는 비밀번호 입니다</p>
                   </c:when> 
					
					<c:when test="${ msg == false }">
                    	<br><br>
                	     <p style="color:red; font-size: 10px;" >존재하지 않는 아이디 또는 비밀번호 입니다</p>
					</c:when>
					
                    </c:choose>
                    
                    <br><br>
                    <button class="submit">Login</button>
                    
                    
                    <a href="/search_id" class="btn idfind">아이디 찾기</a>
                    <a href="/search_pwd" class="btn pwdfind">비밀번호찾기 찾기</a>
                </form>
            </div>
             
        </div>
</body>
</html>