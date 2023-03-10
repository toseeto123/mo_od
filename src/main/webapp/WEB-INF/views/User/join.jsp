<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="/resources/user/js/main.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/resources/user/css/join.css">

<style>
.logo{ font-family:"궁서" }
.logo2{font-family:"굴림"}
</style>


</head>
<body>
        
        <div id="header">
        <h1 class="logo"><a href="index.jsp">묻 : <span class="logo2">mo_od</span></a></h1>
        </div>
   
        <div id="wrapper">
    <form action="join.do" method="post" name="join" id="join">
            <!-- content-->
            <div id="content">

              
                <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>

                    <div class="box string_id">
                        <input type="text" id="id" name="id" class="string" maxlength="20" placeholder="아이디" autofocus>
                    </div>
                    <button class="idChk" type="button" name="idChk" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
                </div>

                
                <div>
                    <h3 class="join_title"><label for="pwd">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" id="pwd" name="pwd" class="string" maxlength="20" placeholder="비밀번호">
                    </span>
                </div>

                
                <div>
                    <h3 class="join_title"><label for="pwd2">비밀번호 재확인</label></h3>
                    <span class="box int_string_check" >
                        <input type="password" id="pwd2" name="pwd2" class="string" maxlength="20" placeholder="비밀번호 확인" onkeyup="passConfirm()">
                        <span id="confirmMsg"></span>
                    </span>
                    
                </div>

                
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box string_name">
                        <input type="text" id="name" name="name" class="string" maxlength="20">
                    </span>
                    
                </div>

               
                <div>
                    <h3 class="join_title"><label for="age">나이</label></h3>

                    <div id="bir_wrap">
                        <div id="age">
                            <span class="box">
                                <input type="text" id="age" class="string" name="age" maxlength="4">
                            </span>
                        </div>
                    </div>
                        
                </div>

             
                <div>
                    <h3 class="join_title"><label for="gender">성별</label></h3>
                    <span class="box gender_code">
                        <select id="gender" name="gender" class="sel" aria-label="성별">
                            <option>성별</option>
                            <option value="1">남자</option>
                            <option value="2">여자</option>
                        </select>                            
                    </span>
                    
                </div>

                
                <div>
                    <h3 class="join_title"><label for="email">본인확인 이메일</label></h3>
                    <span class="box string_email">
                        <input type="text" id="email" name="email" class="string" maxlength="100" placeholder="필수입력">
                    </span>
                      
                </div>

               
                <div>
                    <h3 class="join_title"><label for="phone">휴대전화</label></h3>
                    <span class="box string_mobile">
                        <input type="tel" id="phone" name="phone" class="string" maxlength="16" placeholder="전화번호 입력">
                    </span>
                        
                </div>
                
                <div>
                   <h3 class="join_title"><label for="adr">우편번호</label></h3>
                   <input type="text" class="address_input_1" name=adr id="adr" placeholder="우편번호">
                    <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                    <input type="text" class="address_input_2" name="adr2" id="adr2" placeholder="주소"><br>
                    <input type="text" class="address_input_3" name="adr3" id="adr3" placeholder="상세주소">
                </div>


                
                <div class="btn_area">
                    <input type="submit" value="가입하기" id="btnJoin" class="join_now bt_submit mainBgColor" onclick="return JoinCheck()">
                    <input type="reset" value="취소" id="btnReset" class="join_now bt_submit mainBgColor" >
                    <input type="button" value="뒤로가기" id="btnBack" class="join_now bt_submit mainBgColor" onclick="location.href='index.jsp'">
                </div>

            </div> 
            
      </form>
        </div> 
      
        
      <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
       
  
    </body>
</html>