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
<div id="recent-products" style="position: fixed; right: 2%; bottom: 180px; z-index: 999; background: rgba(211, 211, 211, 0.1); padding: 20px; border-radius: 5px;">
  <h4 style="text-align: center;">최근 본 상품</h4><hr style="color: rgba(211, 211, 211, 1);">

    <c:forEach var="product" items="${sessionScope.recentlyViewedProducts}">
      <a href="/products/${product.proNumber}/${product.proName}" style="margin: 5px; display: flex;
  align-items: center;
  height: 100%;">${product.proName}</a>
    </c:forEach>

</div>
</c:if>