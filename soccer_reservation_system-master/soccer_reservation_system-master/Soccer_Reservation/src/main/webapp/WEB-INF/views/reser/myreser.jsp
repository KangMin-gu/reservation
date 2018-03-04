<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Soccer_Reservation</title>
 <%@ include file="../include/header_script.jsp" %>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/playlist.css" />
</head>
<body>
 <%@ include file="../include/header.jsp" %>
<!-- ============TOP============= -->
</head>
<body>
<div class="container">
	<div class="row">
		<div class="divider col-sm-12 col-xs-12 col-md-12">
			<div class="header-text">
				My<span>Reservation</span>
				<div class="container header-start text-center"></div>
			</div>
		</div>
	</div>
</div>
<!-- ================ Main ============= -->
<div style="margin-top: 30px; margin-right:400px;" class="container">
		<div class="row">
			<div class="col-md-offset-2 col-md-8 text-center">
				<div  class="panel" style="width:150%;">
					<div  class="panel-body" style="background-color: #def0f1;">
				
						<h3>예약목록</h3>
						<table style="margin-right:200px;" class="table table-hover">
						<thead>
							<tr>
								<th>예약 번호</th>
								<th>운동장 이름</th>
								<th>예약 날짜</th>
								<th>신청시간</th>
								<th>팀 이름</th>
								<th>이용인원</th>
								<th>연락처</th>
								<th>기타 요청 사항</th>
								<th>취소</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="tmp" items="${list }">
							<tr>	
							<c:if test="${tmp.field_m_id eq id }">
										<td>${tmp.num }</td>
										<td>${tmp.field_name }</td>
										<td>${tmp.field_date }</td>
										<td>${tmp.field_m_time }</td>
										<td>${tmp.field_m_tname }</td>
										<td>${tmp.field_m_teamNP }</td>
										<td>${tmp.field_m_phone }</td>
										<td>${tmp.field_m_etc }</td>
										<c:choose>
											<c:when test="${tmp.booldate eq true }">
												<td> 취소기한 초과 </td>
											</c:when>
											<c:otherwise>
												<td><a class="btn btn-danger btn-sm" href="rvdelete.do?fieldname=${tmp.field_name}&fielddate=${tmp.field_date}&fieldmornig=${tmp.field_m_time}&fieldafternoon=${tmp.field_a_time}&fieldnight=${tmp.field_n_time}">예약취소</a></td>
											</c:otherwise>
										</c:choose>
										
							</c:if>
							</tr>
							<tr>
									<c:if test="${tmp.field_a_id eq id }">
										<td>${tmp.num }</td>
										<td>${tmp.field_name }</td>
										<td>${tmp.field_date }</td>
										<td>${tmp.field_a_time }</td>
										<td>${tmp.field_a_tname }</td>
										<td>${tmp.field_a_teamNP }</td>
										<td>${tmp.field_a_phone }</td>
										<td>${tmp.field_a_etc }</td>
										<c:choose>
											<c:when test="${tmp.booldate eq true }">
												<td> 취소기한 초과 </td>
											</c:when>
											<c:otherwise>
												<td><a class="btn btn-danger btn-sm" href="rvdelete.do?fieldname=${tmp.field_name}&fielddate=${tmp.field_date}&fieldmornig=${tmp.field_m_time}&fieldafternoon=${tmp.field_a_time}&fieldnight=${tmp.field_n_time}">예약취소</a></td>
											</c:otherwise>
										</c:choose>
							</c:if>
							</tr>
							<tr>
									<c:if test="${tmp.field_n_id eq id }">
										<td>${tmp.num }</td>
										<td>${tmp.field_name }</td>
										<td>${tmp.field_date }</td>
										<td>${tmp.field_n_time }</td>
										<td>${tmp.field_n_tname }</td>
										<td>${tmp.field_n_teamNP }</td>
										<td>${tmp.field_n_phone }</td>
										<td>${tmp.field_n_etc }</td>
										<c:choose>
											<c:when test="${tmp.booldate eq true }">
												<td> 취소기한 초과 </td>
											</c:when>
											<c:otherwise>
												<td><a class="btn btn-danger btn-sm" href="rvdelete.do?fieldname=${tmp.field_name}&fielddate=${tmp.field_date}&fieldmornig=${tmp.field_m_time}&fieldafternoon=${tmp.field_a_time}&fieldnight=${tmp.field_n_time}">예약취소</a></td>
											</c:otherwise>
										</c:choose>
							</c:if>
							</tr>
								</c:forEach>
							</tbody>
						</table>	
						<a class="btn btn-default btn-sm pull-right" href="${pageContext.request.contextPath}/">홈 바로가기</a>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /.row -->

 <%@ include file="../include/footer.jsp" %>
 <%@ include file="../include/footer_script.jsp" %>

</body>
</html>