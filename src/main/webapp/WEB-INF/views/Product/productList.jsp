<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<style>
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

@media screen and (max-width: 768px) {
    .aic a {
      padding: 0 17px; 
    }
  }

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  border: 1px solid #ddd;
  margin: 0 5px;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

</style>
<jsp:include page="/WEB-INF/common/header.jsp" />
   <section id="hero" style="height: 400px;">
      <div class="hero-container">
         <div id="heroCarousel" data-bs-interval="5000"
            class="carousel slide carousel-fade" data-bs-ride="carousel">
            <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

            <div class="carousel-inner" role="listbox">

               <!-- Slide 1 -->
               <div class="carousel-item active"
                  style="background-image: url(/resources/assets/img/slide/${categoryImage}); height: 500px;">
                  <div class="carousel-container">
                     <div class="carousel-content">
                        <h2 class="animate__animated animate__fadeInDown">
                        <c:forEach var="list" items="${list}" begin="0" end="0">
          		  <c:if test="${list.pro_categoryserial  eq 'A0' }">
                  매트리스
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'A1' }">
                  침대프레임
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'A2' }">
                  소 파
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'B0' }">
                  무드등
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'B1' }">
                  스탠드조명
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'C0' }">
                  옷장 | 행거
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'C1' }">
                  서 랍
                  </c:if>
        </c:forEach>
                        </h2>
                        <p class="animate__animated animate__fadeInUp">묻:mo_od</p>
                        <div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>

<!-- ======= Breadcrumbs ======= -->
<c:forEach var="list" items="${list}" begin="0" end="0">
      <section id="breadcrumbs" class="breadcrumbs" style="height: 70px; padding-bottom: 80px; font-size: 22px;">
         <div class="container aiccontainer">
<c:if test="${list.pro_categoryserial  eq 'A2' }">
            <div class="d-flex align-items-center aic">
				<a href="/products/A2categoryList" style="border-bottom: 2px solid #323232; font-size: 28px;">소 파</a>      
				<a href="/products/A1categoryList">침대 프레임</a>
				<a href="/products/A0categoryList">매트리스</a> 
            </div>
</c:if>
<c:if test="${list.pro_categoryserial  eq 'A1' }">
            <div class="d-flex align-items-center aic">
				<a href="/products/A2categoryList">소 파</a>      
				<a href="/products/A1categoryList" style="border-bottom: 2px solid #323232; font-size: 28px;">침대 프레임</a>
				<a href="/products/A0categoryList">매트리스</a> 
            </div>
</c:if>
<c:if test="${list.pro_categoryserial  eq 'A0' }">
            <div class="d-flex align-items-center aic">
				<a href="/products/A2categoryList">소 파</a>      
				<a href="/products/A1categoryList">침대 프레임</a>
				<a href="/products/A0categoryList" style="border-bottom: 2px solid #323232; font-size: 28px;">매트리스</a> 
            </div>
</c:if>
<c:if test="${list.pro_categoryserial  eq 'B0' }">
            <div class="d-flex align-items-center aic">
				<a href="/products/B0categoryList" style="border-bottom: 2px solid #323232; font-size: 28px;">무드등</a>      
				<a href="/products/B1categoryList">스탠드 조명</a>
            </div>
</c:if>
<c:if test="${list.pro_categoryserial  eq 'B1' }">
            <div class="d-flex align-items-center aic">
				<a href="/products/B0categoryList">무드등</a>      
				<a href="/products/B1categoryList" style="border-bottom: 2px solid #323232; font-size: 28px;">스탠드 조명</a>
            </div>
</c:if>
<c:if test="${list.pro_categoryserial  eq 'C0' }">
            <div class="d-flex align-items-center aic">
				<a href="/products/C0categoryList" style="border-bottom: 2px solid #323232; font-size: 28px;">옷장 | 행거</a>      
				<a href="/products/C1categoryList">서 랍</a>
            </div>
</c:if>
<c:if test="${list.pro_categoryserial  eq 'C1' }">
            <div class="d-flex align-items-center aic">
				<a href="/products/C0categoryList">옷장 | 행거</a>      
				<a href="/products/C1categoryList" style="border-bottom: 2px solid #323232; font-size: 28px;">서 랍</a>
            </div>
