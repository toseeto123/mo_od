<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>

.bt_submit:hover{
background: #da8862;

}
</style>
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
                     <div class="carousel-content">
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
</style>


</head>
<body>
   
        <div id="wrapper">
    <form action="/users/join" method="post" name="join" id="join">
            <!-- content-->
            <div id="content">

              
                <div>
                    <h3 class="join_title">
                        <label for="id" style="font-size: 20px;">* 아이디</label>
                    </h3>

                    <div class="box string_id">
                        <input type="text" id="id" name="id" class="string" minlength="6"  autofocus placeholder="아이디입력하세요">
                    </div>
                    <button class="idChk btnhover" type="button" name="idChk" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
                </div>

                
                <div>
                    <h3 class="join_title"><label for="pwd" style="font-size: 20px;">* 비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" id="pwd" name="pwd" class="string" pattern="^[A-Za-z0-9]{10,20}$" maxlength="20"  placeholder="비밀번호를 입력하세요">
                    </span>
                </div>

                
                <div>
                    <h3 class="join_title"><label for="pwd2" style="font-size: 20px;">* 비밀번호 재확인</label></h3>
                    <span class="box int_string_check" >
                        <input type="password" id="pwd2" name="pwd2" class="string" maxlength="20" pattern="^[A-Za-z0-9]{10,20}$" placeholder="비밀번호를 재입력해주세요" onkeyup="passConfirm()">
                    </span> 
                    <span id="confirmMsg" style="font-size: 18px; display: block; margin-top: 13px;"></span>
                </div>

                
                <div>
                    <h3 class="join_title"><label for="name" style="font-size: 20px;">* 이 름</label></h3>
                    <span class="box string_name">
                        <input type="text" id="name" name="name" class="string" maxlength="20" placeholder="이름을 입력하세요">
                    </span>
                    
                </div>

               
                <div>
                    <h3 class="join_title" style="font-size: 20px;">* 나 이</h3>
                    <div id="bir_wrap">
                        <div>
                               <input type="radio" value="10-19" class="age" name="age" id="age" checked/>&ensp;<label for="age" style="font-size: 20px;">10대</label> &emsp;&emsp;&emsp;
	                           <input type="radio" value="20-29" class="age" name="age" id="age1" />&ensp;<label for="age1" style="font-size: 20px;">20대</label> &emsp;&emsp;&emsp;
	                           <input type="radio" value="30-39" class="age" name="age" id="age2" />&ensp;<label for="age2" style="font-size: 20px;">30대</label> &emsp;&emsp;&emsp;
	                           <input type="radio" value="40-49" class="age" name="age" id="age3" />&ensp;<label for="age3" style="font-size: 20px;">40대</label> &emsp;&emsp;&emsp;
	                           <input type="radio" value="50대이상" class="age" name="age" id="age4" />&ensp;<label for="age4" style="font-size: 20px;">50대 이상</label> 
                        </div>
                    </div>
                </div>

             
                <div>
                    <h3 class="join_title"><label for="gender" style="font-size: 20px;">* 성 별</label></h3>
                    <span class="box gender_code">
                        <select id="gender" name="gender" class="sel" aria-label="성별">
                            <option value="M">남 자</option>
                            <option value="F">여 자</option>
                        </select>                            
                    </span>
                    
                </div>

                
                <div>
                    <h3 class="join_title"><label for="email" style="font-size: 20px;">* 본인확인 이메일</label></h3>
                    <div>
                        <input type="text" id="email" name="email" class="email box string_email" maxlength="100" onkeyup="emailCheck()" placeholder="이메일을 입력하세요">
                        <input type="hidden" class="myinfo_email" id="myinfo_email" name="myinfo_email" value="${login_info.email}">
                    </div>
                    <span id="conemail"></span>
                     <span class="final_mail_ck" style="display: block; margin: 19px 0 8px; font-size: 20px;">* 이메일 인증</span>
                     <span class="mail_input_box_warn"></span>
             <div class="mail_check_wrap">
               <div class="mail_check_input_box" id="mail_check_input_box_false">
                  <input class="mail_check_input" id="email1" disabled="disabled" required>
               </div>
               <button class="mail_check_button btnhover">인증번호 전송</button>
               <div class="clearfix"></div>
               <span id="mail_check_input_box_warn" name="mail_check_input_box_warn"></span>
            </div>   
                </div>
                

               
                <div>
                    <h3 class="join_title"><label for="phone" style="font-size: 20px;">* 휴대전화</label></h3>
                    <div class="box string_mobile">
                        <input type="tel" id="phone" name="phone" class="string" pattern="[0-9]{2,3}[0-9]{3,4}[0-9]{3,4}" maxlength="13" placeholder="- 를 빼고 전화번호를 입력하세요" >
                    </div>
                   
                        
                </div>
                
                <div>
                   <h3 class="join_title"><label for="adr" style="font-size: 20px;">* 우편번호</label></h3>
                   <input type="text" class="address_input_1" name=adr id="adr" placeholder="우편번호" required>
                    <input type="button" class="adrchk btnhover" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                    <input type="text" class="address_input_2" name="adr2" id="adr2" placeholder="주소" required><br>
                    <input type="text" class="address_input_3" name="adr3" id="adr3" placeholder="상세주소" required>
                </div>


                
                <div class="btn_area">
                    <input type="submit" value="가입하기" id="btnJoin" class="join_now bt_submit mainBgColor" onclick="return JoinCheck()">
                    <input type="reset" value="취소" id="btnReset" class="join_now bt_submit mainBgColor">
                    <input type="button" value="뒤로가기" id="btnBack" class="join_now bt_submit mainBgColor" onclick="location.href='/'">
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