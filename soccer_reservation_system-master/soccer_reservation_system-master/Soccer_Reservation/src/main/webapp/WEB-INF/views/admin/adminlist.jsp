<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Soccer_Reservation</title>
 <%@ include file="../include/header_script.jsp" %>
</head>
<body>
 <%@ include file="../include/header.jsp" %>

<div class="container">
	<div class="row">
		<div class="divider col-sm-12 col-xs-12 col-md-12">
			<div class="header-text">
				Admin<span>User List</span>
				<div class="container header-start text-center"></div>
			</div>
		</div>
	</div>
</div>
	<!-- ================ Main ============= -->
<div class="container">
	<div class="row">
		<div class=" col-md-12 text-center">
			<div class="panel">
				<div class="panel-body"  style="background-color: #def0f1;">
					
						<h3>회원목록</h3>
						<table class="table table-hover text-center">
							<thead>
								<tr>
									<th>회원 아이디</th>
									<th>회원 이름</th>
									<th>회원 이메일</th>
									<th>회원 주소</th>
									<th>회원 전화번호</th>
									<th>회원정보수정</th>
									<th>회원정보 삭제</th>
									<th>회원 예약정보</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach  var="tmp" items="${list }">
									<tr>
										<td>${tmp.id }</td>
										<td>${tmp.name }</td>
										<td>${tmp.email }</td>
										<td>${tmp.addr }${tmp.detailaddr }</td>
										<td>${tmp.phone }</td>
										<td><a class="btn btn-default btn-sm" href="adminupdateform.do?id=${tmp.id }">정보수정</a></td>
										<c:choose>
											<c:when test="${tmp.id eq 'admin' }">
											<td><strong class="btn btn-danger btn-sm">삭제불가</strong></td>
											</c:when>
											<c:otherwise>
											<td><a class="btn btn-warning btn-sm" href="admindel.do?id=${tmp.id}">정보삭제</a></td>
											</c:otherwise>
										</c:choose>
										<td><a class="btn btn-default btn-sm" href="adminrvlist.do?userid=${tmp.id }">예약정보관리</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<a class="btn btn-default pull-right" href="${pageContext.request.contextPath}/admin/adminpage.do">관리자메뉴</a>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /.row -->
 <%@ include file="../include/footer.jsp" %>
 <%@ include file="../include/footer_script.jsp" %>

<script>

</script>
</html>