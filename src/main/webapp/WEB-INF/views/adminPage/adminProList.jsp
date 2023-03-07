<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                                 <th scope="col">상품일련번호</th>
                                 <th scope="col">카테고리</th>
                                 <th scope="col">상품명</th>
                                 <th scope="col">가격</th>
                                 <th scope="col">품절여부(판매여부)</th>
                              </tr>
                           </thead>
                           <tbody>

                              <c:forEach var="list" items="${list}">
                              <tr> 
                                 <th scope="row">${list.pro_serialnumber}</th>
                                 <td>${list.pro_categoryserial}</td>
                                 <td><a href="adminProDetail?pro_number=${list.pro_number}">${list.pro_name}</a></td>
                                 <td>${list.pro_price}</td>
                                 <td>${list.pro_soldout}</td>
                              </tr>
                              </c:forEach>
                           </tbody>
                        </table>

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