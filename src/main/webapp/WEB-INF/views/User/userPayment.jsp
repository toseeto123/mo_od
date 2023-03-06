<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
        var IMP = window.IMP; 
        IMP.init("imp40061745"); 
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
    
        function requestPay() {
            IMP.request_pay({
                pg : 'nice.nictest00m',  //nicepay=nice.id , kcp=kcp.id, kginicis=html5_inicis.id
                pay_method : 'card',
                merchant_uid: "IMP"+makeMerchantUid, 
                name : '당근 10kg',
                amount : 1004,
                buyer_email : 'Iamport@chai.finance',
                buyer_name : '포트원 기술지원팀',
                buyer_tel : '010-1234-5678',
                buyer_addr : '서울특별시 강남구 삼성동',
                buyer_postcode : '123-456'
                
            }, function (rsp) { // callback
                if (rsp.success) {
                    console.log(rsp);
                } else {
                    console.log(rsp);
                }
            });
        }
    </script>
<meta charset="UTF-8">
<title>회원결제</title>
</head>
<body>
<jsp:include page="/WEB-INF/common/header.jsp" />
<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">

				<div class="d-flex align-items-center">
					
					<ol>
						<li><a href="#">장바구니 ></a>&nbsp;<i class="fa fa-angle-right" aria-hidden="true"></i></li>
						
						<li><a href="#">주문 내역</a></li>
						
					</ol>
				</div>

			</div>
		</section>
		<!-- End Breadcrumbs -->
		
		<!-- ======= Team Section ======= -->
    <section id="team" class="team">
      <div class="container">
<!-- 회원 정보 -->
				<div class="member_info_div">
					<table class="table_text_align_center memberInfo_table">
						<tbody>
							<tr>
								<th style="width: 25%;">주문자</th>
								<td style="width: *">회원정보노출구역 ${memberInfo.memberName} | ${memberInfo.memberMail}</td>
							</tr>
						</tbody>
					</table>
				</div>		
<!-- 상품 정보 -->
				<div class="orderGoods_div">
					<!-- 상품 종류 -->
					<div class="goods_kind_div">
						주문상품 <span class="goods_kind_div_kind"></span>종류 <span class="goods_kind_div_count"></span>갯수
					</div>
					<!-- 상품 테이블 -->
					<table class="goods_subject_table">
						<colgroup>
							<col width="15%">
							<col width="45%">
							<col width="40%">
						</colgroup>
						<tbody>
							<tr>
								<th>이미지</th>
								<th>상품 정보</th>
								<th>판매가</th>
							</tr>
						</tbody>
					</table>
					<table class="goods_table">
						<colgroup>
							<col width="15%">
							<col width="45%">
							<col width="40%">
						</colgroup>					
						<tbody>
							<c:forEach items="${orderList}" var="ol">
								<tr>
									<td>
										<div class="image_wrap" data-bookid="${ol.imageList[0].bookId}" data-path="${ol.imageList[0].uploadPath}" data-uuid="${ol.imageList[0].uuid}" data-filename="${ol.imageList[0].fileName}">
											<img>
										</div>
									</td>
									<td>${ol.bookName}</td>
									<td class="goods_table_price_td">
										<fmt:formatNumber value="${ol.salePrice}" pattern="#,### 원" /> | 수량 ${ol.bookCount}개
										<br><fmt:formatNumber value="${ol.totalPrice}" pattern="#,### 원" />
										<br>[<fmt:formatNumber value="${ol.totalPoint}" pattern="#,### 원" />P]
										<input type="hidden" class="individual_bookPrice_input" value="${ol.bookPrice}">
										<input type="hidden" class="individual_salePrice_input" value="${ol.salePrice}">
										<input type="hidden" class="individual_bookCount_input" value="${ol.bookCount}">
										<input type="hidden" class="individual_totalPrice_input" value="${ol.salePrice * ol.bookCount}">
										<input type="hidden" class="individual_point_input" value="${ol.point}">
										<input type="hidden" class="individual_totalPoint_input" value="${ol.totalPoint}">
										<input type="hidden" class="individual_bookId_input" value="${ol.bookId}">
									</td>
								</tr>							
							</c:forEach>

						</tbody>
					</table>
				</div>		
<!-- 주문 종합 정보 -->
				<div class="total_info_div">
					<!-- 가격 종합 정보 -->
					<div class="total_info_price_div">
						<ul>
							<li>
								<span class="price_span_label">상품 금액</span>
								<span class="totalPrice_span">100000</span>원
							</li>
							<li>
								<span class="price_span_label">수량</span>
								<span class="delivery_price_span">1</span>
							</li>
							<li class="price_total_li">
								<strong class="price_span_label total_price_label">최종 결제 금액</strong>
								<strong class="strong_red">
									<span class="total_price_red finalTotalPrice_span">
										100000
									</span>원
								</strong>
							</li>
						</ul>
					</div>
					<!-- 버튼 영역 -->
					<div class="total_info_btn_div">
						<a class="order_btn" onclick="requestPay()">결제하기</a>
						<a class="reset_btn" onclick="reset()">결제취소</a>
					</div>
				</div>			
		</div>	
	</section>		
<!-- 주문 요청 form -->
			<form class="order_form" action="/order" method="post">
				<!-- 주문자 회원번호 -->
				<input name="memberId" value="${memberInfo.memberId}" type="hidden">
				<!-- 주소록 & 받는이-->
				<input name="addressee" type="hidden">
				<input name="memberAddr1" type="hidden">
				<input name="memberAddr2" type="hidden">
				<input name="memberAddr3" type="hidden">
			</form>
<jsp:include page="/WEB-INF/common/footer.jsp" />
</body>
</html>