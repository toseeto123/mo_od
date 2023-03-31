<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="/WEB-INF/common/header.jsp" />
<section id="hero" style="height : 350px;">
      <div class="hero-container">
         <div id="heroCarousel" data-bs-interval="5000"
            class="carousel slide carousel-fade" data-bs-ride="carousel">
            <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

            <div class="carousel-inner" role="listbox">

               Slide 1
               <div class="carousel-item active"
                  style="background-image: url(/resources/assets/img/slide/joinimg.png); height: 500px;">
                  <div class="carousel-container">
                     <div class="carousel-content" style="position: relative;bottom: 40px;">
                        <h2 class="animate__animated animate__fadeInDown">회원가입
                           </h2>
                        <p class="animate__animated animate__fadeInUp" style="display: inline-block; width: 150px;">전체 필수입력 값입니다　</p>

                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>

<meta charset="UTF-8">


<script type="text/javascript" src="/resources/user/js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="/resources/user/css/join.css">

<style>
.logo {
	font-family: "궁서"
}
.logo2 {
	font-family: "굴림"
}
.join_title label {
font-size: 20px;
}
.Btn {
   background-color: #525252;
   width: 100px;
   height: 40px;
   border : none;
   border-radius: 5px;
   box-shadow: 1px 1px 1px 1px lightgray;  
   color:white;
}
.stBtn {
   background-color: #525252;
   width: 120px;
   height: 70px;
   border : none;
   border-radius: 5px;
   box-shadow: 1px 1px 1px 1px lightgray;  
   color:white;
   font-size:20px;
   margin-right: 40px;
   
}

@media screen and (max-width: 480px) {
.stBtn {
width: 80px;
height: 50px;
font-size: 16px;
margin-right:10px;
}
.age {
	font-size: 15px;
}
}
div > label {
	font-size: 20px;
}
.mt {
	margin-top:40px;
}
</style>


