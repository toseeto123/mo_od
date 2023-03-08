<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.box {
    display: block;
    width: 100%;
    height: 51px;
    border: solid 1px #dadada;
    padding: 10px 14px 10px 14px;
    box-sizing: border-box;
    background: #fff;
    position: relative;
}

.int {
    display: block;
    position: relative;
    width: 100%;
    height: 29px;
    border: none;
    background: #fff;
    font-size: 15px;
}

input {
    font-family: Dotum,'돋움',Helvetica,sans-serif;    
}

.box.int_id {
    padding-right: 110px;
}

.box.int_pass {
    padding-right: 40px;
}

.box.int_pass_check {
    padding-right: 40px;
}

.step_url {
    /*@naver.com*/
    position: absolute;
    top: 16px;
    right: 13px;
    font-size: 15px;
    color: #8e8e8e;
}

.pswdImg {
    width: 18px;
    height: 20px;
    display: inline-block;
    position: absolute;
    top: 50%;
    right: 16px;
    margin-top: -10px;
    cursor: pointer;
}

#bir_wrap {
    display: table;
    width: 100%;
}

#bir_yy {
    display: table-cell;
    width: 147px;
    
}

#bir_mm {
    display: table-cell;
    width: 147px;
    vertical-align: middle;
}

#bir_dd {
    display: table-cell;
    width: 147px;
}

#bir_mm, #bir_dd {
    padding-left: 10px;
}

</style>

</head>
<body>
<div id="wrapper">
         <form>
            <!-- content-->
            <div id="content">
                <!-- ID -->
                <div>
                    <h3 class="lable_name">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" name="id" value="${id}" maxlength="20">
                        
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" id="pswd1" class="int" maxlength="20">
                        <span id="alertTxt">사용불가</span>
                        
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW2 -->
                <div>
                    <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="password" id="pswd2" class="int" maxlength="20">
                        
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="name" class="int" maxlength="20">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- BIRTH -->
                <div>
                    <h3 class="lable_name"><label for="age">연령</label></h3>

                    <div id="bir_wrap">
                        <!-- BIRTH_YY -->
                        <div id="age">
                            <span class="box">
                                <input type="text" id="age" class="age" name="age" maxlength="4">
                            </span>
                        </div>
                    </div>
                    <span class="error_next_box"></span>    
                </div>

                <!-- GENDER -->
                <div>
                    <h3 class="lable_name"><label for="gender">성별</label></h3>
                    <span class="box gender_code">
                        <select id="gender" class="sel">
                            <option>성별</option>
                            <option value="1">남자</option>
                            <option value="2">여자</option>
                        </select>                            
                    </span>
                    <span class="error_next_box">필수 정보입니다.</span>
                </div>

                <!-- EMAIL -->
                <div>
                    <h3 class="lable_name"><label for="email">본인확인 이메일</label></h3>
                    <span class="box int_email">
                        <input type="text" id="email" class="int" maxlength="100" placeholder="선택입력">
                    </span>
                    <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>    
                </div>

                <!-- MOBILE -->
                <div>
                    <h3 class="lable_name"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" id="mobile" class="int" maxlength="16" placeholder="전화번호 입력">
                    </span>
                    <span class="error_next_box"></span>    
                </div>


                <!-- JOIN BTN-->
                <div class="btn_area">
                    <button type="button" id="btnJoin">
                        <span>가입하기</span>
                    </button>
                </div>
                </div>
                </form>
                </div>
</body>
</html>