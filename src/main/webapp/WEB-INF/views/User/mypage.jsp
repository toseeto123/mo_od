<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>회원 정보</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="/resources/user/js/main.js"></script>
   <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script>
$(document).ready(function(){
	 alert("${alertMessage}");
	});
</script>
<style>
/* 기본 스타일 */
.container {
  display: flex;
  justify-content: center;
  align-items: center;
}

.box {
  width: 100px;
  height: 100px;
  background-color: red;
}

/* 768px 이하인 경우 */
@media screen and (max-width: 768px) {
  .container {
    flex-direction: column;
  }
  
  .box {
    margin: 10px 0;
  }
}

/* 992px 이하인 경우 */
@media screen and (max-width: 992px) {
  .box {
    width: 75px;
    height: 75px;
  }
}

/* 1200px 이하인 경우 */
@media screen and (max-width: 1200px) {
  .box {
    width: 90px;
    height: 90px;
  }
}
section {
	width: 1000px;
	margin: 0 auto;
}
input {
	padding:10px;
	
}
 body tr td:first-child {
	font-weight:bold;
	font-size :20px;
}
 body table {
 	margin : 0 auto;
 }
 body {
 @font-face {
    font-family: 'GangwonEdu_OTFBoldA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
}

  i{
  color:#323232; 
  font-size: 25px; 
  vertical-align:bottom;
  }
  @media (max-width: 768px) {
  .nav-pills {
    flex-direction: column;
  }
  .nav-link {
    font-size: 14px;
    padding: 0.5rem 1rem;
  }
   section{ 
   	width: 350px; 
	margin: 0 auto; 
   } 
}
@media only screen and (max-width: 768px) {
	.container {
		max-width: 100%;
	}
}
/* #mypage { */
/*   width: 77%; */
/*   max-width: 900px; */
/*   border: 2px solid #323232; */
/*   padding-bottom: 10px; */
/*   box-sizing: border-box; /* 이 부분을 추가하여 border가 width를 넘치지 않도록 합니다 */ */
/*   margin: 0; */
/* } */
  @media screen and (max-width: 600px) {
    table {
      width: 100%;
    }
    td {
      display: block;
    }
    td:first-child {
      margin-top: 20px;
      margin-bottom: 5px;
    }
    input[type="password"],
    input[type="text"],
    input[type="tel"] {
      width: 90%;
      margin-bottom: 10px;
    }
    .adrchk {
      margin-top: 10px;
    }
    .address_input_1 {
      margin-bottom: 5px;
    }
  }
@media (max-width: 768px) {
  .btn {
    width: 100%;
    margin: 0 auto;
  }
}
@media (max-width: 768px) {
  .col-md-4 {
    width: 100%;
  }
}
@media (max-width: 1200px) {
  .container {
    width: 100%;
  }
}

</style>
<jsp:include page="/WEB-INF/common/header.jsp" />
<body>
	<section>
      <ul class="nav nav-pills nav-justified">
        <li class="nav-item" >
          <a class="nav-link active" href="/users/mypage" style="background: #323232; color:white; font-weight: 700;"><i class="xi-profile" style="color:white;"></i> 회원 정보</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/users/bucket" style="background: #525252; color:white; font-weight: 700;"><i class="xi-cart" style="color:white;"></i> 장바 구니</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/products/payMypage" style="background: #525252; color:white; font-weight: 700;"><i class="xi-list-dot" style="color:white;"></i> 결제 내역</a>
        </li>
      </ul>
   </section>


	<form action="/users/update?id=${login_info.id}" method="post" name="mypage" id="mypage">
	<div class="container" style="border-top:2px solid #323232; padding:60px 0; max-width: 1200px;">
		<table class="table">

		<tr>
			<td ><label for="id">아이디</label></td>
			<td id="login_id">${login_info.id}<br></td>
		</tr>
		<tr >
			<td><label for="pwd">비밀번호</label></td>
			<td><input type="password" class="pwd" id="pwd" name="pwd" style="width: 100%; max-width: 280px;" required><br>
			</td>
			
		</tr>
		
		<tr >
			<td><label for="pwd">비밀번호 확인</label></td>

			<td><input type="password" id="pwd2" name="pwd2" style="width: 100%; max-width: 280px;" required onkeyup="passConfirm()"><br><span id="confirmMsg"></span></td>
			
			
		</tr>
		<tr >
			<td style="min-width: 100px;"><label for="name">이름</label></td>
			<td>${login_info.name}<br></td>
		</tr>
		<tr >
			<td><label for="age">나이</label></td>
			<td>${login_info.age}<br></td>
		</tr>
		<tr >
			<td><label for="gender">성별</label></td>
			<td>${login_info.gender}<br></td>
		</tr>
		<tr >
			<td><label for="email">이메일</label></td>
			<td><input type="text" class="myinfo_email" id="myinfo_email" style="width: 100%; max-width: 280px;" name="email" value="${login_info.email}"><br></td>
		</tr>
		<tr >
			<td ><label for="phone">휴대전화</label></td>
			<td><input type="tel" name="phone" style="width: 100%; max-width: 280px;" value="${login_info.phone}"><br></td>
		</tr>
		<tr >
		
			<td><label for="adr"></label></td>
			<td><input type="text" class="address_input_1" name=adr id="adr" placeholder="우편번호" value="${myinfo_adr1}" size="5" >
			<input type="button" class="adrchk" onclick="sample6_execDaumPostcode()" style="background-color:#323232; color: white; border:#323232;" value="우편번호 찾기"><br></td>
		</tr>
		<tr >
			<td>주소</td>
			<td colspan="2"><input type="text" style="width: 100%; max-width: 350px;" class="address_input_2" name="adr2" id="adr2" placeholder="주소" value="${myinfo_adr2}" required></td><br>
			
		</tr>
		<tr >
			<td><input type="hidden"id="sspwd" size="50" name="sspwd" value="${login_info.pwd}"/> </td>
			<td colspan="2"><input type="text" style="width: 100%; max-width: 350px;" class="address_input_3" name="adr3" id="adr3" placeholder="상세주소" value="${myinfo_adr3}" required></td>
		</tr>
			<tr>
				<td colspan="3"><input type="submit" id="updateBtn" class="btn btn-primary" value="수정하기" style="background:#323232;border:#323232;color:white; width: 35%; height: 50px; font-size: 20px; border-radius: 30px;" onclick="return UpdateCheck()">
					<button type="button" id="deleteBtn" class="btn btn-primary" style="background:#323232;border:#323232;color:white; width: 35%; height: 50px; margin: 10px 0; font-size: 20px; border-radius: 30px;" onclick="if (DeleteCheck()) $('#exampleModal').modal('show')">탈퇴하기</button>
					<button type="button" class="btn btn-primary" style="background:#323232;border:#323232;color:white; width: 35%; height: 50px; font-size: 20px; border-radius: 30px;" onclick="location.href='/index.jsp'">메인으로</button>
				</td>
			</tr>
		</table>
		
		
		
		
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">회원탈퇴</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	탈퇴시 모든 버킷내역 및 주문내역이 삭제됩니다.<br> 
      	또한, 삭제된 정보는 다시 되돌릴 수 없습니다.<br>
      	탈퇴하시겠습니까?<br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary"id="modal_delbtn"  style="background:#c8936ed4;border:#c8936ed4;color:white;" onclick="location.href = '/users/delete'">탈퇴하기</button>
        <button type="button" class="btn btn-secondary" style="background:#c8936ed4;border:#c8936ed4;color:white;" onclick="$('#exampleModal').modal('hide')">닫기</button>
      </div>
    </div>
  	</div>
	</div>
	<div>
				<c:choose>
				<c:when test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:when>
				</c:choose>
			</div>
	</div>
	</form>




	
	
</body>
	<jsp:include page="/WEB-INF/common/footer.jsp" />

</html>