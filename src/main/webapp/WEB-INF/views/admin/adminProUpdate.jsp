<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<style type="text/css">
.warp{
	width: 900px;
	margin : 0 auto;
}
.inputArea label {
  margin-bottom: 10px;
}
/* 버튼 스타일 */
.btn {
  padding: 10px 20px;
  border-radius: 5px;
  box-shadow: 1px 1px 3px rgba(0,0,0,0.3);
  background-color: #007bff;
  border: none;
  color: #fff;
}
/* 버튼에 호버 효과 추가 */
.btn:hover {
  background-color: #0069d9;
}
input[type=button] {
	color: white;
	background: #d2b48c;
	width: 100px;
	border-radius: 10px;
	border: none;
	font-size: 20px;
}
input[type=search] {
	font-size: 18px;
}
#searchBtn {
  position: absolute;
  top: 10%;
  left: 50%;
  transform: translateX(-50%);
  width: 250px;
}
</style>
<body>
<jsp:include page="../../common/adminHeader.jsp" />
<form role="form" method="get" action="updatePro">
<input type="button" style="" id="searchBtn" value="상품리스트 이동" onclick="location.href='/admin/adminProList.do'">
<div class="warp">
<c:if test="${list.pro_number eq list.pro_number }">
<div class="inputArea" style="margin-top: 100px;">
 <label for="">상품명</label>
 <input type="text" id="" name="pro_name" value="${list.pro_name}"/>
</div>


 <input type="hidden" id="" name="pro_number" value="${list.pro_number}"/>


<div class="inputArea">
 <label for="">판매여부</label>
 <input type="text" id="" name="pro_soldout" value="${list.pro_soldout}"/> <span style="color:red; font-size: 15px;"> 1 : 판매중지  /  0 : 판매중</span>
</div>

<div class="inputArea">
 <label for="">옵션1</label>
 <input type="text" id="" name="pro_option1" value="${list.pro_option1}"/>
</div>
<div class="inputArea">
 <label for="">옵션2</label>
 <input type="text" id="" name="pro_option2" value="${list.pro_option2}"/>
</div>
<div class="inputArea">
 <label for="">옵션3</label>
 <input type="text" id="" name="pro_option3" value="${list.pro_option3}" />
</div>

<div class="inputArea">
 <label for="">상품가격</label>
 <input type="text" id="" name="pro_price" value="${list.pro_price}"/>
</div>

<hr>
<div class="inputArea">
 <label for="">이미지1</label>
 <input type="file" id="" name="pro_img1" onchange="readURL(this);" />
 <img alt="" src="${pageContext.request.contextPath}/resources/assets/img/product/${list.pro_img1}" style="width: 100px; height: 100px;"> >>변경후>>
 <img id="preview" style="width: 100px; height: 100px;"/>
</div><hr>

<div class="inputArea">
<label for="">이미지2</label>
 <input type="file" id="" name="pro_img2" onchange="readURL(this);" />
 <img alt="" src="${pageContext.request.contextPath}/resources/assets/img/product/${list.pro_img2}" style="width: 100px; height: 100px;"> >>변경후>>
 <img id="preview" style="width: 100px; height: 100px;"/>
</div><hr>

<div class="inputArea">
<label for="">이미지3</label>
 <input type="file" id="" name="pro_img3" onchange="readURL(this);" />
 <img alt="" src="${pageContext.request.contextPath}/resources/assets/img/product/${list.pro_img3}" style="width: 100px; height: 100px;"> >>변경후>>
 <img id="preview" style="width: 100px; height: 100px;"/>
</div><hr>

<div class="inputArea">
<label for="">이미지4</label>
 <input type="file" id="" name="pro_img4" onchange="readURL(this);" />
 <img alt="" src="${pageContext.request.contextPath}/resources/assets/img/product/${list.pro_img4}" style="width: 100px; height: 100px;"> >>변경후>>
 <img id="preview" style="width: 100px; height: 100px;"/>
</div><hr>

<div class="inputArea">
<label for="">이미지5</label>
 <input type="file" id="" name="pro_img5" onchange="readURL(this);" />
 <img alt="" src="${pageContext.request.contextPath}/resources/assets/img/product/${list.pro_img5}" style="width: 100px; height: 100px;"> >>변경후>>
 <img id="preview" style="width: 100px; height: 100px;"/>
</div><hr>




<div class="inputArea">
 <label for="">서브상품설명</label>
 <input type="text" id="" name="pro_subdesc" value="${list.pro_subdesc}"/>
</div>
<div class="inputArea">
 <label for="">메인상품설명</label>
 <input type="text" id="" name="pro_maindesctitle" value="${list.pro_maindesctitle}"/>
</div>


<div class="inputArea">
 <label for="">메인상품설명</label>
 <textarea rows="5" cols="50" id="" name="pro_maindesc"> ${list.pro_maindesc}</textarea>
</div>




</c:if>

<div class="inputArea">
 <button type="submit" id="" class="btn btn-primary">수정완료</button>
 <button type="reset" id="" class="btn btn-primary">초기화</button>
</div>


</div>
</form>


<script type="text/javascript">
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}
</script>
</body>
<jsp:include page="../../common/footer.jsp" />
</html>