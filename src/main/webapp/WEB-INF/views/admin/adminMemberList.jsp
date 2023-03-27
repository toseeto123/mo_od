<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chart</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>

select, option{
	height: 30px;
	font-size: 18px;
}

.tableContainer{
	height: 450px;
}

section.container{
	margin-bottom: 20px;
}
.searchParent{
	text-align: center;
}
.search{
	display: inline-block;
}
a{
	color: #c8936ed4;
}
a:hover {
	cursor: pointer;	
	color: #78E150;
}
*:focus { outline: 0; }
input[type=button]{
	color: white;
	background: #d2b48c;  
	width:100px; 
	border-radius:10px; 
	border: none;
	font-size: 20px;
}
input[type=search]{
	font-size: 18px;
}
footer{
	width: 100%;
	position: absolute;
	bottom: 0;
}
</style>
</head>

<body>
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/common/adminHeader.jsp" />
	<section id="hero" class="container" style="overflow:hidden; background: white;">
	<div class="searchParent">
			<div class="search" style="margin : 111px 0px 50px 10px;">
			<select id="searchWhat"> 
				<option value="id">아이디</option>
				<option value="name">이름</option>
			</select> <input type="search" id="search">
			</div>
			
			<input type="button" 
				id="searchBtn" value="찾기" onclick="search()">
				</div>
			<div class="tableContainer">
			<table class="table" id="table"
				style="margin-top: 2%; margin-left: 15%; width: 70%;">
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
							<td onClick="location.href = '/admin/adminMemberDetail.do/${user.no}'" scope="col">${user.no}</td>
							<td onClick="location.href = '/admin/adminMemberDetail.do/${user.no}'" scope="col">${user.id}</td>
							<td onClick="location.href = '/admin/adminMemberDetail.do/${user.no}'" scope="col">${user.name}</td>
							<td onClick="location.href = '/admin/adminMemberDetail.do/${user.no}'" scope="col">${user.phone}</td>
							<td onClick="location.href = '/admin/adminMemberDetail.do/${user.no}'" scope="col">${user.email}</td>
							<td onClick="location.href = '/admin/adminMemberDetail.do/${user.no}'" scope="col"><a
								href="/admin/adminMemberDetail.do/${user.no}">상세정보</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			<!-- End Default Table Example -->
			<div id="modulePaging"
				style="display: inline-block; position: absolute; left: 50%; transform: translateX(-50%); font-size: 20px;">
				<c:if test="${prePage!=null }">
					<a href="/admin/adminMemberList.do/${prePage}">&lt;</a>
				</c:if>

				<c:forEach items="${ pagingNo }" var="no">
					<c:choose>
						<c:when test="${selectPage == no}">
                  &nbsp;<a style="color: green"
								href="/admin/adminMemberList.do/${no}">${no}</a>&nbsp;
                  </c:when>
						<c:otherwise>
                  &nbsp;<a href="/admin/adminMemberList.do/${no}">${no}</a>&nbsp;
                  </c:otherwise>
					</c:choose>
				</c:forEach>

				<c:if test="${nextPage != null }">
					<a href="/admin/adminMemberList.do/${nextPage}">&gt;</a>
				</c:if>
			</div>
			
		<input type="hidden" value="${selectPage}" id="selectPage">
	</section>
	
	

<script type="text/javascript" src="/resources/user/js/adminMemberListSearching.js"></script>
</body>
<footer><jsp:include
					page="${pageContext.request.contextPath}/WEB-INF/common/footer.jsp" />
		</footer>
</html>