</c:if>
         </div>
      </section>
      </c:forEach>
      
      <!-- End Breadcrumbs -->

    <!-- ======= Team Section ======= -->
    <section id="team" class="team">
      <div class="container">

        <div class="section-title">       
    
        </div>

        <div class="row">
		<c:forEach var="list" items="${list}">
          <div class="col-xl-3 col-lg-4 col-md-6">
            <div class="member" style="background-color: white; cursor: pointer;" onclick="location.href='/products/${list.pro_number}/${list.pro_name}/${list.pro_img1.substring(0, list.pro_img1.lastIndexOf('.'))}'">  
 				<img src="${pageContext.request.contextPath}/resources/assets/img/product/${list.pro_img1}" alt="${list.pro_name}" title="${list.pro_maindesc}" class="img-fluid" style="width: 306px; height: 306px;">
 				
              <div class="member-info">
                <div class="member-info-content">
                  <h4>${list.pro_name}</h4>
                  <span><fmt:formatNumber value="${list.pro_price}" type="currency" currencySymbol="₩" /></span>
                  <div class="social">
                  
                    <a href="/products/${list.pro_number}/${list.pro_name}/${list.pro_img1.substring(0, list.pro_img1.lastIndexOf('.'))}">${list.pro_maindesctitle}</a>
                  </div>
                </div>
              </div>
            </div>
            
          </div>
          </c:forEach>


        </div>

      </div>
    </section><!-- End Team Section -->
<section>
<c:forEach var="list" items="${list}">

<!-- A0번 카테고리 -->
                  <c:if test="${list.pro_categoryserial  eq 'A0' }">
                  
                  <div style="display:inline-block;  position:absolute; left:50%; transform:translateX(-50%); font-size:20px;" class="pagination">
                  
                  
                  <c:if test="${prePage!=null }">
                  <a href="/products/A0categoryList/${prePage}">&lt;</a>
                  </c:if>
                  
                  <c:forEach items="${ pagingNo }" var="no">
                  <c:choose>
                  <c:when test="${selectPage == no}">
                  &nbsp;<a style="background: lightgray;" href="/products/A0categoryList/${no}">${no}</a>&nbsp;
                  </c:when>
                  <c:otherwise>
                  &nbsp;<a href="/products/A0categoryList/${no}">${no}</a>&nbsp;
                  </c:otherwise>
                  </c:choose>
                  </c:forEach>

                  <c:if test="${nextPage != null }">
                  <a href="/products/A0categoryList/${nextPage}">&gt;</a>
                  </c:if>
                  </div>
                  </c:if>
                  
                  
                  
<!-- A1번 카테고리 -->                  
                  <c:if test="${list.pro_categoryserial  eq 'A1' }">
                  
                  <div style="display:inline-block;  position:absolute; left:50%; transform:translateX(-50%); font-size:20px;" class="pagination">
                  
                  
                  <c:if test="${prePage!=null }">
                  <a href="/products/A1categoryList/${prePage}">&lt;</a>
                  </c:if>
                  
                  <c:forEach items="${ pagingNo }" var="no">
                  <c:choose>
                  <c:when test="${selectPage == no}">
                  &nbsp;<a style="background: lightgray;" href="/products/A1categoryList/${no}">${no}</a>&nbsp;
                  </c:when>
                  <c:otherwise>
                  &nbsp;<a href="/products/A1categoryList/${no}">${no}</a>&nbsp;
                  </c:otherwise>
                  </c:choose>
                  </c:forEach>

                  <c:if test="${nextPage != null }">
                  <a href="/products/A1categoryList/${nextPage}">&gt;</a>
                  </c:if>
                  </div>
                  
                  </c:if>
                  
                  
<!-- A2번 카테고리 -->                  
                  <c:if test="${list.pro_categoryserial  eq 'A2' }">
                  
                  <div style="display:inline-block;  position:absolute; left:50%; transform:translateX(-50%); font-size:20px;" class="pagination">
                  
                  
                  <c:if test="${prePage!=null }">
                  <a href="/products/A2categoryList/${prePage}">&lt;</a>
                  </c:if>
                  
                  <c:forEach items="${ pagingNo }" var="no">
                  <c:choose>
                  <c:when test="${selectPage == no}">
                  &nbsp;<a style="background: lightgray;" href="/products/A2categoryList/${no}">${no}</a>&nbsp;
                  </c:when>
                  <c:otherwise>
                  &nbsp;<a href="/products/A2categoryList/${no}">${no}</a>&nbsp;
                  </c:otherwise>
                  </c:choose>
                  </c:forEach>

                  <c:if test="${nextPage != null }">
                  <a href="/products/A2categoryList/${nextPage}">&gt;</a>
                  </c:if>
                  </div>
                  
                  </c:if>
                  
