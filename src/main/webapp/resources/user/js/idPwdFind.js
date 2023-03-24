	let num = 0;
	let time;
	let interval;
	let data;
	let emailFlag;
	let idFlag;
	let isEmailCorrect = false;
	function emailCheck(){		
	
		if(document.getElementById('status').value =='id'){
			document.getElementById('show').innerHTML = '';
		}
		
		const xhr = new XMLHttpRequest();
		
		xhr.open('GET', '/searchEmailCheck?email='+document.getElementById('email').value);

		xhr.onreadystatechange = function() {
			
		  if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
		  		clearInterval(interval);
			  data = JSON.parse(xhr.responseText);
			  console.log(data);
		    if( data.num == 'none'){
		    	if(emailFlag){
		    		document.getElementById('emailCheck').innerHTML = ''
		    		return;
		    	}		    	
		    	document.getElementById('emailCheck').innerHTML = '존재하지 않는 이메일입니다.'
				return;
		    }else{
		    	if(document.getElementById('status').value == 'pwd'){//비밀번호 찾기 일때
		    		for(var x=0; x<data.id.length; x++){
		    			if(document.getElementById('storage').value == data.id[x].id){
		    				isEmailCorrect = true;
		    			}
		    		}
		    		
		    		if(!isEmailCorrect){//아이디가 일치하지 않을 때
		    			if(emailFlag){
		    				document.getElementById('emailCheck').innerHTML = ''
		    				return;
		    			}
		    			document.getElementById('emailCheck').innerHTML = '존재하지 않는 이메일입니다.'
		    			return;
		    		}
		    		document.getElementById('emailStorage').value = document.getElementById('email').value;
		    		console.log('두둥');
		    		
		    	}	
		    	
		    		document.getElementById('emailCheck').innerHTML = '이메일이 인증되었습니다.'
		    		console.log(data.num);		    		
		    		num = data.num; 
		    		time = 120;   	
		    		interval = setInterval(timer, 1000);
		    }		    
		  }
		  
		};


		xhr.send();
	}
	
	
	function timer(){
		
		if(time > 0){
			
			time = time - 1;
			var minute = time/60;
			var second = time%60;
			document.getElementById('time').innerHTML = 
				Math.floor(minute).toString().padStart(2, '0') + ' : ' + second.toString().padStart(2, '0');
		
		}else{
			
			clearInterval(interval);
			
		}	
	}
	
	    function idValidateForm() {
        	  // 폼 요소의 유효성 검사 수행
        	  if (!document.getElementById("id").checkValidity()) {
					idFlag = true;
        	    document.getElementById("id").reportValidity();
        	  } else {
					idFlag = false;
        	  }
        	}
        	
        	    function validateForm() {
        	  // 폼 요소의 유효성 검사 수행
        	  if (!document.getElementById("email").checkValidity()) {
        		 emailFlag = true;
        	    document.getElementById("email").reportValidity();
        	  } else {
        		  emailFlag = false;
        	  }
        	}
        	
        	
        	
        	function idCheck() {
										if(idFlag){
											return;
										}
										
										var xhr = new XMLHttpRequest();

										xhr.onreadystatechange = function() {
											if (this.readyState == 4
													&& this.status == 200) {
												if (parseInt(this.responseText) > 0) {
													document
															.getElementById('storage').value = document
															.getElementById('id').value;
													document
															.getElementById('idCheck').innerHTML = '존재하는 아이디입니다.';
												} else {
													document
															.getElementById('idCheck').innerHTML = '존재하지 않는 아이디입니다.';
												}
											}
										};

										var idValue = "id="
												+ document.getElementById('id').value;

										xhr.open("POST", "/idChk", true);

										xhr
												.setRequestHeader(
														"Content-Type",
														"application/x-www-form-urlencoded");

										xhr.send(idValue);
									}
									
									
function validate(){
	if(document.getElementById('status').value == 'pwd'){
		if(!idFlag && document.getElementById('idCheck').innerHTML != '존재하는 아이디입니다.'){
			alert('아이디를 인증해주세요');
			document.getElementById('id').focus();
			return;
		}		
	}
	if(!emailFlag && document.getElementById('emailCheck').innerHTML != '이메일이 인증되었습니다.'){
		alert('이메일을 인증해주세요');
		document.getElementById('email').focus();
		return;
	}
}