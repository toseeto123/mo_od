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
	width: 450px;
	margin : 0 auto;
	background-color:#f5f6f7;
}
.inputArea {
width : 1000px;
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
	
body>span {
font-size: 12px;
}
	
button {
width:450px;
padding: 10px 20px;
background-color: #525252;
color: #fff;
border: none;
font-size: 16px;
cursor: pointer;
}
	
button:hover {
background-color: #323232;
}
input[type=search]{
	font-size: 18px;
}
#searchBtn {
  position: absolute;
  top: 10%;
  left: 50%;
  transform: translateX(-50%);
  width: 250px;
}
.aiccontainer{
padding-top: 10px;
}
.aic{
width: 800px;
margin: 0 auto;


}
.align-items-center>a{
margin: 0 auto;
color : #323232;
}

body{
background-color:#f5f6f7;
}
</style>

<body style="background-color:#f5f6f7;">
	<jsp:include page="../../common/adminHeader.jsp" />
<form role="form" method="post" action="/admin/insert"  enctype="multipart/form-data">
	      <section id="breadcrumbs" class="breadcrumbs" style="height: 70px; padding-bottom: 80px; font-size: 22px;">
         <div class="container aiccontainer">
            <div class="d-flex align-items-center aic">
				<a href="/admin/adminProList">상품리스트</a>      
				<a href="/admin/insert" style="border-bottom: 2px solid #323232; font-size: 28px;">상품등록</a>
            </div>
         </div>
      </section>

<div class="warp">
<div class="inputArea" style="margin-top: 50px;"> 
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
 <input type="text" id="categoryserial" name="pro_categoryserial" /><span style="color:red; font-size: 15px;">*상품일련번호 추가입력금지</span><br>
</div>

<div class="inputArea">
 <label for="">옵션1</label>
 <input type="text" id="" name="pro_option1" /><span style="color:red; font-size: 15px;">*옵션 필수아님</span><br>
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
 <input type="text" id="" name="pro_price" /><span style="color:red; font-size: 15px;">*숫자만입력</span><br>
</div>


<div class="inputArea">
 <span style="color:red; font-size: 15px;">*이미지 권장사이즈 : 500*500px</span><br>
 <label for="">이미지1</label>
 <input type="file" id="" name="file1" /><span style="color:red; font-size: 15px;">*이미지1 필수, 제일이쁜사진</span><br>
</div>
<div class="inputArea">
 <label for="">이미지2</label>
 <input type="file" id="" name="file2" />
</div>
<div class="inputArea">
 <label for="">이미지3</label>
 <input type="file" id="" name="file3" />
</div>
<div class="inputArea">
 <label for="">이미지4</label>
 <input type="file" id="" name="file4" />
</div>
<div class="inputArea">
 <label for="">이미지5</label>
 <input type="file" id="" name="file5" />
</div>




<div class="inputArea">
 <label for="">서브상품설명</label><span style="color:red; font-size: 15px;">ex) 수납/감성/공간활용</span><br>
 <input type="text" id="" name="pro_subdesc" style="width: 450px;"/>
</div>
<div class="inputArea">
 <label for="">메인상품설명제목</label><span style="color:red; font-size: 15px;">ex) 당신의 잠자리를 포근하게</span><br>
 <input type="text" id="" name="pro_maindesctitle" style="width: 450px;"/>
</div>

<div class="inputArea">
 <label for="">메인상품설명</label><span style="color:red; font-size: 15px;">*한문장 쓰고 엔터필수</span><br>
 <textarea rows="5" cols="50" id="" name="pro_maindesc" style="width: 450px;"></textarea>
</div>


<div class="inputArea" style="margin-bottom: 50px;">
 <button type="submit" id="" class="" onclick="insertalert()">등록</button>
</div>


</div>
</form>
	<jsp:include page="../../common/footer.jsp" />
</body>
<script>
function insertalert() {
  alert('상품등록이 완료되었습니다.');
}
</script>
</html>