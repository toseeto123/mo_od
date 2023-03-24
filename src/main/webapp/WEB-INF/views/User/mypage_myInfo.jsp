<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="/resources/user/js/main.js"></script>
<style>

table tr td:2nd-child {
	padding-left:150px;
}


</style>
</head>
<body>
<fieldset>
	<form action="/update.do?id=${login_info.id}" method="post" name="mypage" id="mypage" style="width:950px;">
		<table class="table">
		<tr>
			<td>아이디</td>
			<td>${login_info.id}<br></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" class="pwd" id="pwd" name="pwd" required><br>
<%-- 			<input type="hidden" id="pwd" name="pwd" value="${login_info.pwd}"> --%>
			</td>
			
		</tr>
		
		<tr>
			<td>비밀번호 확인</td>

			<td><input type="password" id="pwd2" name="pwd2" required onkeyup="passConfirm()"><br><span id="confirmMsg"></span></td>

			
		</tr>
		<tr>
			<td>이름</td>
			<td>${login_info.name}<br></td>
		</tr>
		<tr>
			<td>나이</td>
			<td>${login_info.age}<br></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>${login_info.gender}<br></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" class="myinfo_email" id="myinfo_email" name="email" value="${login_info.email}"><br></td>
		</tr>
		<tr>
			<td>휴대전화</td>
			<td><input type="tel" name="phone" value="${login_info.phone}"><br></td>
		</tr>
		<tr>
		
			<td></td>
			<td style="padding-left:150px;"><input type="text" class="address_input_1" name=adr id="adr" placeholder="우편번호" value="${myinfo_adr1}" ><br></td>	
			<td><input type="button" class="adrchk" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br></td>
		</tr>
		<tr>
			<td>주소</td>
			<td colspan="2"><input type="text" size="50" class="address_input_2" name="adr2" id="adr2" placeholder="주소" value="${myinfo_adr2}" required></td><br>
			
		</tr>
		<tr>
			<td></td>
			<td colspan="2"><input type="text" size="50" class="address_input_3" name="adr3" id="adr3" placeholder="상세주소" value="${myinfo_adr3}" required></td>
		</tr>
		<tr>
		<br>
			<td colspan="2">
			<br><br>
<!-- 			     <button type="submit" id="updateBtn" class="btn btn-primary" onclick="return UpdateCheck()"> -->
<!--   					수정하기 -->
<!-- 				</button> -->
				<input type="submit" id="updateBtn" class="btn btn-primary" value="수정하기" onclick="return UpdateCheck()">
  					
				
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" >
					탈퇴하기
				</button>
				<button type="button" class="btn btn-primary" onclick="location.href='/index.jsp'">
  					메인으로
				</button>
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
        <button type="submit" class="btn btn-primary" onclick="location.href = '/delete.do'">탈퇴하기</button>
        <button type="reset" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  	</div>
	</div>
	</form>
	<div>
				<c:choose>
				<c:when test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:when>
				</c:choose>
			</div>
</fieldset>


</body>

</html>