<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta name="google-signin-client_id" content="38260405754-99qf9j81rp019ft343rpp1fmq378qabg.apps.googleusercontent.com">
<meta charset="UTF-8">
   <title>Home</title>
    <link rel="stylesheet" href="/resources/user/css/login.css"/>
    <script type="text/javascript" src="/resources/user/js/main.js"></script>
 	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script type="text/javascript" src="/resources/user/js/googleLogin.js"></script>
        <script async defer src="https://apis.google.com/js/api.js" onload="googleGapiLoaded()"></script>
    	<script async defer src="https://accounts.google.com/gsi/client" onload="googleGisLoaded()"></script>
  <script>
  const result ="${msg}"
  if(result==="loginmsg"){
      alert('로그인이 필요한 서비스입니다. 로그인페이지로 이동합니다.');
  }
  </script>
  
</head>
<body>

 <div class="wrap">
            <div class="form-wrap">
            
                <div class="button-wrap">
                     <a href="index.jsp">
                         <img class="img-concert" src="/resources/user/img/beulaendeu.png"/>
                      </a>
                </div>
               <div class="social-icons">
               
               <a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=e862dc15e41ee83edaac20240a8bc9e5&redirect_uri=http://localhost:8080/member/kakaoLogin&response_type=code">
     	               <img src="/resources/user/img/ka.png" alt="kakao">
   	                 </a>
             
               <a id="custom-login-btn" href="javascript:void(0);" onclick="window.open('${naverUrl}','naverLogin','width=430,height=500,location=no,status=no,scrollbars=yes');"">
					<img src="http://static.nid.naver.com/oauth/small_w_in.PNG" width="100"/>
				</a>
				
				 
               
 			<!-- Google Login -->
 				<button style="background: transparent; border-color: transparent; position:absolute; top:23%; left:20%;" onclick="googleHandleAuthClick()"><img style="width:45px;" src="/resources/user/img/gl.png" alt="google"></button>

 				 <a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=e862dc15e41ee83edaac20240a8bc9e5&redirect_uri=http://localhost:8080/member/kakaoLogin&response_type=code">
     	               <img src="/resources/user/img/ka.png" alt="kakao">
   	                 </a>



			

                   
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

                    <button class="submit">로그인</button>
                     



                    

                </form>
                <a href="index.jsp" class="">메인 페이지</a>
                <a href="join.do" class="">회원가입</a>
            </div>
             </div>
        </div>
        
        
        
</body>
</html>