<!-- B0번 카테고리 -->                  
                  <c:if test="${list.pro_categoryserial  eq 'B0' }">
                  
                  <div style="display:inline-block;  position:absolute; left:50%; transform:translateX(-50%); font-size:20px;" class="pagination">
                  
                  
                  <c:if test="${prePage!=null }">
                  <a href="/products/B0categoryList/${prePage}">&lt;</a>
                  </c:if>
                  
                  <c:forEach items="${ pagingNo }" var="no">
                  <c:choose>
                  <c:when test="${selectPage == no}">
                  &nbsp;<a style="background: lightgray;" href="/products/B0categoryList/${no}">${no}</a>&nbsp;
                  </c:when>
                  <c:otherwise>
                  &nbsp;<a href="/products/B0categoryList/${no}">${no}</a>&nbsp;
                  </c:otherwise>
                  </c:choose>
                  </c:forEach>

                  <c:if test="${nextPage != null }">
                  <a href="/products/B0categoryList/${nextPage}">&gt;</a>
                  </c:if>
                  </div>
                  
                  </c:if>                  
                  

<!-- B1번 카테고리 -->                  
                  <c:if test="${list.pro_categoryserial  eq 'B1' }">
                  
                  <div style="display:inline-block;  position:absolute; left:50%; transform:translateX(-50%); font-size:20px;" class="pagination">
                  
                  
                  <c:if test="${prePage!=null }">
                  <a href="/products/B1categoryList/${prePage}">&lt;</a>
                  </c:if>
                  
                  <c:forEach items="${ pagingNo }" var="no">
                  <c:choose>
                  <c:when test="${selectPage == no}">
                  &nbsp;<a style="background: lightgray;" href="/products/B1categoryList/${no}">${no}</a>&nbsp;
                  </c:when>
                  <c:otherwise>
                  &nbsp;<a href="/products/B1categoryList/${no}">${no}</a>&nbsp;
                  </c:otherwise>
                  </c:choose>
                  </c:forEach>

                  <c:if test="${nextPage != null }">
                  <a href="/products/B1categoryList/${nextPage}">&gt;</a>
                  </c:if>
                  </div>
                  
                  </c:if>

<!-- C0번 카테고리 -->                  
                  <c:if test="${list.pro_categoryserial  eq 'C0' }">
                  
                  <div style="display:inline-block;  position:absolute; left:50%; transform:translateX(-50%); font-size:20px;" class="pagination">
                  
                  
                  <c:if test="${prePage!=null }">
                  <a href="/products/C0categoryList/${prePage}">&lt;</a>
                  </c:if>
                  
                  <c:forEach items="${ pagingNo }" var="no">
                  <c:choose>
                  <c:when test="${selectPage == no}">
                  &nbsp;<a style="background: lightgray;" href="/products/C0categoryList/${no}">${no}</a>&nbsp;
                  </c:when>
                  <c:otherwise>
                  &nbsp;<a href="/products/C0categoryList/${no}">${no}</a>&nbsp;
                  </c:otherwise>
                  </c:choose>
                  </c:forEach>

                  <c:if test="${nextPage != null }">
                  <a href="/products/C0categoryList/${nextPage}">&gt;</a>
                  </c:if>
                  </div>
                  
                  </c:if>

<!-- C1번 카테고리 -->                  
                  <c:if test="${list.pro_categoryserial  eq 'C1' }">
                  
                  <div style="display:inline-block;  position:absolute; left:50%; transform:translateX(-50%); font-size:20px;" class="pagination">
                  
                  
                  <c:if test="${prePage!=null }">
                  <a href="/products/C1categoryList/${prePage}">&lt;</a>
                  </c:if>
                  
                  <c:forEach items="${ pagingNo }" var="no">
                  <c:choose>
                  <c:when test="${selectPage == no}">
                  &nbsp;<a style="background: lightgray;" href="/products/C1categoryList/${no}">${no}</a>&nbsp;
                  </c:when>
                  <c:otherwise>
                  &nbsp;<a href="/products/C1categoryList/${no}">${no}</a>&nbsp;
                  </c:otherwise>
                  </c:choose>
                  </c:forEach>

                  <c:if test="${nextPage != null }">
                  <a href="/products/C1categoryList/${nextPage}">&gt;</a>
                  </c:if>
                  </div>
                  
                  </c:if>

                  
  </c:forEach>
</section>
<jsp:include page="/WEB-INF/common/footer.jsp" />
