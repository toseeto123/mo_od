function JoinCheck(){
	if (document.join.id.value == 0) {
		alert("아이디를 써주세요");
		join.id.focus();
		return false;
	}	
	if (document.join.pwd1.value == ""){
		alert("암호를 반드시 입력해주세여");
		join.pwd1.focus();
		return false;
	}	
	if(document.join.pwd1.value != document.join.pwd2.value){
		alert("암호가 일치하지 않습니다");
		join.pwd1.focus();
		return false;
	}	
	if (document.join.name.value == "") {
		alert("이름을 써주세요");
		join.name.focus();
		return false;
	}
	if (document.join.age.value == "") {
		alert("연령을 입력해주세요");
		join.age.focus();
		return false;
	}
	if (document.join.gender.value == "") {
		alert("성별을 입력해주세요");
		join.gender.focus();
		return false;
	}
	if (document.join.email.value == "") {
		alert("이메일을 입력해주세요");
		join.email.focus();
		return false;
	}
	if (document.join.phone.value == "") {
		alert("전화번호를 입력해주세요");
		Join.phone.focus();
		return false;
	}	
	return true;	
}


function fn_idChk(){
			$.ajax({
				url : "/idChk",
				type : "post",
				dataType : "json",
				data : {"id" : $("#id").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}