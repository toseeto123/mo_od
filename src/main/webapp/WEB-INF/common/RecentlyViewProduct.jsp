<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
  @media (max-width: 767px) {
    div#recent-products {
      display: none;
    }
  }
  
</style>
<c:if test="${not empty sessionScope.recentlyViewedProducts}">
<div id="recent-products" style="position: fixed; right: 2%; bottom: 180px; z-index: 999; background: rgba(211, 211, 211, 0.3); padding: 30px; border-radius: 5px;">
  <h4 style="text-align: center; color:#c8936ed4;">최근 본 상품</h4><hr style="color: rgba(211, 211, 211, 1);">

    <c:forEach var="product" items="${sessionScope.recentlyViewedProducts}">
      <a href="/products/${product.proNumber}/${product.proName}/${product.proIMG}" style="margin: 5px; display: flex;
  align-items: center;
  height: 100%;">
<%--   <span style="margin-right: 10px;">${product.proName }</span> --%>
  <img src="/resources/assets/img/product/${product.proIMG }" width="120px;" height="120px;">
  </a>
    </c:forEach>

</div>
</c:if>