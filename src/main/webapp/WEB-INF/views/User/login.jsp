<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
   <title>Home</title>
    <link rel="stylesheet" href="/resources/user/css/login.css"/>
   
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
                    <input type="text" name="id" class="input-field" placeholder="User name or Email" required>
                    <input type="password" name="pwd" class="input-field" placeholder="Enter Password" required>
                    <input type="checkbox" class="checkbox"><span>Remember Password</span>
                    <button class="submit">Login</button>
                </form>
            </div>
        </div>
        

</body>
</html>