<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html style="background-color:#f5f6f7;">
<head>
<meta charset="UTF-8">
<title>MemberDetail</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/user/js/main.js"></script>
<style>
input[type=button], input[type=submit] {
	line-height: 24px;
	color: white;
	background: #323232;
	border: none;
	width: 100px;
	height: 30px;
}
</style>
</head>

<body style="background-color:#f5f6f7;">
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/common/adminHeader.jsp" />

	<!-- ======= Hero Section ======= -->

	<div>
	<form action="/admin/memberUpdate" method="post">
	<input type="hidden" id="idCheck" value="${userInfo.id}"> 
			<table class="table"
				style="margin-top: 5%; margin-left: 15%; width: 70%;">
				<thead>

					<tr>
						<th scope="col">회원번호</th>
						<td>${userInfo.no}</td>
					</tr>

				</thead>

				<tbody>
					<tr>
						<th scope="col">아이디</th>
						<td><input type="text" name="id" id="id" value="${userInfo.id}" required>&nbsp;<input type="button" value="중복체크" onClick="checkingId()"></td>
						
					</tr>
					<tr>
						<td scope="col">비밀번호</td>
						<td><input name="pwd" type="text" value="${userInfo.pwd}">
					</tr>
					<tr>
						<th scope="col">이름</th>
						<td><input name="name" type="text" value="${userInfo.name}" required></td>
					</tr>
					<tr>
						<th scope="col">성별</th>
						<c:choose>
						<c:when test="${userInfo.gender == 'F'}">
							<td>여자</td>	
						</c:when>
						<c:when test="${userInfo.gender == 'M'}">
							<td>남자</td>
						</c:when>
						<c:otherwise>
							<td></td>
						</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<th scope="col">나이</th>
						<td>
												
						<input type="radio" value="10-19" class="age" name="age" id="age"/>&ensp;<label for="age">10대</label> &emsp;&emsp;&emsp;
	                           <input type="radio" value="20-29" class="age" name="age" id="age1" />&ensp;<label for="age1">20대</label> &emsp;&emsp;&emsp;
	                           <input type="radio" value="30-39" class="age" name="age" id="age2" />&ensp;<label for="age2">30대</label> &emsp;&emsp;&emsp;
	                           <input type="radio" value="40-49" class="age" name="age" id="age3" />&ensp;<label for="age3">40대</label> &emsp;&emsp;&emsp;
	                           <input type="radio" value="50대이상" class="age" name="age" id="age4" />&ensp;<label for="age4">50대 이상</label> 
											
						
						
						
						</td>
					</tr>
					<tr>
						<th scope="col">연락처</th>
						<td><input type="text" name="phone" value="${userInfo.phone}" required></td>
					</tr>
					<tr>
						<th scope="col">이메일</th>
						<td><input type="email" name="email" value="${userInfo.email}" required></td>
					</tr>
					<tr>
						<th scope="col">주소</th>
						<td>
						<input type="text" class="address_input_1" name="adr" id="adr" placeholder="우편번호" style="width: 80px;" value="${userInfo.adr.split('   ')[0]}" required>
						<input type="text" style="width: 340px;" class="address_input_2" name="adr2" id="adr2" placeholder="주소" value="${userInfo.adr.split('   ')[1]}" required>
						<input type="text" style="width: 200px;" class="address_input_3" name="adr3" id="adr3" placeholder="상세주소" value="${userInfo.adr.split('   ')[2]}" required>
						<input type="button" class="adrchk" onclick="sample6_execDaumPostcode()" style="background-color:#323232; color: white; border:#323232; wid" value="우편번호 찾기"><br>
						</td>
						
					</tr>
					<tr>
					<td></td>
					<td>
						<input type="submit" value="수정" onclick="return updateMember()">
						<input type="button" value="회원탈퇴" onclick="$('#exampleModal').modal('show');">
						<input type="button" onclick="goBack()" value="돌아가기">
						</td>
					</tr>
				</tbody>
			</table>
			</form>
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-dialog-centered" role="document">
    		<div class="modal-content">
      		<div class="modal-header">
        	<h5 class="modal-title" id="exampleModalLabel">회원탈퇴</h5>
        	<button type="button" class="close" data-dismiss="modal" style="border: none; background: transparent;" aria-label="Close">
          	<span aria-hidden="true">&times;</span>
        	</button>
      	</div>
      	<div class="modal-body">
	      	탈퇴시 모든 버킷내역 및 주문내역이 삭제됩니다.<br> 
      		또한, 삭제된 정보는 다시 되돌릴 수 없습니다.<br>
      		탈퇴하시겠습니까?<br>
      	</div>
      	<div class="modal-footer">
	        <input type="button" id="modal_delbtn" value="탈퇴하기" onclick="location.href = '/admin/deleteMember?id=${userInfo.id}'">
    	    <input type="button" value="닫기"  onclick="$('#exampleModal').modal('hide')">
      			</div>
    		</div>
  		</div>
	</div>

			<!-- End Default Table Example -->


			<div style="position: absolute; bottom:0; width:100%;"><jsp:include
					page="${pageContext.request.contextPath}/WEB-INF/common/footer.jsp" /></div>
		</div>
	
	<!-- End Hero -->
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>
	function goBack(){
		const referrer = document.referrer;
		const ref = referrer.split('/')
		let indexNo;
		var uri = '';
		for(var count=0; count<ref.length; count++){
			if(ref[count] == "admin"){
				indexNo = count;
			}
		}
		for(var index=indexNo; index<ref.length; index++){
			uri = uri+'/'+ref[index];
		}
		location.href=uri;
	}
</script>
<script>
window.onload = function(){
						if(${age} != '' && ${age} != null){
								var age = ${age}.split('-')[0]
								if(age == 10){
									document.getElementById('age').checked = true;
								}else if(age == 20){
									document.getElementById('age1').checked = true;									
								}else if(age == 30){
									document.getElementById('age2').checked = true;
								}else if(age == 40){
									document.getElementById('age3').checked = true;
								}else{
									document.getElementById('age4').checked = true;
								}
								
}
}
							</script>		
							
							<script>
							let flag = false;
								function updateMember(){
									if(document.getElementById('id').value != document.getElementById('idCheck').value){
										if(!flag){
											alert('아이디 중복확인이 필요합니다');
											return false;
										}
									}
									
								}
								function checkingId(){
									if($("#id").val().length < 6) {
								        alert("아이디는 최소 6글자 이상이어야 합니다.");
								        flag = true;
								        return false;
								    }
								    $.ajax({
								        url : "/admin/memberCheck",
								        type : "get",
								        data : {"id" : $("#id").val()},
								        success : function(data){
								            if(data == 1){
								            	if(document.getElementById('id').value != document.getElementById('idCheck').value){
								                	alert("중복된 아이디입니다.");
								                	flag = true;
								            	}else{
								            		alert('사용가능한 아이디입니다.');
								            	}
								            } else if(data == 0){
								                alert("사용가능한 아이디입니다.");
								                flag = false;
								            }
								        }
								    });
								}
							</script>
</body>
</html>