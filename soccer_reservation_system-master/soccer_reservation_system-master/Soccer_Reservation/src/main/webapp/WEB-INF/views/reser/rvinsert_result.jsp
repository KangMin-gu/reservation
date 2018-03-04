<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Soccer_Reservation</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<link href="${pageContext.request.contextPath}/resources/css/styles.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/demo.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/testimonial.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link href='http://fonts.googleapis.com/css?family=Poiret+One'
	rel='stylesheet' type='text/css'>
<!-- 현재 페이지에 적용할 style.css 파일을 여기에서 로딩한다 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/playlist.css" />
</head>
<body>
 <%@ include file="../include/header.jsp" %>

<div class="container">
	<div class="row">
		<div class="divider col-sm-12 col-xs-12 col-md-12">
			<div class="header-text">
				Reservation<span>Success </span>
				<div class="container header-start text-center"></div>
			</div>
		</div>
	</div>
</div>
	<!-- ================ Main ============= -->
<div style="margin-top: 30px;" class="container">
		<div class="row">
			<div class="col-md-offset-2 col-md-8 text-center">
				<div  class="panel">
					<div  class="panel-body" style="background-color: #def0f1; ">
					<div style="float:center;">	
						<table style="margin-right:200px;" class="table table-bordered text-center">
							<tr>
								<c:choose>
									<c:when test="${not empty order.field_m_id }">
									<th colspan="3" style="text-align:center; font-size: 30px;"><strong>${order.field_m_id }</strong>님의 예약이 완료 되었습니다.</th><br>									
									</c:when>
									<c:when test="${not empty order.field_a_id }">
										<th colspan="3" style="text-align:center; font-size: 30px;"><strong>${order.field_a_id }</strong>님의 예약이 완료 되었습니다.</th><br />										
									</c:when>
									<c:otherwise>
										<th colspan="3" style="text-align:center; font-size: 30px;"><strong>${order.field_n_id }</strong>님의 예약이 완료 되었습니다.</th><br />										
									</c:otherwise>
								</c:choose>
							</tr>
							<tr>
								<c:choose>
									<c:when test="${not empty order.field_m_tname }">
										<th>팀 이름</th>
										<td>${order.field_m_tname }</td>
									</c:when>
									<c:when test="${not empty order.field_a_tname }">
										<th>팀 이름</th>
										<td>${order.field_a_tname }</td>
									</c:when>
									<c:otherwise>
										<th>팀 이름</th>
										<td>${order.field_n_tname }</td>
									</c:otherwise>
								</c:choose>
							</tr>
							<tr>
								<th>예약한 운동장</th>
								<td>${order.field_name }</td>
							</tr>
							<tr>
								<th>예약날짜</th>
								<td>${order.field_date }</td>
							</tr>
							<tr>
								<c:choose>
									<c:when test="${not empty order.field_m_time }">
										<th>예약시간대</th>
										<td>${order.field_m_time }</td>
									</c:when>
									<c:when test="${not empty order.field_a_time }">
										<th>예약시간대</th>
										<td>${order.field_a_time }</td>
									</c:when>
									<c:otherwise>
										<th>예약시간대</th>
										<td>${order.field_n_time }</td>
									</c:otherwise>
								</c:choose>
							</tr>
							<tr>
								<c:choose>
									<c:when test="${not empty order.field_m_phone }">
										<th>연락처</th>
										<td>${order.field_m_phone }</td>
									</c:when>
									<c:when test="${not empty order.field_a_phone }">
										<th>연락처</th>
										<td>${order.field_a_phone }</td>
									</c:when>
									<c:otherwise>
										<th>연락처</th>
										<td>${order.field_n_phone }</td>
									</c:otherwise>
								</c:choose>
							</tr>
							<tr>
								<c:choose>
									<c:when test="${not empty order.field_m_teamNP }">
										<th>예약 인원</th>
										<td>${order.field_m_teamNP }</td>
									</c:when>
									<c:when test="${not empty order.field_a_teamNP }">
										<th>예약 인원</th>
										<td>${order.field_a_teamNP }</td>
									</c:when>
									<c:otherwise>
										<th>예약 인원</th>
										<td>${order.field_n_teamNP }</td>
									</c:otherwise>
								</c:choose>
							</tr>
							<tr>
								<c:choose>
									<c:when test="${not empty order.field_m_etc }">
										<th>기타 사항</th>
										<td>${order.field_m_etc }</td>
									</c:when>
									<c:when test="${not empty order.field_a_etc }">
										<th>기타 사항</th>
										<td>${order.field_a_etc }</td>
									</c:when>
									<c:otherwise>
										<th>기타 사항</th>
										<td>${order.field_n_etc }</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</table>
						<a class="btn btn-primary" style="width: 200px;" href="${pageContext.request.contextPath}/">확인</a>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /.row -->
</div><!-- /.container -->
<!-- ============FOOTER============= -->
	
 <%@ include file="../include/footer.jsp" %>
  <%@ include file="../include/footer_script.jsp" %>
</body>
</html>