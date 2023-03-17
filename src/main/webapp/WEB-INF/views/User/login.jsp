<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<script>
                	
                	 </script>
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
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="login()">LOG IN</button>
                </div>
                <div class="social-icons">
                <!--                네이버로그인 -->
               <div class="col-sm-4 text-center ftco-animate" id="naverIdLogin" onclick="naverLoginclick()"></div>
  				 <!-- <a href="#" id="naverIdLogin" class="btn sns-naver" title="새창">네이버로 로그인</a>
  				<a href="#" id="kakaoLogin" class="btn sns-kakao" title="새창">카카오로 회원가입</a>
  				<a href="#" id="googleLogin" class="btn sns-google" title="새창">구글 회원가입</a>
  				
 -->			
 			<!-- Google Login -->
 				<button style="background: transparent; border-color: transparent; position:absolute; top:23%; left:20%;" onclick="googleHandleAuthClick()"><img style="width:45px;" src="/resources/user/img/gl.png" alt="google"></button>
 <script>
 	
		 var naverLogin = new naver.LoginWithNaverId({
   	      clientId: "dClx55_VYi9U61rOGPS2", // 본인걸로 수정, 띄어쓰기 금지.
   	      callbackUrl: "http://localhost:8080/login.do", // 아무거나 설정
   	      isPopup: false,
   	      loginButton: {color: "green", type: 1, height: 50}
   	      //callbackHandle: true
   	      
   	   });
  
   naverLogin.init();
	
	
	
   function naverLoginclick() {
   //window.addEventListener('load', function () {
   naverLogin.getLoginStatus(function (status) {

   if (status) {
      console.log(naverLogin.user);
      var age = naverLogin.user.getAge();
      var email = naverLogin.user.getEmail();
      var gender = naverLogin.user.getGender();
      var name = naverLogin.user.getName();
      
      
      $.ajax({
         type: 'post',
         url: 'naverSave',
         data: {'name':name, 'email':email,'age':age,'gender':gender},
         dataType: 'text',
         success: function(str) {
            if(str=='ok') {
               console.log('성공')
               // location.replace("/") 
            } else if(str=='no') {
               console.log('실패')
              // location.replace("http://localhost:8080/login.do")
            }
         },
         error: function(str) {
            console.log('오류 발생')
         }
      })

   } else {
      console.log("callback 처리에 실패하였습니다.");
   }
   })
}
</script>

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
                    <button class="submit">Login</button>
                    			
 				    <!--Add buttons to initiate auth sequence and sign out-->
    <button id="authorize_button" onclick="handleAuthClick()">로그인</button>
    <button id="signout_button" onclick="handleSignoutClick()">로그아웃</button>
    <pre id="content" style="white-space: pre-wrap;"></pre>
                    
                    <a href="/search_id" class="btn idfind">아이디 찾기</a>
                    <a href="/search_pwd" class="btn pwdfind">비밀번호찾기 찾기</a>
                </form>
            </div>
             
        </div>
        
        
        
</body>
</html>