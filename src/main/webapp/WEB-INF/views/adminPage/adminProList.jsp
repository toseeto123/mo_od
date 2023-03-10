<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <jsp:include page="../../common/adminHeader.jsp" />
      <section id="breadcrumbs" class="breadcrumbs">
         <div class="container">
         <div class="d-flex align-items-center">
               <strong>상품관리 > 상품목록/수정</<strong>
            </div>
         </div>
      </section>
   <!-- ======= Hero Section ======= -->
   <section id="hero" style="background: white;">
      <div class="hero-container">
         <div id="heroCarousel" data-bs-interval="5000"
            class="carousel slide carousel-fade" data-bs-ride="carousel"
            style="background: white;">
            <div class="carousel-inner">
               <div class="carousel-item active">
                  <div class="carousel-container" style="background: white;">
                     <div>

                        <table class="table">
                           <thead>
                              <tr>
                              <th scope="col">이미지</th>
                                 <th scope="col">카테고리</th>
                                 <th scope="col">상품일련번호</th>
                                 <th scope="col">상품명</th>
                                 <th scope="col">가격</th>
                                 <th scope="col">품절여부(판매여부)</th>
                              </tr>
                           </thead>
                           <tbody>

                              <c:forEach var="list" items="${list}">
                              <tr> 
                   <td><img alt="" src="/resources/assets/img/product/${list.pro_img1}" style="width: 60px; height: 60px;"></td>              
                                 
                  <td>                 
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
                  </td>
                  <td>${list.pro_categoryserial}${list.pro_number}</td>
                                 
                                 <td><a href="/adminProDetail?pro_number=${list.pro_number}">${list.pro_name}</a></td>
                                 <td><fmt:formatNumber value="${list.pro_price}" type="currency" currencySymbol="₩" /></td>
                                 <c:if test="${list.pro_soldout eq 0}">
                                 <td>판매중</td>
                                 </c:if>
                                 <c:if test="${list.pro_soldout eq 1}">
                                 <td>판매중지</td>
                                 </c:if>
                              </tr>
                              </c:forEach>
                           </tbody>
                        </table>
                  <div style="display:inline-block;  position:absolute; left:50%; transform:translateX(-50%); font-size:20px;"><a href="#">&lt;</a>
                  <c:forEach items="${ pagingNo }" var="no">
                  &nbsp;<a href="/adminProList.do/${no}">${no}</a>&nbsp;
                  </c:forEach>
                  <a href="#">&gt;</a></div>
                        <div></div>
                     </div>
                  </div>
               </div>

            </div>
         </div>
      </div>
   </section>
   <!-- End Hero -->


   <jsp:include page="../../common/footer.jsp" />
</body>

</html>