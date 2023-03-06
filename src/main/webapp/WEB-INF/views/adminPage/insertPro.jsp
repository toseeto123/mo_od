<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">

.warp{
	width: 500px;
	margin : 0 auto;
}
</style>
<body>
	<jsp:include page="../../common/adminHeader.jsp" />
	<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">
			<div class="d-flex align-items-center">
					<strong>상품관리 > 상품등록</<strong>
				</div>

			</div>
		</section>
<form role="form" method="post" action="insert.do">
<div class="warp">

<div class="inputArea"> 
 <label>1차 카테고리</label>
 <select class="category1">
  <option value="">가구</option>
 </select>

 <label>2차 카테고리</label>
 <select class="category2" name="cateCode">
  <option value="">전체</option>
 </select>
</div>

<div class="inputArea">
 <label for="">상품명</label>
 <input type="text" id="" name="pro_name" />
</div>

<div class="inputArea">
 <label for="">상품일련번호</label>
 <input type="text" id="" name="" />
</div>

<div class="inputArea">
 <label for="">옵션1</label>
 <input type="text" id="" name="pro_option1" />
</div>
<div class="inputArea">
 <label for="">옵션2</label>
 <input type="text" id="" name="pro_option2" />
</div>
<div class="inputArea">
 <label for="">옵션3</label>
 <input type="text" id="" name="pro_option3" />
</div>

<div class="inputArea">
 <label for="">상품가격</label>
 <input type="text" id="" name="pro_price" />
</div>


<div class="inputArea">
 <label for="">이미지1</label>
 <input type="file" id="" name="" />
</div>
<div class="inputArea">
 <label for="">이미지2</label>
 <input type="file" id="" name="" />
</div>
<div class="inputArea">
 <label for="">이미지3</label>
 <input type="file" id="" name="" />
</div>



<div class="inputArea">
 <label for="">서브상품설명</label>
 <input type="text" id="" name="pro_desc2" />
</div>


<div class="inputArea">
 <label for="">메인상품설명</label>
 <textarea rows="5" cols="50" id="" name="pro_desc1"></textarea>
</div>

<div class="inputArea">
 <button type="submit" id="" class="btn btn-primary">등록</button>
</div>


</div>
</form>
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>