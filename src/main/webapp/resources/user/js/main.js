function JoinCheck(){
           if (document.join.id.value == "") {
              alert("아이디를 써주세요");
              join.id.focus();
              return false;
           }
           if (document.join.id.value.length < 6) {
            alert("아이디는 최소 6글자 이상이어야 합니다.");
             join.id.focus();
             return false;
            }   
           if($("#idChk").val() == "N"){
               join.id.focus();
               alert("아이디 중복 확인이 필요합니다");
               return false;
               }
           if (document.join.pwd.value == ""){
              alert("암호를 반드시 입력해주세여");
              join.pwd.focus();
              return false;
           }
            if (document.join.pwd2.value == ""){
              alert("암호를 반드시 입력해주세여");
              join.pwd2.focus();
              return false;
           }
           if(document.join.pwd.value != document.join.pwd2.value){
              alert("암호가 일치하지 않습니다");
              join.pwd.value="";
              join.pwd2.value="";
              join.pwd.focus();
              return false;
           }
           if (!document.join.pwd.value.match(/^([A-Za-z\d!@#$%^&*()\-_=+\\\|\[\]{};:'",.<>\/?]){10,20}$/)) {
               alert("암호는 대소문자, 숫자, 특수문자를 조합으로 10~20자리 이내로 입력해주세요.");
               join.pwd.focus();
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
           if (document.join.gender.value == 0) {
              alert("성별을 입력해주세요");
              join.gender.focus();
              return false;
           }
           if (document.join.email.value == "") {
              alert("이메일을 입력해주세요");
              join.email.focus();
              return false;
           }
           if ($(".mail_check_input").val() == "") { // 인증번호 입력란이 비어있을 경우
               alert("이메일 인증이 필요합니다."); // 경고창 띄우기
             return false;
            }
             if(!mailnumCheck){
              alert("인증번호를 다시 확인해주세요.");
               $(".mail_check_input").focus();
               return false;
            }
           if (document.join.phone.value == "") {
              alert("전화번호를 입력해주세요");
              join.phone.focus();
              return false;
           } 
           var patt = new RegExp("[0-9]{2,3}[0-9]{3,4}[0-9]{3,4}");
           var res = patt.test( $("#phone").val());

          if(!patt.test( $("#phone").val()) ){
            alert("전화번호를 정확히 입력하여 주십시오.");
             return false;
            }
           return true;   
        }



function fn_idChk(){
    if($("#id").val().length < 6) {
        alert("아이디는 최소 6글자 이상이어야 합니다.");
        return false;
    }
    $.ajax({
        url : "/users/idChk",
        type : "post",
        dataType : "json",
        data : {"id" : $("#id").val()},
        success : function(data){
            if(data == 1){
                alert("중복된 아이디입니다.");
            } else if(data == 0){
                $("#idChk").attr("value", "Y");
                alert("사용가능한 아이디입니다.");
            }
        }
    });
}

function emailCheck() {
         var email = $(".email").val(); 
         var conemail = document.getElementById('conemail');
         var correctColor = "#00ff00"; 
         var wrongColor = "#ff0000"; 

         $.ajax({
           url: "/users/check_email",
           type: 'POST',
           dataType: 'json',
           data: { "email" : $("#email").val() },
           success: function (data){
             if (data.result == 0){  
               conemail.innerHTML("사용가능한 이메일입니다");
                conemail.css("color", correctColor); // jQuery를 사용하여 내용 변경
             } else if (data.result == 1){ 
               conemail.innerHTML("중복된 이메일입니다");
                conemail.css("color", wrongColor);
             }
           }
         });
       }


      function DeleteCheck() {
  var sspwd = $('input#sspwd').val();
  
  if (sspwd != document.mypage.pwd.value) {
    alert("저장된 암호와 입력한 암호가 일치하지 않습니다.");
    mypage.pwd.value = "";
    mypage.pwd2.value = "";
    mypage.pwd.focus();
    return false;
  }
  
  if (document.mypage.pwd.value == "") {
    alert("암호를 반드시 입력해주세요.");
    mypage.pwd.focus();
    return false;
  }
  
  if (document.mypage.pwd.value != document.mypage.pwd2.value) {
    alert("암호가 일치하지 않습니다.");
    mypage.pwd.value = "";
    mypage.pwd2.value = "";
    mypage.pwd.focus();
    return false;
  }
  
  $(document.mypage).ready(function() {
    $('#exampleModal').modal('show');
  });
  
  return true;
}
    
      
   function passConfirm() {
  
      var pwd = document.getElementById('pwd');                
      var pwd2 = document.getElementById('pwd2');  
      var confirmMsg = document.getElementById('confirmMsg');     
      var correctColor = "#64CD3C";  
      var wrongColor ="#CD1039";   
      
      if(pwd.value == pwd2.value){       
        confirmMsg.style.color = correctColor;
        confirmMsg.innerHTML = "비밀번호 일치";
      }else{
         confirmMsg.style.color = wrongColor;
         confirmMsg.innerHTML ="비밀번호 불일치";
      }
   }
   
    


    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    addr += extraAddr;
                
                } else {
                    addr += ' ';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                 $(".address_input_1").val(data.zonecode);
                
                  $(".address_input_2").val(addr);
                  //$("[name=memberAddr2]").val(addr);
                // 커서를 상세주소 필드로 이동한다.
                 $(".address_input_3").attr("readonly",false);
                 $(".address_input_3").focus();
            }
        }).open();
    }



  function UpdateCheck(){
  			if (document.mypage.pwd.value == ""){
              alert("암호를 반드시 입력해주세요");
              mypage.pwd.focus();
              return false;
           }
           if (document.mypage.pwd2.value == ""){
              alert("암호를 반드시 입력해주세요");
              mypage.pwd.focus();
              return false;
           }
           if(document.mypage.pwd.value != document.mypage.pwd2.value){
              alert("암호가 일치하지 않습니다");
              mypage.pwd.value="";
              mypage.pwd2.value="";
              mypage.pwd.focus();
              return false;
           }
           if (document.mypage.phone.value == "") {
              alert("전화번호를 입력해주세요");
              mypage.phone.focus();
              return false;
           }   
 			if (document.mypage.adr.value == "  "){
              alert("주소를 반드시 입력해주세요");
              mypage.adr.focus();
              return false;
            }
            if (document.mypage.adr2.value == "  "){
              alert("주소를 반드시 입력해주세요");
              mypage.adr2.focus();
              return false;
            }
            if (document.mypage.adr3.value == "  "){
              alert("주소를 반드시 입력해주세요");
              mypage.adr3.focus();
              return false;
            }
           if (document.mypage.email.value == "") {
              alert("이메일을 입력해주세요");
              mypage.email.focus();
              return false;
           }
           
           return true;   
        }
       