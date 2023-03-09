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
</style>
<body>
<jsp:include page="../../common/adminHeader.jsp" />
	<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">
			<div class="d-flex align-items-center">
					<strong>상품관리 > 상품목록/수정 > 상품수정</<strong>
				</div>

			</div>
		</section>
<form role="form" method="get" action="updatePro">
<div class="warp">
<c:if test="${list.pro_number eq list.pro_number }">
<div class="inputArea"> 
카테고리 : 
                        <c:if test="${list.pro_categoryserial  eq 'A0' }">
						가구 > 침대프레임
						</c:if>
						<c:if test="${list.pro_categoryserial  eq 'A1' }">
						가구 > 매트리스
						</c:if>
						<c:if test="${list.pro_categoryserial  eq 'B0' }">
						조명 > 무드등
						</c:if>
						<c:if test="${list.pro_categoryserial  eq 'B1' }">
						조명 > 스탠드조명
						</c:if>
						<c:if test="${list.pro_categoryserial  eq 'C0' }">
						수납 > 옷장/행거
						</c:if>
						<c:if test="${list.pro_categoryserial  eq 'C1' }">
						수납 > 서랍
						</c:if>
						<c:if test="${list.pro_categoryserial  eq 'D0' }">
						침실시공
						</c:if>
						<c:if test="${list.pro_categoryserial  eq 'D1' }">
						거실시공
						</c:if>
						<c:if test="${list.pro_categoryserial  eq 'D2' }">
						주방시공
						</c:if>
						<c:if test="${list.pro_categoryserial  eq 'D3' }">
						욕조시공
						</c:if>


<div class="inputArea">
 <label for="">상품명</label>
 <input type="text" id="" name="pro_name" value="${list.pro_name}"/>
</div>


 <input type="hidden" id="" name="pro_number" value="${list.pro_number}"/>


<div class="inputArea">
 <label for="">판매여부</label>
 <input type="text" id="" name="pro_soldout" value="${list.pro_soldout}"/> <span style="color:red; font-size: 5px;"> 1 : 판매중지  /  0 : 판매중</span>
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
 <img alt="" src="resources/assets/img/product/${list.pro_img1}" style="width: 100px; height: 100px;"> >>변경후>>
 <img id="preview" style="width: 100px; height: 100px;"/>
</div><hr>

<div class="inputArea">
<label for="">이미지2</label>
 <input type="file" id="" name="pro_img2" onchange="readURL(this);" />
 <img alt="" src="resources/assets/img/product/${list.pro_img2}" style="width: 100px; height: 100px;"> >>변경후>>
 <img id="preview" style="width: 100px; height: 100px;"/>
</div><hr>

<div class="inputArea">
<label for="">이미지3</label>
 <input type="file" id="" name="pro_img3" onchange="readURL(this);" />
 <img alt="" src="resources/assets/img/product/${list.pro_img3}" style="width: 100px; height: 100px;"> >>변경후>>
 <img id="preview" style="width: 100px; height: 100px;"/>
</div><hr>

<div class="inputArea">
<label for="">이미지4</label>
 <input type="file" id="" name="pro_img4" onchange="readURL(this);" />
 <img alt="" src="resources/assets/img/product/${list.pro_img4}" style="width: 100px; height: 100px;"> >>변경후>>
 <img id="preview" style="width: 100px; height: 100px;"/>
</div><hr>

<div class="inputArea">
<label for="">이미지5</label>
 <input type="file" id="" name="pro_img5" onchange="readURL(this);" />
 <img alt="" src="resources/assets/img/product/${list.pro_img5}" style="width: 100px; height: 100px;"> >>변경후>>
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