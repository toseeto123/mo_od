<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<style>


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
                  style="background-image: url(../resources/assets/img/slide/cate1.jpg); height: 500px;">
                  <div class="carousel-container">
                     <div class="carousel-content">
                        <h2 class="animate__animated animate__fadeInDown">
                        <c:forEach var="list" items="${list}" begin="0" end="0">
          		  <c:if test="${list.pro_categoryserial  eq 'A0' }">
                  가 구
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'A1' }">
                  가 구
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'A2' }">
                  가 구 
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'B0' }">
                  조 명
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'B1' }">
                  조 명
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'C0' }">
                  수 납
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'C1' }">
                  수 납
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
         <div class="container">

            <div class="d-flex align-items-center" >
               
               <ol>
                  <c:if test="${list.pro_categoryserial  eq 'A%' }">
                  <li><a href="/A0categoryList">가구</a>&nbsp; <i class="fa fa-angle-right" aria-hidden="true"></i></li>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'A1' }">
                  <li><a href="/A1categoryList">가구</a>&nbsp; <i class="fa fa-angle-right" aria-hidden="true"></i></li>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'A2' }">
                  <li><a href="/A3categoryList">가구</a>&nbsp; <i class="fa fa-angle-right" aria-hidden="true"></i></li>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'B0' }">
                  <li><a href="/B0categoryList">조명</a>&nbsp; <i class="fa fa-angle-right" aria-hidden="true"></i></li>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'B1' }">
                  <li><a href="/B1categoryList">조명</a>&nbsp; <i class="fa fa-angle-right" aria-hidden="true"></i></li>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'C0' }">
                  <li><a href="/C0categoryList">수납</a>&nbsp; <i class="fa fa-angle-right" aria-hidden="true"></i></li>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'C1' }">
                  <li><a href="/C1categoryList">수납</a>&nbsp; <i class="fa fa-angle-right" aria-hidden="true"></i></li>
                  </c:if>                   
               </ol>
            </div>

         </div>
      </section>
      </c:forEach>
      
      <!-- End Breadcrumbs -->

    <!-- ======= Team Section ======= -->
    <section id="team" class="team">
      <div class="container">


        <div class="row">
		<c:forEach var="list" items="${list}">
          <div class="col-xl-3 col-lg-4 col-md-6" style="margin: 0 auto; text-align: center;">
          		  <c:if test="${list.pro_categoryserial  eq 'A0' }">
          	      <b style="font-size: 30px; color: #c8936ed4;">매트리스</b>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'A1' }">
                  <b style="font-size: 30px; color: #c8936ed4;">침대 프레임</b>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'A2' }">
                  <b style="font-size: 30px; color: #c8936ed4;">소 파</b>
                  </c:if>        		  
                  <c:if test="${list.pro_categoryserial  eq 'B0' }">
                  <b style="font-size: 30px; color: #c8936ed4;">무드등</b>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'B1' }">
                  <b style="font-size: 30px; color: #c8936ed4;">스탠드 조명</b>
                  </c:if>
          		  <c:if test="${list.pro_categoryserial  eq 'C0' }">
                  <b style="font-size: 30px; color: #c8936ed4;">옷장/행거</b>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'C1' }">
                  <b style="font-size: 30px; color: #c8936ed4;">서 랍</b>
                  </c:if>
            <div class="member" style="background-color: white; cursor: pointer;" onclick="location.href='/products/category/${list.pro_categoryserial}'">  
            	<c:if test="${list.pro_categoryserial  eq 'A0' }">
                  <img src="${pageContext.request.contextPath}/resources/assets/img/category/mattress.png" alt="" class="img-fluid" style="width: 295px; height: 400px; border-radius: 7px;  box-shadow: 1px 2px 1px 1px gray;">
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'A1' }">
                  <img src="${pageContext.request.contextPath}/resources/assets/img/category/frame.png" alt="" class="img-fluid" style="width: 295px; height: 400px; border-radius: 7px; box-shadow: 1px 2px 1px 1px gray;">
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'A2' }">
                  <img src="${pageContext.request.contextPath}/resources/assets/img/category/sofa.png" alt="" class="img-fluid" style="width: 295px; height: 400px; border-radius: 7px; box-shadow: 1px 2px 1px 1px gray;">
                  </c:if>        		  
                  <c:if test="${list.pro_categoryserial  eq 'B0' }">
			      <img src="${pageContext.request.contextPath}/resources/assets/img/category/mood.png" alt="" class="img-fluid" style="width: 295px; height: 400px; border-radius: 7px; box-shadow: 1px 2px 1px 1px gray;">
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'B1' }">
                  <img src="${pageContext.request.contextPath}/resources/assets/img/category/stand.png" alt="" class="img-fluid" style="width: 295px; height: 400px; border-radius: 7px; box-shadow: 1px 2px 1px 1px gray;">
                  </c:if>
          		  <c:if test="${list.pro_categoryserial  eq 'C0' }">
                  <img src="${pageContext.request.contextPath}/resources/assets/img/category/heng.png" alt="" class="img-fluid" style="width: 295px; height: 400px; border-radius: 7px; box-shadow: 1px 2px 1px 1px gray;">
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'C1' }">
                  <img src="${pageContext.request.contextPath}/resources/assets/img/category/surab.png" alt="" class="img-fluid" style="width: 295px; height: 400px; border-radius: 7px; box-shadow: 1px 2px 1px 1px gray;">
                  </c:if>
				
              <div class="member-info" style="border-radius: 7px;">
                <div class="member-info-content">
                  <c:if test="${list.pro_categoryserial  eq 'A0' }">
                  <h4>인체공학, 감성을 더한<br> mo_od 매트리스</h4>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'A1' }">
                  <h4>장신정신,고급원목<br> mo_od 침대프레임</h4>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'A2' }">
                  <h4>크러쉬<br>네가 있던<br> sofa~</h4>
                  </c:if>        		  
                  <c:if test="${list.pro_categoryserial  eq 'B0' }">
                  <h4>작은 조명으로 분위기를 바꾸는<br> mo_od 무드등</h4>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'B1' }">
                  <h4>조명으로 공간을 바꾸는<br> mo_od 스탠드 조명</h4>
                  </c:if>
          		  <c:if test="${list.pro_categoryserial  eq 'C0' }">
                  <h4>공간활용과 감성 동시에<br> mo_od 옷장/행거</h4>
                  </c:if>
                  <c:if test="${list.pro_categoryserial  eq 'C1' }">
                  <h4>수납과 감성 동시에<br> mo_od 서 랍</h4>
                  </c:if>
                </div>
              </div>

            </div>
            
          </div>
          </c:forEach>
        </div>
      </div>
      
      
    </section>
    
   
<jsp:include page="/WEB-INF/common/footer.jsp" />
