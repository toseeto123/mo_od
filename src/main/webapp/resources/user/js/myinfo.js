function UpdateCheck(){
	var dbemail = '<c:out value='${login_info.email}'/>';
	console.log(dbemail);
	if ($("#myinfo_email").val() != dbemail) {
              alert("저장된 이메일과 다릅니다. 수정하시겠습니까? ");
              mypage_myInfo.myinfo_email.focus();
              return false;
           }
    return true;
}