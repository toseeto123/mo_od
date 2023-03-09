<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fieldset>
<legend>회원정보수정</legend>
	<form action="/updatemyinfo.do" method="post" name="fr">
		<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" value="${login_info.id}" readonly><br></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pwd1" value="" required><br></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input type="password" name="pwd2" value="" required><br></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="${login_info.name}" readonly><br></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type="text" name="age" value="${login_info.age}" readonly><br></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><input type="text" name="gender" value="${login_info.gender}" readonly><br></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="email" value="${login_info.email}"><br></td>
		</tr>
		<tr>
			<td>휴대전화</td>
			<td><input type="tel" name="phone" value="${login_info.phone}"><br></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="adr" value="${login_info.adr}"><br></td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="submit">수정하기</button>
				<button type="submit" onclick="alert('delete')">탈퇴하기</button>
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  					탈퇴하기
				</button>
				<button type="button" onclick="location.href='/index.jsp'">메인으로</button>
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
      	탈퇴하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary" onclick="DeleteMember">탈퇴하기</button>
        <button type="reset" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
	</form>
</fieldset>
<script type="text/javascript">

</script>
</body>
</html>