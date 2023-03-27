<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Portfolio Details - Groovin Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Favicons -->
<link href="${pageContext.request.contextPath}/resources/assets/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath}/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
   href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
   rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath}/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
   rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/vendor/boxicons/css/boxicons.min.css"
   rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/vendor/glightbox/css/glightbox.min.css"
   rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${pageContext.request.contextPath}/resources/assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: Groovin - v4.10.0
  * Template URL: https://bootstrapmade.com/groovin-free-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/spring-webmvc/5.3.8/spring-webmvc.min.js"></script>

</head>
<style>
pre{
    overflow: auto;
    white-space: pre-wrap; /* pre tag내에 word wrap */

}
.chk_option{
   cursor: pointer;
}

.cateBtn , .btn_buy{
   background-color: #c8936ed4;
   width: 416px;
   height: 50px;
   border : none;
   border-radius: 30px;
   box-shadow: 1px 1px 1px 1px lightgray;  
}
/* 라디오 버튼 스타일링 */
input[type="radio"] {
  -webkit-appearance: none; /* 브라우저별 스타일링 제거 */
  -moz-appearance: none;
  appearance: none;
  border-radius: 50%; /* 라운드 처리 */
  width: 15px; /* 사이즈 */
  height: 15px;
  border: 2px solid #e4e4e4; /* 보더 설정 */
  background-color: #fff; /* 배경색 설정 */
  outline: none; /* 포커스 아웃라인 제거 */
  transition: all 0.3s ease-in-out; /* 호버 애니메이션 처리 */
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

/* 선택된 라디오 버튼 스타일링 */
input[type="radio"]:checked {
  background-color: #4f88f7; /* 선택 시 배경색 변경 */
  border-color: #4f88f7; /* 선택 시 보더 색 변경 */
}

/* 라디오 버튼의 가짜 내부 원 스타일링 */
input[type="radio"]:before {
  content: ""; /* 내용 없음 */
  display: block;
  width: 0; /* 가짜 원 초기 크기 */
  height: 0;
  border-radius: 50%;
  background-color: #4f88f7; /* 가짜 원 배경색 */
  position: absolute; /* 부모 요소에 대해 절대 위치 지정 */
  top: 50%; /* 수직 위치 중앙으로 */
  left: 50%; /* 수평 위치 중앙으로 */
  transform: translate(-50%, -50%) scale(0); /* 가짜 원 초기 크기와 위치 설정 */
  transition: all 0.3s ease-in-out; /* 호버 애니메이션 처리 */
}

/* 선택된 라디오 버튼의 가짜 내부 원 스타일링 */
input[type="radio"]:checked:before {
  width: 18px; /* 가짜 원 크기 변경 */
  height: 18px;
  transform: translate(-50%, -50%) scale(1); /* 가짜 원 크기와 위치 변경 */
}

.portfolio-info li {
font-size: 20px;
margin: 0;


}
.portfolio-info li+li{
margin-top: 0;

}
.btnhover:hover{
background: #da8862;
}

</style>
<body>
<jsp:include page="/WEB-INF/common/header.jsp" />
<form method="post" action="/users/cateinsert" class="cateinsert">
   <main id="main">
<c:if test="${list.pro_number eq list.pro_number }">
      <!-- ======= Breadcrumbs ======= -->
      <section id="breadcrumbs" class="breadcrumbs" style="height: 70px; padding-bottom: 80px; font-size: 22px;">
         <div class="container">

            <div class="d-flex align-items-center">
               
               <ol>
                  <c:if test="${list.pro_categoryserial  eq 'A0' }">
                  <a href="/AcategoryList" style="margin-top: 20px;">가 구</a>&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-angle-right" aria-hidden="true" style="margin-top: 23px;"></i>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'A1' }">
                  <a href="/AcategoryList" style="margin-top: 20px;">가 구</a>&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-angle-right" aria-hidden="true" style="margin-top: 23px;"></i>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'A2' }">
                  <a href="/AcategoryList" style="margin-top: 20px;">가 구</a>&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-angle-right" aria-hidden="true" style="margin-top: 23px;"></i>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'B0' }">
                  <a href="/BcategoryList" style="margin-top: 20px;">조 명</a>&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-angle-right" aria-hidden="true" style="margin-top: 23px;"></i>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'B1' }">
                  <a href="/BcategoryList" style="margin-top: 20px;">조 명</a>&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-angle-right" aria-hidden="true" style="margin-top: 23px;"></i>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'C0' }">
                  <a href="/CcategoryList" style="margin-top: 20px;">수 납</a>&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-angle-right" aria-hidden="true" style="margin-top: 23px;"></i>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'C1' }">
                  <a href="/CcategoryList" style="margin-top: 20px;">수 납</a>&nbsp;&nbsp;&nbsp;&nbsp; <i class="fa fa-angle-right" aria-hidden="true" style="margin-top: 23px;"></i>
                  </c:if> 
                  
                  <c:if test="${list.pro_categoryserial  eq 'A0' }">
                  &nbsp;&nbsp;&nbsp;&nbsp;<a href="/A0categoryList" style="margin-top: 20px;">매트리스</a>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-right" aria-hidden="true" style="margin-top: 23px;"></i>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'A1' }">
                  &nbsp;&nbsp;&nbsp;&nbsp;<a href="/A1categoryList" style="margin-top: 20px;">침대프레임</a>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-right" aria-hidden="true" style="margin-top: 23px;"></i>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'A2' }">
                  &nbsp;&nbsp;&nbsp;&nbsp;<a href="/A2categoryList" style="margin-top: 20px;">소 파</a>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-right" aria-hidden="true" style="margin-top: 23px;"></i>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'B0' }">
                  &nbsp;&nbsp;&nbsp;&nbsp;<a href="/B0categoryList" style="margin-top: 20px;">무드등</a>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-right" aria-hidden="true" style="margin-top: 23px;"></i>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'B1' }">
                  &nbsp;&nbsp;&nbsp;&nbsp;<a href="/B1categoryList" style="margin-top: 20px;">스탠드조명</a>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-right" aria-hidden="true" style="margin-top: 23px;"></i>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'C0' }">
                  &nbsp;&nbsp;&nbsp;&nbsp;<a href="/C0categoryList" style="margin-top: 20px;">옷장/행거</a>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-right" aria-hidden="true" style="margin-top: 23px;"></i>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'C1' }">
                  &nbsp;&nbsp;&nbsp;&nbsp;<a href="/C1categoryList" style="margin-top: 20px;">서 랍</a>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-right" aria-hidden="true" style="margin-top: 23px;"></i>
                  </c:if> 
                  
                  
                  <li><a href="">${list.pro_name}</a></li>
                  
                  
               </ol>
 
            </div>

         </div>
      </section>
      <input type="hidden" value="${login_info.adr }" name="address">
      <!-- End Breadcrumbs -->
      

      <!-- ======= Portfolio Details Section ======= -->
      <section id="portfolio-details" class="portfolio-details">
         <div class="container">

            <div class="row gy-4">

               <div class="col-lg-8" style="width: 700px; height: 700px;">
                  <div class="portfolio-details-slider swiper">
                     <div class="swiper-wrapper align-items-center">

                        <div class="swiper-slide">
                           <img src="${pageContext.request.contextPath}/resources/assets/img/product/${list.pro_img1}" alt="">
                        </div>
                        <c:if test="${!empty list.pro_img2}">
                        <div class="swiper-slide">
                           <img src="${pageContext.request.contextPath}/resources/assets/img/product/${list.pro_img2}" alt="">
                        </div>
                        </c:if>
                        <c:if test="${!empty list.pro_img3}">
                        <div class="swiper-slide">
                           <img src="${pageContext.request.contextPath}/resources/assets/img/product/${list.pro_img3}" alt="">
                        </div>
                        </c:if>
                        <c:if test="${!empty list.pro_img4}">
                        <div class="swiper-slide">
                           <img src="${pageContext.request.contextPath}/resources/assets/img/product/${list.pro_img4}" alt="">
                        </div>
                        </c:if>
                        <c:if test="${!empty list.pro_img5}">
                        <div class="swiper-slide">
                           <img src="${pageContext.request.contextPath}/resources/assets/img/product/${list.pro_img5}" alt="">
                        </div>
                        </c:if>
                        

                     </div>
                     <div class="swiper-pagination"></div>
                  </div>
               </div>

               <div class="col-lg-4">

                  <div class="portfolio-info">
                     <h3>${list.pro_name}</h3>
                     <ul>
                        <li><strong>특　　징 :　</strong>${list.pro_subdesc}</li>
                        <li><strong>제품번호 :　</strong>${list.pro_serialnumber }</li>
                        <li><strong>가　　격 :　</strong><fmt:formatNumber value="${list.pro_price}" type="currency" currencySymbol="₩" /></li>   
                        <li><strong>옵　　션 :　</strong><li>
                        <c:if test="${empty list.pro_option1}">
                        <li><label for="chk_option"><span class="chk_option">선택안함</span></label>
                        <input type="radio" value="선택안함" id="chk_option" name="radioOption" checked="checked"></li>
                        </c:if>  
                        <c:if test="${!empty list.pro_option1}">             
                        <li><label for="chk_option 1"><span class="chk_option">${list.pro_option1}</span></label>
                        <input type="radio" value="${list.pro_option1}" id="chk_option 1" name="radioOption" checked="checked"></li>
                        </c:if>     
                         <c:if test="${!empty list.pro_option2}">
                        <li><label for="chk_option 2"><span class="chk_option">${list.pro_option2}</span></label>
                        <input type="radio" value="${list.pro_option2}" id="chk_option 2" name="radioOption"></li>
                        </c:if>
              
                        </c:if>
                        <c:if test="${!empty list.pro_option3}">
                        <li><label for="chk_option 3"><span class="chk_option">${list.pro_option3}</span></label>
                        <input type="radio" value="${list.pro_option3}" id="chk_option 3" name="radioOption">
                        </c:if>
                     </ul>

                        

                                
                     
                  </div>
               <input type="hidden" name="${cate_id }"/>
                  <div class="portfolio-description">
                     <h2>${list.pro_maindesctitle}</h2>
                     <pre style="font-size: 21px;">${list.pro_maindesc }</pre>
                    <input type="hidden" name="pro_price" value="${list.pro_price}">
                   <input type="hidden" name="pro_number" value="${list.pro_number}">
                   
                   
					<input type="hidden" value="${login_info.adr }" name="adr">
                   
                     <input type="button" value="장바구니" class="cateBtn btnhover" id="cateinsert" style="font-size: 20px; font-weight: bold; color : white;"><br><br>
                     <input type="button" value="바로결제하기" class="btn_buy btnhover" style="font-size: 20px; font-weight: bold; color : white;">
               <% 
               session.setAttribute("catepath", "/cateinsert.do");
               String catepath = (String)session.getAttribute("catepath");
               session.setAttribute("paypath", "/products/orders");
               String paypath = (String)session.getAttribute("paypath");
               %>
</form>            
                     
                  </div>
               </div>

         
   <!-- 주문 form toseet123 생성 -->
         <form action="/products/orders" class="order_form" method="post">
             <input type="hidden" id="userNo" name="userNo" value="${login_info.no}">
            <input type="hidden" id="userAdr" value="${login_info.adr}">
            <input type="hidden" name="radioOption" value="${list.pro_option1 }">
            <input type="hidden" name="radioOption" value="${list.pro_option2 }">
            <input type="hidden" name="radioOption" value="${list.pro_option3 }">
            <input type="hidden" name="pro_price" value="${list.pro_price}">
            <input type="hidden" name="pro_number" value="${list.pro_number}">
            <input type="hidden" name="pro_name" value="${list.pro_name}">
            <input type="hidden" name="status" value="준비중">
            
         </form>

    


            </div>

         </div>
      </section>
      <!-- End Portfolio Details Section -->
    <!-- ======= Team Section ======= -->
    <section id="team" class="team">
      <div class="container">

        <div class="section-title"><hr>
          <h2>추천 상품</h2>
          <p>${login_info.id } 회원님이 좋아하실만한 상품</p>
        </div>

        <div class="row">
<c:forEach var="randomList" items="${randomList}" begin="0" end="3">
          <div class="col-xl-3 col-lg-4 col-md-6">
            <div class="member" style="cursor: pointer;" onclick="location.href='/products/${randomList.pro_number}/${randomList.pro_name}'">
              <img src="${pageContext.request.contextPath}/resources/assets/img/product/${randomList.pro_img1}" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>${randomList.pro_name}</h4>
                  <span>${randomList.pro_maindesctitle}</span>
                  <span><fmt:formatNumber value="${randomList.pro_price}" type="currency" currencySymbol="₩" /></span>
                  <div class="social">
                    <a href="/products/${randomList.pro_number}/${randomList.pro_name}">상세보기</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
</c:forEach>


        </div>

      </div>
    </section><!-- End Team Section -->
   </main>
   <!-- End #main -->

      <jsp:include page="/WEB-INF/common/footer.jsp" />

   <a href="#"
      class="back-to-top d-flex align-items-center justify-content-center"><i
      class="bi bi-arrow-up-short"></i></a>

   <!-- Vendor JS Files -->
   <script src="${pageContext.request.contextPath}/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
   <script src="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>


   <!-- Template Main JS File -->
   <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
   
   
    <script>

   var userNo = $('#userNo').val();
   var userAdr = $('#userAdr').val();
   /* 바로구매 버튼 */
   $(".btn_buy").on("click", function(){
   if(userNo=="") {
   var login_chk = confirm('로그인이 필요한 서비스입니다. 로그인페이지로 이동하시겠습니까?');
    if(login_chk) {
        $(".cateinsert").attr("action", "/products/orders");
        $(".cateinsert").submit();
    } else {
        location.href = location.href;
    }} else {
        $(".cateinsert").attr("action", "/products/orders");
        $(".cateinsert").submit();
    }
	   
	   if(userAdr=="" && userNo!=""){
		   var adr_chk = confirm('필수입력정보를 입력해주세요.\n(간편 로그인경우 주소,휴대폰번호 정보가 부족할 수 있습니다.)');
		   if(adr_chk) {
			   location.href = '/users/mypage';
			} else {
				location.href = location.href;
			}
	   }

   });
  
   /* 장바구니 버튼 */
   $(".cateBtn").on("click", function(){	   
	   if(userNo=="") {
		   
	   var login_chk = confirm('로그인이 필요한 서비스입니다. 로그인페이지로 이동하시겠습니까?');
	   
		if(login_chk) {
			$(".cateinsert").submit();
			
		} else {
			location.href = location.href;
		}} else {
			$(".cateinsert").submit();
		}
	   
	   if(userAdr=="" && userNo!=""){
		   var adr_chk = confirm('필수입력정보를 입력해주세요.\n(간편 로그인경우 주소,휴대폰번호 정보가 부족할 수 있습니다.)');
		   if(adr_chk) {
			   location.href = '/users/mypage';
			} else {
				location.href = location.href;
			}
	   }

   });

   </script>
   
</body>

</html>