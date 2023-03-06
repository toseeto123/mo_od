<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/resources/css/style.css"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.map {
    margin: 0;
    padding: 0;
    font-family: sans-serif;
}
.title{
 width : 800px;
}

.join1{
  height: 40px;
}

.table1{
   width: 700px;
   height: 600px;
   font-size: 9pt;
}

.register{
   height: 30px;
}

.pwd1,.pwd2, .name, .phoneNo, .email, .adr{
   width: 5%;
}

.ID{
 width:177px;
 height:22px;
}

.gender , .birth{
   width: 175px;
   height: 20px;
}

.lable_name{
 width: 15%;
}

.title2{
 height: 7px;
}

</style>

</head>
<body>

   <div class="map">
    <form action="join.do" method="post" name="join">
        <table class="title">
            <tr class="join1">
                <td align="center"><b>[회원가입]</b></td>
            </tr>
        </table>    
        <table class="table1" cellpadding="0" style="border-collapse:collapse; ">
            <tr class="register">
                <td class="ID" align="center">*</td>
                <label><td class="lable_name" alt="회원아이디">회원 ID</td></label>
                <td><input type="text" name="id" value="${id}" class="ID" maxlength="20" placeholder="아이디">/>&nbsp;<a href="javascript:id_check()">[ID 중복 검사]</a></td>
            </tr>
            <tr class="title2">
                <td colspan="3"><hr/></td>
            </tr>
            <tr class="register" height="30">
                <td class="pwd1" align="center">*</td>
                <label><td class="lable_name">비밀번호</td></label>
                <td><input type="password" name="pwd" value="${pwd}" id="pwd1" onchange="" maxlength="20"/></td>
            </tr>
            <tr class="title2">
                <td colspan="3"><hr /></td>
            </tr>
            <tr class="register" >
                <td class="pwd2" align="center">*</td>
                <label><td class="lable_name">비밀번호 확인</td></label>
                <td><input type="password" name="pwd2" id="pwd2" onchange="" />&nbsp;&nbsp;<span id="same"></span></td>
            </tr>
            <tr class="title2">
                <td colspan="3"><hr /></td>
            </tr>
            <tr class="register" height="30">
                <td class="name" align="center">*</td>
                <label><td class="lable_name">이 름</td></label>
                <td><input type="text" id="name" name="name" /></td>
            </tr>
            <tr class="title2">
                <td colspan="3"><hr /></td>
            </tr>
            <tr class="register" height="30">
                <td class="gender" align="center">*</td>
                <label><td class="lable_name">성 별</td></label>
                <td>
                    <select id="gender" name="gender" class="gender" aria-label="성별">
                           <option selected>성별</option>
                           <option value="1">남자</option>
                           <option value="2">여자</option>
                           <option value="3">선택 안함</option>
                        </select>
                </td>
            </tr>
            <tr class="title2">
                <td colspan="3"><hr /></td>
            </tr>
            <tr class="register" height="30">
                <td class="phoneNo" align="center">*</td>
                <td class="lable_name">휴대전화</td>
                <td><input type="tel" name="phone" /></td>
            </tr>
            <tr class="title2">
                <td colspan="3"><hr /></td>
            </tr>
            <tr class="register" height="30">
                <td class="age" align="center">*</td>
                <label><td class="lable_name">나이</td></label>
                <td><input type="text" id="birth" class="age" name="age" maxlength="4"></td>
            </tr>
            <tr class="title2">
                <td colspan="3"><hr /></td>
            </tr>
            <tr class="register" height="30">
                <td class="email" align="center">*</td>
                <label><td class="lable_name">이메일</td></label>
                <td><input type="email" name="email" /></td>
            </tr>
            <tr class="title2">
                <td colspan="3"><hr/></td>
            </tr>
            <tr>
                <td class="adr" align="center">*</td>
                <label><td class="lable_name">주 소</td></label>
                <td>
                    <input type="text" size="10" name="adr" id="postcode" placeholder="우편번호" value="12345" readonly="readonly" onclick="">
                    <input type="button" onclick="" value="우편번호 찾기"><br><br />
                    <input type="text" size="30" name="wRoadAddress" id="roadAddress" placeholder="도로명주소" value="경기도" readonly="readonly" onclick="">
                    <input type="text" size="30" name="wJibunAddress" id="jibunAddress" placeholder="지번주소" value="구리시"readonly="readonly" onclick="">
                    <br/><span id="guide" style="color:#999;font-size:10px;"></span>   
                    <br/><br/><input type="text" name="wRestAddress" placeholder="나머지 주소" value="인창동" size="70" />
                </td>
            </tr>
 
        </table>
        <br/>
        <table>
            <tr height="40">
                <td><input type="submit" value="가입하기" class="join_now bt_submit mainBgColor" onclick="return join()"></td>
                <td><input type="submit" value="취소" class="join_now bt_submit mainBgColor" onclick="return JoinCheck()"></td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>