<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html style="background-color:#f5f6f7;">
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<style>
select, option{
	height: 30px;
	font-size: 18px;
}

#hero{
	height: auto;
}
.searchParent{
	text-align: center;
	margin: 170px 0 40px;
}
.search{
	display: inline-block;
}
a{
	color: #323232;
	cursor: pointer;
}
a:hover {
	cursor: pointer;	
	color: #323232;
}
*:focus { outline: 0; }
input[type=button]{
	color: white;
	background: #323232;  
	width:100px; 
	border: none;
	font-size: 20px;
	border-radius:10px; 
}
input[type=search]{
	font-size: 18px;
}
section{
	padding: 0;
	margin: 0;
	text-align: center;
}
#tables{
	display: inline-block;
	padding: 0;
	margin: 0;
}
#table{
	width: 1200px;
	text-align: left;
}
#modulePaging{
	display: inline-block;
	padding: 30px 0;
}

.footer{
	position: absolute;
	bottom: 0;
	width: 100%;
}

</style>
</head>

<body style="background-color:#f5f6f7;">
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/common/adminHeader.jsp" />
			
			<div class="searchParent">
			<div class="search">
			<select id="searchWhat" style="font-size: 18px;">
				<c:choose>
					<c:when test="${searchWhat == 'name'}">
						<option value="id">아이디</option>
						<option value="name" selected>이름</option>
					</c:when>
					<c:otherwise>
						<option value="id">아이디</option>
						<option value="name">이름</option>
					</c:otherwise>
				</c:choose>
			</select> <input type="search" id="search" value="${search}">
			</div>
			
			<input type="button" 
				id="searchBtn" value="찾기" onclick="search()">
				</div>
			
			<section style="padding: 0;
	margin: 0;">
	<div id="tables">
			<table class="table" id="table"
				>
				<thead>

					<tr>
						<th scope="col" style="width: 10%;">회원번호</th>
						<th scope="col" style="width: 10%;">아이디</th>
						<th scope="col" style="width: 20%;">이름</th>
						<th scope="col" style="width: 20%;">연락처</th>
						<th scope="col">이메일</th>
						<th scope="col">상세정보</th>
					</tr>

				</thead>

				<tbody id="tbody" style="font-weight: normal;">
					<c:forEach var="user" items="${userList}">
						<tr>
							<td scope="col">${user.no}</td>
							<td scope="col">${user.id}</td>
							<td scope="col">${user.name}</td>
							<td scope="col">${user.phone}</td>
							<td scope="col">${user.email}</td>
							<td onClick="location.href = '/admin/adminMemberDetail/${user.no}'" scope="col"><a style="color: #323232;"
								href="/admin/adminMemberDetail/${user.no}">상세정보</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			</div>
			</section>
			<!-- End Default Table Example -->
			<section style="padding: 0;
	margin: 0;
	text-align: center;">
			<div id="modulePaging" style="display: inline-block;">
				<c:if test="${prePage!=null }">
				<c:choose>
				<c:when test="${search != null}">
				<a style="color: #323232;" href="/admin/adminMemberList/${prePage}/${searchWhat}/${search}">&lt;</a>
				</c:when>
				<c:otherwise>
					<a style="color: #323232;" href="/admin/adminMemberList/${prePage}">&lt;</a>
					</c:otherwise>
					</c:choose>
				</c:if>

				<c:forEach items="${ pagingNo }" var="no">
				<c:choose>
					<c:when test="${search != null}">
					<c:choose>
						<c:when test="${selectPage == no}">
						
                  &nbsp;<a style="color: green"
								href="/admin/adminMemberList/${no}/${searchWhat}/${search}">${no}</a>&nbsp;
                  </c:when>
						<c:otherwise>
                  &nbsp;<a style="color: #323232;" href="/admin/adminMemberList/${no}/${searchWhat}/${search}">${no}</a>&nbsp;
                  </c:otherwise>
					</c:choose>
					</c:when>
					<c:otherwise>
					<c:choose>
						<c:when test="${selectPage == no}">
						
                  &nbsp;<a style="color: green"
								href="/admin/adminMemberList/${no}">${no}</a>&nbsp;
                  </c:when>
						<c:otherwise>
                  &nbsp;<a style="color: #323232;" href="/admin/adminMemberList/${no}">${no}</a>&nbsp;
                  </c:otherwise>
					</c:choose>
					</c:otherwise>
				
				
					
					</c:choose>
				</c:forEach>

				<c:if test="${nextPage != null }">
				<c:choose>
				<c:when test="${search != null}">
				<a style="color: #323232;" href="/admin/adminMemberList/${nextPage}/${searchWhat}/${search}">&gt;</a>
				</c:when>
					<c:otherwise>
					<a style="color: #323232;" href="/admin/adminMemberList/${nextPage}">&gt;</a>
					</c:otherwise>
				</c:choose>
					
				</c:if>
			</div>
			</section>
		<input type="hidden" value="${selectPage}" id="selectPage">
	
	<footer class="footer"><jsp:include
					page="${pageContext.request.contextPath}/WEB-INF/common/footer.jsp" />
		</footer>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript" src="/resources/user/js/adminMemberListSearching.js"></script>
<script defer>
var footer = document.querySelector('#modulePaging');
var footerReal = document.querySelector('footer');
var footerRect = footer.getBoundingClientRect();
var footerRealRect = footerReal.getBoundingClientRect();
if (footerRect.top + footerRect.height >= footerRealRect.top) {
	footerReal.classList.remove("footer");
}	
</script>
</body>

</html>
