<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@charset "UTF-8";


.ps_box{
   margin-bottom: 10px; 
}
.join_row label, .ps_box{
   display: block;
}

.container , .content{
   width: 800px;
}


.join_member{
   margin: 0 auto;
   width: 700px;
}

.bir_wrap{
   display: table;
   width: 100%;
   margin-top: 10px;
}

.bir_yy , .bir_mm , .bir_dd{
   display: table-cell;
   table-layout: fixed;
}
.bir_yy input, .bir_mm select, .bir_dd input{
   border:1px solid #d5d4cd; height:30px; 
}
.bir_mm select{ height:34px; }

.join_memeber{
   margin-top:20px;
   width: 400px;
   height: 30px;
}
.join_now{ width:100%; }

.int{
   border:1px solid #d5d4cd;
   width:100%;
   height: 35px;
   margin-top:10px;
   display:block;
   box-sizing: border-box;
}
.sel{
   width: 120px;
   height: 35px;
   margin: 0 10px 0 10px;
}
.birth {
   width: 400px;
   height: 30px;
}

.pwed1 , .pwed2 , .pwed3{
	width: 400px; 
	height: 30px;
	margin-bottom: 10px;
	margin-top: 5px; 
}
.phoneNO{
	width: 400px; 
	height: 30px;
}
.id_input{width: 299px;float: left;}
.id_bt{width: 90px;border: none;height: 35px;color: #ffffff;cursor: pointer;float: left;margin-left: 5px;margin-top: 10px;}

.gen{
   border:1px solid #d5d4cd; width:100%; height:34px; margin-top:10px;
}
.int_email{margin-top:10px;}
.email{ border:1px solid #d5d4cd; width: 400px; height: 30px; }
.email_line{ border:1px solid #d5d4cd; height: 34px; }

</style>
</head>
<section class="subcon wid loginPage">
   <h2>회원가입</h2>
   <form action="CinemaServlet" method="post" id="Join" class="member" name="Join">
    <input type="hidden" name="command" value="join_now">
      <div class="login_con01">
         <div class="login_box mBorderColor">
            <h4>개인정보 입력</h4>
            <div class="input_ul join_member">
               <div class="row_group">
                  <div class="join_row">
                     <h5 class="join_title">
                        <label for="id">아이디</label>
                     </h5>
                     <div class="ps_box int_id clear"> 
                     	<input type="text" id="id" name="id" class="int id_input" title="ID" maxlength="20">
                        <input type="button" value="중복체크" onclick="idCheck()" class="mainBgColor id_bt">
                     </div>
                  </div>
                  <div class="join_row">
                     <h5 class="join_title">
                        <label for="pswd1">비밀번호</label>
                     </h5>
                     <span class="ps_box int_pass" id="pswdImg"><input type="password" id="pwed1" name="pwed1" class="int" title="비밀번호 입력" maxlength="20"></span>
                     <h5 class="join_title">
                        <label for="pswd2">비밀번호 재확인</label>
                     </h5>
                     <span class="ps_box int_pass_check" id="pswd2Img"><input type="password" id="pswd2" name="pswd2" class="int" title="비밀번호 재확인 입력" maxlength="20"> 
                     </span>
                  </div>
               </div>
               <div class="row_group">
                  <div class="join_row">
                     <h5 class="join_title">
                        <label for="name">이름</label>
                     </h5>
                     <span class="ps_box box_right_space"><input type="text" id="name" name="name" title="이름" class="int" maxlength="40"></span>
                  </div>
                  <div class="join_row join_birthday">
                     <h5 class="join_title">
                        <label for="yy">생년월일</label>
                     </h5>
                     <div class="bir_wrap">
                        <div class="bir_yy">
                           <span class="ps_box"> <input type="date" id="birth"
                              placeholder="년/일/월" aria-label="년/일/월" class="birth" name="birth"
                              maxlength="4">
                           </span>
                        </div>
                     </div>
                     <span class="error_next_box" id="birthMsg" style="display: none" aria-live="assertive"></span>
                  </div>
                  <div class="join_row join_sex">
                     <h5 class=join_title>
                        <label for="gender">성별</label>
                     </h5>
                     <div class="ps_box gender_code">
                        <select id="gender" name="gender" class="gen" aria-label="성별">
                           <option selected>성별</option>
                           <option value="M">남자</option>
                           <option value="F">여자</option>
                           <option value="U">선택 안함</option>
                        </select>
                     </div>
                  </div>
                  <div class="join_row join_email">
                     <h5 class="join_title">
                        <label for="email">이메일</label>
                     </h5>
                     <span class="ps_box int_email box_right_space"> 
                     <input type="text" id="email" name="email" placeholder="선택입력" aria-label="선택입력" class="email" maxlength="100">
                     </span>
                  </div>
               </div>
               <div class="join_row join_mobile" id="moDiv">
                  <h5 class="join_title">
                     <label for="phoneNo">휴대전화</label>
                  </h5>
                  <span class="ps_box mobile"> 
                  	<input type="tel" id="phoneNo" name="phoneNo" placeholder="전회번호 입력" aria-label="전화번호입력" class="int" maxlength="16"> 
                  </span>
               </div>
               <input type="submit" value="가입하기" class="join_now bt_submit mainBgColor" onclick="return JoinCheck()">
            </div>
         </div>
      </div>
   </form>
</section>
</html>