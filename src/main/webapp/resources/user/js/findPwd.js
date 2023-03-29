		let id;
		let num = 0;
		let time;
		let interval;
		let email;
		
		function idValidate(){
			if (!document.getElementById("id").checkValidity()) {
				document.getElementById("id").reportValidity();
    	  } else {
				idCheck();
    	  }
		}
		
		function idCheck(){
			var xhr = new XMLHttpRequest();

			xhr.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					console.log(this.responseText)
					if (this.responseText != 'Success') {//만약 이메일이 없다면						
						document.getElementById('idCheck').innerHTML = '존재하지 않는 아이디입니다.'		
						document.getElementById('idCheck').style.color = "red";				
						return;
					}
						id = document.getElementById('id').value;
						document.getElementById('idCheck').innerHTML = '인증성공'	
						document.getElementById('idCheck').style.color = "green";		
						document.getElementById('email').focus();
											
				}
			};
			xhr.open("get", "/searchIdCheck?id="+document.getElementById('id').value, true);
			xhr.send();
		}
		
		function emailValidate(){
			if (!document.getElementById("id").checkValidity()) {
				document.getElementById("id").reportValidity();
    	  } else {
    			if (!document.getElementById("email").checkValidity()) {
    				document.getElementById("email").reportValidity();
        	  } else {
    			emailCheck();
        	  }
    	  }
		}
		
		function emailCheck(){
			var xhr = new XMLHttpRequest();

			xhr.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					if (this.responseText != 'Success') {						
						document.getElementById('emailCheck').innerHTML = '존재하지 않는 이메일입니다.'
						document.getElementById('emailCheck').style.color = "red";						
						return;
					}
						email = document.getElementById('email').value;
						sendEmail();
						document.getElementById('emailCheck').innerHTML = '이메일이 발송되었습니다.'
						document.getElementById('emailCheck').style.color = "green";
						document.getElementById('number').focus();						
				}
			};
			xhr.open("get", "/searchIdEmail?id=" + id + "&email="+document.getElementById('email').value, true);
			xhr.send();
		}
		
		function sendEmail(){
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					num = 0;
					var data = JSON.parse(this.responseText);
					num = data.num;
					console.log(num)
					if(num > 0){
						email = document.getElementById('email').value;
						clearInterval(interval);
						time = 120;   	
			    		interval = setInterval(timer, 1000);
					}	
				}
			};
			xhr.open("get", "/sendEmail?email="+email, true);
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
				if(num>0){
					document.getElementById('time').innerHTML = '인증시간 만료';
					document.getElementById('time').style.color = "red";
				}
				clearInterval(interval);	
			}	
		}
		
		
		function numValidate(){
			if (!document.getElementById("id").checkValidity()) {
				document.getElementById("id").reportValidity();
    	  } else {
    		  if (!document.getElementById("email").checkValidity()) {
  					document.getElementById("email").reportValidity();
      	  		} else {
      		  		numCheck();
      	  }
    	  }
		}
		
		
		function numCheck(){
			if(num > 0 && num == document.getElementById('number').value && time > 0){
				clearInterval(interval);
				document.getElementById('time').innerHTML = '인증성공';
				document.getElementById('time').style.color = "green";
				$('#myModal').modal('show');
			}
			if(num == 0){
				alert("이메일을 인증해주세요");
				document.getElementById('email').focus();
			}
		}
		
		function generatePassword(length) {
			  var chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
			  var password = "";
			  for (var i = 0; i < length; i++) {
			    password += chars.charAt(Math.floor(Math.random() * chars.length));
			  }
			  return password;
			}
		
		function passwordChange(){
			var pass = generatePassword(12);
			const xhr = new XMLHttpRequest();
			const url = "/passwordChange?id="+id+"&pwd="+pass+"&email="+email;
			xhr.open("GET", url);
			xhr.onreadystatechange = function () {
			    if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
			        const data = xhr.responseText;
			        if(data == 'Success'){
			        	alert("비밀번호가 발급되었습니다.")
			        	location.href='/users/login';
			        }else{
			        	alert('비밀번호가 변경되지 않았습니다.')
			        }
			    }
			};
			xhr.send();
		}
		
		
		
		
		document.getElementById('id').addEventListener("keyup", function(event) {
	  if (event.keyCode === 13) {
		  idValidate();
	  }
	});

	document.getElementById('email').addEventListener("keyup", function(event) {
		  if (event.keyCode === 13) {
			  emailValidate();
		  }
		});
	document.getElementById('number').addEventListener("keyup", function(event) {
		  if (event.keyCode === 13) {
			  numValidate();
		  }
		});
		
		