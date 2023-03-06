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
<form role="form" method="post" action="insert.do"  enctype="multipart/form-data">
<div class="warp">

<div class="inputArea"> 
 <label for="mainCategory">1차 카테고리</label>
 <select class="category1" id="mainCategory" name="mainCategory" onchange="categoryChange(this)">
  <option value="A">가구</option>
  <option value="B">조명</option>
  <option value="C">수납</option>
  <option value="D">시공</option>
 </select>

 <label for="subCategory">2차 카테고리</label>
 <select class="category2" name="subCategory" id="subCategory">
  <option>선택</option>
 </select>
</div>

<script type="text/javascript">

function categoryChange(e){
	var gagu = ["매트리스","침대프레임"]
	var 조명 = ["무드등","스탠스"]
	var 수납 = ["옷장/행거","서랍"]
	var 시공 = ["침실","거실","주방","욕실"]
	var target = document.getElementById("subCategory");
	
	if(e.value == "A") var d = gagu;
	else if (e.value == "B") var d = 조명;
	else if (e.value == "C") var d = 수납;
	else if (e.value == "D") var d = 시공;
	
	target.options.length=0;
	
	for(x in d){
		var opt = document.createElement("option");
		opt.value = d[x];
		opt.innerHTML = d[x];
		target.appendChild(opt);
	}
	
	
}
</script>

<div class="inputArea">
 <label for="">상품명</label>
 <input type="text" id="" name="pro_name" />
</div>


<div class="inputArea">
 <label for="">상품일련번호</label>
 <input type="text" id="" name="pro_serialnumber" />
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
 <input type="file" id="" name="file" />
</div>
<div class="inputArea">
 <label for="">이미지2</label>
 <input type="file" id="" name="file1" />
</div>
<div class="inputArea">
 <label for="">이미지3</label>
 <input type="file" id="" name="file2" />
</div>
<div class="inputArea">
 <label for="">이미지3</label>
 <input type="file" id="" name="file3" />
</div>
<div class="inputArea">
 <label for="">이미지3</label>
 <input type="file" id="" name="file4" />
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