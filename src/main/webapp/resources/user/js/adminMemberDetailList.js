let flag = false;
const urls = document.referrer
			const url = urls.split("/")
			let j = url.length;
			let goUrl = '';
			
	function memberDelete(){
	for(var i=0; i<url.length; i++){
		if(url[i] == 'admin'){
			j = i;
		}
	} 
	for(var k=j; k<url.length; k++){
		goUrl = goUrl + '/' + url[k];
	}
	
	location.href = '/admin/deleteMember?id='+document.getElementById('whatId').value+'&url='+goUrl;;
}
			
	function updateMember(){
		if(document.getElementById('id').value != document.getElementById('idCheck').value){
			if(!flag){
				alert('아이디 중복확인이 필요합니다');
				return false;
			}			
		}
			
			for(var i=0; i<url.length; i++){
				if(url[i] == 'admin'){
					j = i;
				}
			} 
			for(var k=j; k<url.length; k++){
				goUrl = goUrl + '/' + url[k];
			}
			document.getElementById('url').value = goUrl;
			
}

function checkingId(){
	if($("#id").val().length < 6) {
	        alert("아이디는 최소 6글자 이상이어야 합니다.");
	        flag = false;
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
					flag = false;
				}else{
					alert('사용가능한 아이디입니다.');
					flag = true;
				}
			} else if(data == 0){
					alert("사용가능한 아이디입니다.");
					flag = true;
			}
		}
	});
}
								

				
								
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
	
	
