<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>users/signup_form.jsp</title>

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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/pl-insertform.css" />
</head>
<body>
<div class="header container">
		<!-- 세션에 id의 유무에따라 보여지는 loginView -->
		<c:choose>
			<c:when test="${not empty id }">
				<div>
					<ul id="loginUl">
						<li class="loginLi"><a href="${pageContext.request.contextPath}/users/info.do">My info</a></li>
						<li class="loginLi"><a href="${pageContext.request.contextPath}/users/logout.do">Logout</a></li>
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
			<ul class="nav navbar-nav" id="navvv">
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
				<li><a href="playlist.do">playground List</a></li>
				<li><a href="${pageContext.request.contextPath}/review/list.do">Review</a></li>
				<li><a href="contact.html">Question</a></li>
			</ul>
		</div>
	</div>
	<!-- ============TOP============= -->
	<!-- ===========소제목============ -->
	<div class="container">
		<div class="row">
			<div class="divider col-sm-12 col-xs-12 col-md-12">
				<div class="header-text">
					Admin <span>운동장 추가</span>
										<div class="container header-start text-center">
						<div class="heading-icon">
							<img src="https://png.icons8.com/material/96/000000/stadium.png">
						</div>
						<h1 class="main-text">운동장 추가</h1>
						<p class="text-center sub-text">
							<em class="first-line">관리자용 운동장 추가</em>
								<em class="next-line">
								</em>
						</p>
					</div>	
				</div>
			</div>
		</div>
	</div>


<div class="container">
		<div class="row">
			<div class="hidden-xs col-md-offset-2 col-md-8 text-center">
				<div  class="panel">
					<div  class="panel-body" style="background-color: #def0f1; ">

						<div class="text-center">
							<form action="insert.do" method="post" id="myForm">
									
								<label style="float:left; margin-top: 15px; margin-left: 70px;" for="field_name" >운동장이름</label>
								<input type="text" name="field_name" id="field_name" placeholder="운동장이름" />
								</br>
								<label style="float:left; margin-top: 15px; margin-left: 70px;" for="field_addr">운동장주소</label>
								<input type="text" name="field_addr" id="field_addr" placeholder="운동장주소" />
								</br>
								<label style="float:left; margin-top: 15px; margin-right: 12px; margin-left: 70px;"  for="field_morning">오전시간</label>
								<input type="text" name="field_morning" id="field_morning"  placeholder="오전시간대" />
								</br>
								<label style="float:left; margin-top: 15px; margin-right: 12px; margin-left: 70px;" for="field_afternoon">오후시간</label>
								<input type="text" name="field_afternoon" id="field_afternoon" placeholder="오후시간대" />
								</br>
								<label style="float:left; margin-top: 15px; margin-right: 12px; margin-left: 70px;" for="field_night">저녁시간</label>
								<input type="text" name="field_night" id="field_night" style="margin-bottom: 20px;" placeholder="저녁시간대" />
								<br/>
								<button class="btn btn-default" type="submit">추가</button>
								<a class="btn btn-default" href="playlist.do">취소</a>

							</form>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ============FOOTER============= -->
	<footer  id="footer">
		<div  class="footer-content container">
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

	<!-- Place in the <head>, after the three links -->
	<script>
		$('.testimonials-slider').bxSlider({
			slideWidth : 800,
			minSlides : 1,
			maxSlides : 1,
			slideMargin : 32,
			auto : true,
			autoControls : true
		});
	</script>
	<script type="text/javascript">
		
	</script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.js"></script>

</body>
</html>











