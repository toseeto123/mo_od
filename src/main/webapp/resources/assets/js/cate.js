function flush(type, element) {
	  const resultElement = element.parentNode.previousElementSibling;
	  let number = resultElement.innerText;

	  const cateIdList = document.querySelectorAll('.cate_id');
	  const cateIdArray = Array.from(cateIdList);
	  const cateIdValues = cateIdArray.map(function(element) {
	    return element.value;
	  });

	  // get the index of the current loop iteration
	  const cateIdIndex = cateIdArray.indexOf(element.parentNode.nextElementSibling);
	  const cateId = cateIdValues[cateIdIndex];

	  let xhr = new XMLHttpRequest();
	  xhr.open('POST', 'update.do', true);
	  xhr.setRequestHeader('Content-Type', 'application/json'); // JSON 형태의 데이터 전송을 위한 설정

	  xhr.onreadystatechange = function() {
	    if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
	      resultElement.innerText = this.responseText;
	    }
	  };

	  if (type === 'plus') {
	    number = parseInt(number) + 1;
	  }

	  if (cateId != null) {
	    const data = {
	      number: number,
	      cateId: cateId
	    };
	    xhr.send(JSON.stringify(data)); // JSON 형태의 데이터 전송
	  }

	  resultElement.innerText = number;
}

   function minus(type, element) {
      const resultElement = element.parentNode.previousElementSibling;
      let number = resultElement.innerText;

      let xhr = new XMLHttpRequest(); // XMLHttpRequest 객체 생성
      xhr.open('POST', 'minusupdate.do', true);
      xhr.setRequestHeader('Content-Type',
            'application/x-www-form-urlencoded'); // 요청 헤더 설정

      xhr.onreadystatechange = function() {
         if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
            // 서버로부터 응답이 왔을 때 처리할 내용
            //resultElement.innerHtml = this.responseText;
         }
      };

      if (type === 'minus') {
         number = parseInt(number) - 1;
      }

      xhr.send(`number=${number}`); // 서버로 number 값을 전송
      resultElement.innerText = number;
   }