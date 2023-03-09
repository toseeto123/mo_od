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
        <!-- header -->
        <div id="header">
        <h1 class="logo"><a href="index.jsp">묻 : <span class="logo2">mo_od</span></a></h1>
        </div>
	 <!-- wrapper -->
        <div id="wrapper">
	 <form action="join.do" method="post" name="join">
            <!-- content-->
            <div id="content">

                <!-- ID -->
                <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>

                    <div class="box string_id">
                        <input type="text" id="id" name="id" class="string" maxlength="20" autofocus>
                    </div>
                    <button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>

                </div>

                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pwd1">비밀번호</label></h3>
                    <span class="box int_pass">

                        <input type="password" id="pwd1" name="pwd1" class="string" maxlength="20">

                        <span id="alertTxt">사용불가</span>
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW2 -->
                <div>
                    <h3 class="join_title"><label for="pwd2">비밀번호 재확인</label></h3>
                    <span class="box int_string_check">
                        <input type="text" id="pwd2" name="pwd2" class="string" maxlength="20">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box string_name">
                        <input type="text" id="name" name="name" class="string" maxlength="20">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- BIRTH -->
                <div>
                    <h3 class="join_title"><label for="age">나이</label></h3>

                    <div id="bir_wrap">
                        <div id="age">
                            <span class="box">
                                <input type="text" id="age" class="string" name="age" maxlength="4">
                            </span>
                        </div>
                    </div>
                    <span class="error_next_box"></span>    
                </div>

                <!-- GENDER -->
                <div>
                    <h3 class="join_title"><label for="gender">성별</label></h3>
                    <span class="box gender_code">
                        <select id="gender" name="gender" class="sel" aria-label="성별">
                            <option>성별</option>
                            <option value="1">남자</option>
                            <option value="2">여자</option>
                        </select>                            
                    </span>
                    <span class="error_next_box">필수 정보입니다.</span>
                </div>

                <!-- EMAIL -->
                <div>
                    <h3 class="join_title"><label for="email">본인확인 이메일<span class="optional">(선택)</span></label></h3>
                    <span class="box string_email">
                        <input type="text" id="email" name="email" class="string" maxlength="100" placeholder="선택입력">
                    </span>
                    <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>    
                </div>

                <!-- MOBILE -->
                <div>
                    <h3 class="join_title"><label for="phone">휴대전화</label></h3>
                    <span class="box string_mobile">
                        <input type="tel" id="phone" name="phone" class="string" maxlength="16" placeholder="전화번호 입력">
                    </span>
                    <span class="error_next_box"></span>    
                </div>
                
                <div>
                	<h3 class="join_title"><label for="adr">우편번호</label></h3>
                	<input type="text" size="10" name="adr" id="postcode" placeholder="우편번호" value="12345" readonly="readonly" onclick="">
                    <input type="button" onclick="" value="우편번호 찾기"><br><br />
                    <input type="text" size="30" name="wRoadAddress" id="roadAddress" placeholder="도로명주소" value="경기도" readonly="readonly" onclick="">
                    <input type="text" size="30" name="wJibunAddress" id="jibunAddress" placeholder="지번주소" value="구리시"readonly="readonly" onclick="">
                    <br/><span id="guide" style="color:#999;font-size:10px;"></span>   
                    <br/><br/><input type="text" name="wRestAddress" placeholder="나머지 주소" value="인창동" size="70" />
                </div>


                <!-- JOIN BTN-->
                <div class="btn_area">
                    <input type="submit" value="가입하기" id="btnJoin" class="join_now bt_submit mainBgColor" onclick="return JoinCheck()">
                    <input type="button" value="취소" class="join_now bt_submit mainBgColor" onclick="return index">
                </div>

                

            </div> 
            <!-- content-->
      </form>
        </div> 
        <!-- wrapper -->
    
        
  
    </body>
</html>