<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<style type="text/css">

.warp{
	width: 600px;
	margin : 0 auto;
}
.inputArea {
margin-bottom: 20px;
}
	
label {
display: inline-block;
width: 150px;
font-weight: bold;
}
	
input[type="text"],
textarea {
width: 300px;
padding: 5px;
border: 1px solid #ccc;
border-radius: 5px;
font-size: 16px;
}
	
input[type="file"] {
margin-top: 5px;
}
	
span {
font-size: 12px;
}
	
button {
padding: 10px 20px;
background-color: #007bff;
color: #fff;
border: none;
border-radius: 5px;
font-size: 16px;
cursor: pointer;
}
	
button:hover {
background-color: #0069d9;
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
 <select class="category1" id="mainCategory" name="mainCategory" onclick="mainCategoryChange(this)">
  <option value="A">가구</option>
  <option value="B">조명</option>
  <option value="C">수납</option>
  <option value="D">시공</option>
 </select>

 <label for="subCategory">2차 카테고리</label>
 <select class="category2" name="subCategory" id="subCategory" onclick="subCategoryChange()">
  <option>선택</option>
 </select>
</div>

<script type="text/javascript">
function mainCategoryChange(e){
	var 가구 = ["매트리스","침대프레임","소파"]
	var 조명 = ["무드등","스탠스"]
	var 수납 = ["옷장/행거","서랍"]
	var 시공 = ["침실","거실","주방","욕실"]
	var target = document.getElementById("subCategory");
	
	if(e.value == "A") var d = 가구;
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
	$("#categoryserial").val(e.value);
}

</script>

<script type="text/javascript">
function subCategoryChange() {
	var index = $("#subCategory option").index($("#subCategory option:selected"));
	var a = $("#categoryserial").val();
	$("#categoryserial").val(a.substring(0,1)+index);
}
</script>



<div class="inputArea">
 <label for="">상품명</label>
 <input type="text" id="" name="pro_name" />
</div>
<div class="inputArea">
 <label for="">상품일련번호</label>
 <input type="text" id="categoryserial" name="pro_categoryserial" /><span style="color:red; font-size: 5px;">*상품일련번호 추가입력금지</span><br>
</div>

<div class="inputArea">
 <label for="">옵션1</label>
 <input type="text" id="" name="pro_option1" /><span style="color:red; font-size: 5px;">*옵션 필수아님</span><br>
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
 <input type="text" id="" name="pro_price" /><span style="color:red; font-size: 5px;">*숫자만입력</span><br>
</div>


<div class="inputArea">
 <span style="color:red;">*이미지 사이즈 정사각형 권장 500px 이상, 800px 이하</span><br>
 <label for="">이미지1</label>
 <input type="file" id="" name="file" /><span style="color:red; font-size: 5px;">*이미지1 필수, 제일이쁜사진</span><br>
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
 <label for="">이미지4</label>
 <input type="file" id="" name="file3" />
</div>
<div class="inputArea">
 <label for="">이미지5</label>
 <input type="file" id="" name="file4" />
</div>




<div class="inputArea">
 <label for="">서브상품설명</label><span style="color:red; font-size: 5px;">ex) 수납/감성/공간활용</span><br>
 <input type="text" id="" name="pro_subdesc" />
</div>
<div class="inputArea">
 <label for="">메인상품설명제목</label><span style="color:red; font-size: 5px;">ex) 당신의 잠자리를 포근하게</span><br>
 <input type="text" id="" name="pro_maindesctitle" />
</div>

<div class="inputArea">
 <label for="">메인상품설명</label><span style="color:red; font-size: 5px;">*한문장 쓰고 엔터필수</span><br>
 <textarea rows="5" cols="50" id="" name="pro_maindesc"></textarea>
</div>


<div class="inputArea">
 <button type="submit" id="" class="btn btn-primary">등록</button>
</div>


</div>
</form>
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>
