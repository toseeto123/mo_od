<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 결제 취소 도착 페이지
 
결제일시:     [[${info.approved_at}]]<br/>
주문번호:    [[${info.partner_order_id}]]<br/>
상품명:    [[${info.item_name}]]<br/>
상품수량:    [[${info.quantity}]]<br/>
총결제금액:    [[${info.amount.total}]]<br/>
취소된금액:	[[${info.approved_cancel_amount}]]<br/>
취소누계금액: 	[[${info.canceled_amount}]]<br/>
남은 취소 가능 금액: [[${info.cancel_available_amount}]]
결제방법:    [[${info.payment_method_type}]]<br/>
</body>
</html>