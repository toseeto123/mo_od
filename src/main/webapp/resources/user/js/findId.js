		let pluralId = [];
		let someId = [];
		let num = 0;
		let time;
		let interval;
		let email;
		let concatPluralId ;
		
		function emailValidate(){
			if (!document.getElementById("email").checkValidity()) {
				document.getElementById("email").reportValidity();
    	  } else {
				emailCheck();
    	  }
		}
		
		function numValidate(){
			if (!document.getElementById("email").checkValidity()) {
				document.getElementById("email").reportValidity();
    	  } else {
    		  numCheck();
    	  }
		}
		
		function emailCheck(){
			var xhr = new XMLHttpRequest();

			xhr.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					console.log(this.responseText)
					if (this.responseText != 'Success') {//만약 이메일이 없다면						
						document.getElementById('emailCheck').innerHTML = '존재하지 않는 이메일입니다.'						
						return;
					}					
						sendEmail();
						document.getElementById('emailCheck').innerHTML = '인증번호가 발송되었습니다.'
						
				}
			};
			xhr.open("get", "/searchEmail?email="+document.getElementById('email').value, true);
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
					pluralId =[];
					someId = [];
					if(num > 0){
						email = document.getElementById('email').value;
						clearInterval(interval);
						time = 120;   	
			    		interval = setInterval(timer, 1000);
					}
					for(var i=0; i<data.id.length; i++){
                		pluralId.push(data.id[i].id);
                	}       
                	for(var i=0; i<pluralId.length; i++){
                		someId.push("<span style='color: #505050; cursor: pointer;' onClick='copy(this)'>"+pluralId[i]+"</span>")
                	}	
                	concatPluralId = someId.join("<span style='color: #505050';>, </span>");
				}
			};
			xhr.open("get", "/sendEmail?email="+document.getElementById('email').value, true);
			xhr.send();
		}
		
		function numCheck(){
			if(num > 0 && num == document.getElementById('number').value && time > 0){
				clearInterval(interval);
				document.getElementById('time').innerHTML = '인증성공';
				document.getElementById('show').innerHTML = "아이디는 " + concatPluralId + "입니다.";
			}
			if(num == 0){
				alert("이메일을 인증해주세요");
				document.getElementById('email').focus();
			}
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
				}
				clearInterval(interval);	
			}	
		}
		
		function copy(event){
  		  var temp = document.createElement("textarea");
  		  temp.value = event.innerText;
  		  document.body.appendChild(temp);
  		  temp.select();
  		  document.execCommand("copy");
  		  document.body.removeChild(temp);
  		  alert("복사되었습니다.");
  		}	