</head>
<body>
   
         <div id="wrapper" class="container" style="margin-top:100px;margin-bottom:100px;">
    <form action="/users/join" method="post" role="form" name="join" id="join" style="margin:0 auto;">
    <!-- ======= Contact Section ======= -->
   	
            <div class="row justify-content-center">
            	<div class="col-xl-5">
            
              <div class=" form-group">
              <h3 class="join_title"><label for="id">* 아이디</label></h3>
              <div class="row" >
              		<div class="col-9 mail_check_wrap">
                    	<input type="text" name="id" class="form-control" id="id" placeholder="아이디입력하세요" data-rule="minlen:6" autofocus>
                    </div>
                    <div class="col-3">
                    	<button type="button" name="idChk" id="idChk" class="Btn" onclick="fn_idChk();" value="N" style="width:70px;" >중복확인</button>                       
                    </div>
               </div>
              </div>
              <div class=" form-group mt">
             		<h3 class="join_title"><label for="pwd">* 비밀번호</label></h3>
             		<input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요" pattern="^[A-Za-z0-9]{10,20}$" data-rule="minlen:20">
              </div>
              <div class=" form-group mt">
             		<h3 class="join_title"><label for="pwd">* 비밀번호 재확인</label></h3>
             		<input type="password" class="form-control" name="pwd2" id="pwd2" placeholder="비밀번호를 재입력해주세요" pattern="^[A-Za-z0-9]{10,20}$" data-rule="minlen:20" onkeyup="passConfirm()">
             		<span id="confirmMsg" style="font-size: 18px; display: block; margin-top: 13px;"></span>
              </div>
              
              <div class=" form-group mt">
             		<h3 class="join_title"><label for="name">* 이 름</label></h3>
             		<input type="text" class="form-control" id="name" name="name" maxlength="20" placeholder="이름을 입력하세요">
             		<span id="confirmMsg"></span>
              </div>
              <div class=" form-group mt">
                    <h3 class="join_title"><label for="age">* 나 이</label></h3>
                    <div>
                               <input type="radio" value="10-19" class="age" name="age" id="age" checked/>&ensp;<label for="age">10대</label> 
	                           <input type="radio" value="20-29" class="age" name="age" id="age1" />&ensp;<label for="age1">20대</label>
	                           <input type="radio" value="30-39" class="age" name="age" id="age2" />&ensp;<label for="age2">30대</label> 
	                           <input type="radio" value="40-49" class="age" name="age" id="age3" />&ensp;<label for="age3">40대</label> 
	                           <input type="radio" value="50대이상" class="age" name="age" id="age4" />&ensp;<label for="age4">50대 이상</label> 
                    </div>
                </div>
              <div class="form-group mt">
                    <h3 class="join_title"><label for="gender">* 성 별</label></h3>
                    <span class="form-control">
                        <select id="gender" name="gender" class="sel" aria-label="성별">
                            <option value="M">남 자</option>
                            <option value="F">여 자</option>
                        </select>                            
                    </span>
              </div>
              
              
              <div class=" form-group mt">
                    <h3 class="join_title"><label for="email">* 본인확인 이메일</label></h3>
                    	<div>x
                        <input type="text" id="email" name="email" class="form-control email box string_email" maxlength="100" onkeyup="emailCheck()" placeholder="이메일을 입력하세요">
                        <input type="hidden" class="myinfo_email" id="myinfo_email" name="myinfo_email" value="${login_info.email}">
                        </div>
                    <div style="margin-top:20px;">
                     <span class="final_mail_ck"> < 인증번호 > </span>
                     <span class="mail_input_box_warn"></span>
             			<div class="mail_check_wrap">
             				<div class="row" >
              				 <div class="col-8 mail_check_input_box" id="mail_check_input_box_false">
                  			<input class="mail_check_input form-control" id="email1" disabled="disabled" required>
               				</div>
               				<div  class="col-4">
               				<button class="mail_check_button Btn">인증번호 전송</button>
               				</div>
               				</div>
               				 <div class="clearfix"></div>
               				<span id="mail_check_input_box_warn" name="mail_check_input_box_warn"></span>
            			</div>   
            		</div>
             </div>
             
             <div class=" form-group mt">
                    <h3 class="join_title"><label for="phone">* 휴대전화</label></h3>
                    <input type="tel" id="phone" name="phone" class="form-control" pattern="[0-9]{2,3}[0-9]{3,4}[0-9]{3,4}" data-rule="minlen:13" placeholder="- 를 빼고 전화번호를 입력하세요" >
             </div>
             
             
             <div class=" form-group mt">
                   <h3 class="join_title"><label for="adr">* 우편번호</label></h3>

							<div class="row" >
                                 <div class="col-8 mail_check_wrap">
                                    <input type="text" class="form-control address_input_1" name=adr id="adr" placeholder="우편번호" required>
                                 </div>
                                 <div class="col-4">
                                     <input type="button" class="adrchk Btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">                          
                                 </div>
                            </div>
					<div style="margin-top:20px;">
                   <input type="text" class="form-control address_input_2" name="adr2" id="adr2" placeholder="주소" required>
                   </div>
                   <div style="margin-top:20px;">
                   <input type="text" class="form-control address_input_3" name="adr3" id="adr3" placeholder="상세주소" required>
                   </div>
             </div>
             
             
             
             
              <div class=" form-group mt" style="margin-top:40px;margin-left:20px;">
                    <input type="submit" value="가입하기" class="join_now bt_submit stBtn" onclick="return JoinCheck()" >
                    <input type="reset" value="취소" class="join_now bt_submit stBtn" >
                    <input type="button" value="뒤로가기" class="join_now bt_submit stBtn" onclick="location.href='/'">
             </div>
             
             
             
             
             
             
             </div>
            
            </div>
            	</form>
            
             </div>
            
            
            
            
            
            
            
            
            
            



                

             
                

                
              
                
        
      <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
      
      
      <script type="text/javascript">
      /* 인증번호 이메일 전송 */
    $(".mail_check_button").click(function(){
   
   var email = $(".email").val();         // 입력한 이메일
   var cehckBox = $(".mail_check_input");      // 인증번호 입력란
   var boxWrap = $(".mail_check_input_box");   // 인증번호 입력란 박스
   var warnMsg = $(".mail_input_box_warn");   // 이메일 입력 경고글
   
   /* 이메일 형식 유효성 검사 */
   if(mailFormCheck(email)){
      warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
      warnMsg.css("display", "inline-block");
   } else {
      warnMsg.html("올바르지 못한 이메일 형식입니다.");
      warnMsg.css("display", "inline-block");
      join.email1.focus();
      return false;
   }   
   
   $.ajax({
      
      type:"GET",
      url:"mailCheck?email=" + email,
      success:function(data){
         
         //console.log("data : " + data);
         cehckBox.attr("disabled",false);
         boxWrap.attr("id", "mail_check_input_box_true");
         code = data;
         
      }
            
   });
   
});
    function mailFormCheck(email){
       var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
       return form.test(email);
    }
    
    $(".mail_check_input").blur(function(){
       
       var inputCode = $(".mail_check_input").val();      // 입력코드   
       var checkResult = $("#mail_check_input_box_warn");   // 비교 결과   
       
       if(inputCode == code){                     // 일치할 경우
          checkResult.html("인증번호가 일치합니다.");
          checkResult.attr("class", "correct");      
          mailnumCheck = true;
       } else {                                 // 일치하지 않을 경우
          checkResult.html("인증번호를 다시 확인해주세요.");
          checkResult.attr("class", "incorrect");
          mailnumCheck = false;
       }   

    });
    
    
   
 
    
      </script>
</body>
<jsp:include page="/WEB-INF/common/footer.jsp" />
</html>