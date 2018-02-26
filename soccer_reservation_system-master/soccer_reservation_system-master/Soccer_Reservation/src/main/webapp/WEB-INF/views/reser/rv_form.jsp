<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">	
<link href="${pageContext.request.contextPath}/resources/css/styles.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/demo.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/testimonial.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link href='http://fonts.googleapis.com/css?family=Poiret+One'rel='stylesheet' type='text/css'>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rv-insertform.css" />

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
					<li class="loginLi"><a href="${pageContext.request.contextPath}/users/loginform.do">Login</a></li>
					<li class="loginLi"><a href="${pageContext.request.contextPath}/users/signupform.do">SignUp</a></li>
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
			<li><a href="playlist.do">playground List</a></li>
			<li><a href="${pageContext.request.contextPath}/review/list.do">Review</a></li>
			<li><a href="contact.html">Question</a></li>
		</ul>
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="divider col-sm-12 col-xs-12 col-md-12">
			<div class="header-text">
				My <span>운동장 예약하기</span>
									<div class="container header-start text-center">
					<div class="heading-icon">
						<img src="https://png.icons8.com/material/96/000000/stadium.png">
					</div>
					<h1 class="main-text">예약폼</h1>
					<p class="text-center sub-text">
						<em class="first-line"></em>
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
			<div class="col-md-offset-2 col-md-8 text-center">
				<div class="panel">
					<div class="panel-body" style="background-color: #def0f1;">

									
						<div class="text-center">
						
								<form action="rvinsert.do?num=${dto.num }" method="POST" id="rvform">
								
								<div class="form-group">
									<label style="float:left; margin-top: 15px; margin-left: 70px;" for="field_name">운동장 이름</label>
									<input type="hidden" id="field_name" name="field_name" value="${field_name }"/>
									<input type="text" id="field_name" name="field_name" value="${field_name }" disabled/>
								</div>
								
								<div class="form-group">
									<label style="float:left; margin-top: 15px; margin-left: 70px;" for="field_date">예약 날짜</label>
									<input type="hidden" id="field_date" name="field_date" value="${field_date }"/>
									<input type="text" id="field_date" name="field_date" value="${field_date }" disabled/>
								</div>
								
								<div class="form-group">
									<label style="float:left; margin-top: 15px; margin-left: 70px;" for="rv_time">예약할시간대</label>
									<input type="text" id="rv_time" name="rv_time" value="${rv_time }"/>
								</div>
								<div class="form-group">
									<label style="float:left; margin-top: 15px; margin-left: 70px;" for="id">예약자 ID</label>
									<input type="text" id="id" name="id" value="${id}"/>
								</div>
								<div class="form-group">
									<label style="float:left; margin-top: 15px; margin-left: 70px;" for="team">예약팀명</label>
									<input type="text" id="team" name="team" />
								</div>
								<div class="form-group">
									<label style="float:left; margin-top: 15px; margin-left: 70px;" for="phone">예약자 전화번호</label>
									<input type="text" id="phone" name="phone" value="${phone }"/>
								</div>
								<div class="form-group">
									<label style="float:left; margin-top: 15px; margin-left: -100px; margin-bottom: 20px;" 
									for="teamNP">예약팀인원수</label>
									<select name="teamNP" id="teamNP">
										<option>--이용 인원 선택--</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="11">11</option>	
									</select>
								</div>
								<div class="form-group" style="    margin-top: 9px;">
									<label style="float:left; margin-top: 15px;   margin-left: -100px;" for="etc">기타입력사항</label>
									<textarea rows="5" cols="50" id="etc" name="etc"></textarea>
								</div>
									<button class="btn btn-default" id="submit" type="submit">예약하기</button>
								</form>
							</div>					
						</div>
					</div>
				</div>
			</div>
		</div>


<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.js"></script>

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

<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
		<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/nav-hover.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/main.js"></script>







<script type="text/javascript">


$("#rvform").submit(function(){
	
	if($("#team").val() == ""){
		alert("팀명을 넣어주세요!");
		$("#team").focus();
		return false;
	}else if($("#teamNP").val()=="--이용 인원 선택--"){
		alert("이용 인원수를 선택해주세요.");
		$("#teamNP").focus();
		return false;	
	}else{
		return true;
	}
	
});
</script>
</body>
</html>