<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>admin/reservation.jsp</title>
<title>admin/adminlist.jsp</title>
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
<div class="header container">
<!-- 세션에 id의 유무에따라 보여지는 loginView -->
<c:choose>
	<c:when test="${not empty id }">
		<div>
			<ul id="loginUl">
				<li class="loginLi"><a
					href="${pageContext.request.contextPath}/users/info.do">My
						info</a></li>
				<li class="loginLi"><a
					href="${pageContext.request.contextPath}/users/logout.do">Logout</a></li>
			</ul>
		</div>
	</c:when>
	<c:otherwise>
		<div>
			<ul id="loginUl">
				<li class="loginLi"><a href="users/loginform.do">Login</a></li>
				<li class="loginLi"><a href="users/signupform.do">SignUp</a></li>
			</ul>
		</div>
	</c:otherwise>
</c:choose>

<div
	class="visible-xs visible-sm col-xs-12 col-sm-12 text-center sm-logo">
	<a rel="home" href="home.do"> <img
		src="${pageContext.request.contextPath}/resources/img/soccer.png"
			width="200" alt="logo">
		</a>
	</div>
</div>
<div class="navbar" role="navigation">

	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span
				class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
	</div>
	<div class="collapse navbar-collapse">
		<ul class="nav navbar-nav">
			<li class="selected"><a
				href="${pageContext.request.contextPath}/home.do">Home</a></li>
		<li><a href="myassist.do">Team</a></li>
		<li><a
			href="${pageContext.request.contextPath}/users/fieldlist.do">Near
				Playground</a></li>
		<li class="hidden-xs hidden-sm"><a rel="home"
			href="${pageContext.request.contextPath}/home.do"><img
				class="logo"
				src="${pageContext.request.contextPath}/resources/img/soccer.png"
				width="200" alt="logo"></a></li>
		<li><a href="${pageContext.request.contextPath}/playlist/playlist.do">playground List</a></li>
		<li><a href="${pageContext.request.contextPath}/review/list.do">Review</a></li>
			<li><a href="contact.html">Question</a></li>
		</ul>
	</div>
</div>
<!-- ============TOP============= -->
</head>
<body>
<div class="container">
	<div class="row">
		<div class="divider col-sm-12 col-xs-12 col-md-12">
			<div class="header-text">
				My<span>예약정보 페이지</span>
				<div class="container header-start text-center"></div>
			</div>
		</div>
	</div>
</div>
<!-- ================ Main ============= -->
<div class="container">
	<div class="row">
		<div class=" col-md-12 text-center ">
			<div class="panel">
				<div class="panel-body"  style="background-color: #def0f1;">
					<div style="float:left;">	
						<h3>예약목록</h3>
						<table style="margin-right:200px;" class="table table-hover">
						<thead>
							<tr>
								<th>예약 번호</th>
								<th>운동장 이름</th>
								<th>예약 날짜</th>
								<th>신청시간</th>
								<th>팀 이름</th>
								<th>운동장 인원 수</th>
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
										<td><a class="btn btn-danger btn-sm" href="rvdelete.do?fieldname=${tmp.field_name}&fielddate=${tmp.field_date}&fieldmornig=${tmp.field_m_time}&fieldafternoon=${tmp.field_a_time}&fieldnight=${tmp.field_n_time}">예약취소</a></td>
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
										<td><a class="btn btn-danger btn-sm" href="rvdelete.do?fieldname=${tmp.field_name}&fielddate=${tmp.field_date}&fieldmornig=${tmp.field_m_time}&fieldafternoon=${tmp.field_a_time}&fieldnight=${tmp.field_n_time}">예약취소</a></td>
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
										<td><a class="btn btn-danger btn-sm" href="rvdelete.do?fieldname=${tmp.field_name}&fielddate=${tmp.field_date}&fieldmornig=${tmp.field_m_time}&fieldafternoon=${tmp.field_a_time}&fieldnight=${tmp.field_n_time}">예약취소</a></td>
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
</div><!-- /.container -->	
<!-- ============FOOTER============= -->
<footer id="footer">
	<div class="footer-content container">
		<div class="footer-adress text-center col-xs-12 col-sm-4 col-md-4">
			<h4>Great love for humanity</h4>
			<ul class="footer-menus">
				<li>Home /</li>
				<li>About</li>
				<br />
				<li>Service /</li>
				<li>Gallery /</li>
				<li>Contact</li>
			</ul>
		</div>
		<div class="footer-second col-xs-12 col-sm-4 col-md-4">
			<div class="social-block text-center">
				<div class="social-share">
					<i class="fa fa-2x fa-facebook"></i> <i
						class="fa fa-2x  fa-twitter"></i> <i
						class="fa fa-2x  fa-google-plus"></i> <i
						class="fa fa-2x  fa-instagram"></i>
				</div>
			</div>
			<p class="text-center footer-text1">123 456 7890</p>
			<p class="text-center footer-text">humanity@shuvohabib.com</p>
		</div>
		<div class="footer-third col-xs-12 col-sm-4 col-md-4">
			<div class="copyright">
				<span>Copyright 2014 Theme</span><br> <span>All Rights
					Reserved</span>
			</div>
		</div>
	</div>
	<div class="move-top-page"></div>
</footer>
<!-- script references -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/nav-hover.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.bxslider.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/main.js"></script>

<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<script>
</script>
</body>
</html>