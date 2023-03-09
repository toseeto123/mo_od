function JoinCheck(){
	if (document.join.id.value == 0) {
		alert("아이디를 써주세요");
		join.id.focus();
		return false;
	}	
	if (document.join.pwd.value == ""){
		alert("암호를 반드시 입력해주세여");
		join.pwd.focus();
		return false;
	}
		
	if(document.join$("#idChk").val() == "N"){
	    alert("아이디 중복 확인이 필요합니다");
        join.id.focus();
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
		
	function passConfirm() {
	/* 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같다면 비밀번호 일치, 그렇지 않으면 불일치 라는 텍스트 출력.*/
	/* document : 현재 문서를 의미함. 작성되고 있는 문서를 뜻함. */
	/* getElementByID('아이디') : 아이디에 적힌 값을 가진 id의 value를 get을 해서 password 변수 넣기 */
		var pwd = document.getElementById('pwd');					//비밀번호 
		var pwd2 = document.getElementById('pwd2');	//비밀번호 확인 값
		var confrimMsg = document.getElementById('confirmMsg');				//확인 메세지
		var correctColor = "#00ff00";	//맞았을 때 출력되는 색깔.
		var wrongColor ="#ff0000";	//틀렸을 때 출력되는 색깔
		
		if(pwd.value == pwd2.value){       //password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
			confirmMsg.style.color = correctColor;    /* span 태그의 ID(confirmMsg) 사용  */
			confirmMsg.innerHTML ="비밀번호 일치";    /* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
		}else{
			confirmMsg.style.color = wrongColor;
			confirmMsg.innerHTML ="비밀번호 불일치";
		}
	}