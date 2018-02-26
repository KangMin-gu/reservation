<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/signupform.do</title>
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

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/us-signupform.css" />


</head>
<body>
<div class="header container">
		<!-- 세션에 id의 유무에따라 보여지는 loginView -->
		<c:choose>
			<c:when test="${not empty id }">
				<div>
					<ul id="loginUl">
						<li class="loginLi"><a href="users/info.do">My info</a></li>
						<li class="loginLi"><a href="users/logout.do">Logout</a></li>
					</ul>
				</div>
			</c:when>
			<c:otherwise>
				<div>
					<ul id="loginUl">
						<li class="loginLi"><a href="${pageContext.request.contextPath}/users/loginform.do">Login</a></li>
						<li class="loginLi"><a href="signupform.do">SignUp</a></li>
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
	
		<div class="container">
		<div class="row">
			<div class="divider col-sm-12 col-xs-12 col-md-12">
				<div class="header-text">
					 <span>회원가입</span>
										<div class="container header-start text-center">
						<div class="heading-icon">
							<img src="https://png.icons8.com/material/96/000000/stadium.png">
						</div>
						<h1 class="main-text">회원가입</h1>
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
							<form action="signup.do" method="post" id="myForm">
								<div class="form-group">
									<label style="float:left; margin-top: 15px; margin-left: 70px;" for="id" >아이디</label>
									<input type="text" name="id" id="id" style="width: 40%; margin-left: 0;"/>
									<button class="btn btn-default" id="checkBtn">중복확인</button>
									<span class="regExp"></span> 
									<span id="checkResult"></span><br/>
								</div>
								<div class="form-group">
									<label style="float:left; margin-top: 15px; margin-left: 70px;"  for="pwd">비밀번호</label>
									<input type="password" name="pwd" id="pwd"/>
								</div>
								<div class="form-group">
									<label style="float:left; margin-top: 15px; margin-left: 70px;" for="pwd2">비밀번호 확인</label>
									<input type="password" name="pwd2" id="pwd2" />
								</div>
								<div class="form-group">
									<label style="float:left; margin-top: 15px; margin-left: 70px;" for="findQuestion">비밀번호 찾기</br> 질문 선택</label>
									<select name="findQuestion" id="findQuestion" class="">
										<option value="나의 초등학교 이름은?">나의 초등학교 이름은?</option>
										<option value="나의 중학교 이름은?">나의 중학교 이름은?</option>
										<option value="나의 고등학교 이름은?">나의 고등학교 이름은?</option>
										<option value="나의 대학교 이름은?">나의 대학교 이름은?</option>
									</select>
								</div>
								
								<div class="form-group">
									<label style="float:left; margin-top: 15px; margin-left: -100px;" for="findAnswer">비밀번호 찾기</br> 질문 답변</label>
									<input type="text" name="findAnswer" id="findAnswer" />
								</div>
								<div class="form-group">
									<label style="float:left; margin-top: 15px; margin-left: -100px;"  for="name">이름</label>
									<input type="text" name="name" id="name" />
								</div>
								<div class="form-group">
									<label style="float:left; margin-top: 15px; margin-left: 70px;"  for="email">이메일</label>
									<input type="text" name="email" id="email" />
								</div>
								<div class="form-group">
									<label style="float:left; margin-top: 15px; margin-left: 70px;"  for="phone">전화번호</label>
									<input type="text" name="phone" id="phone" />
								</div>
								<div class="form-group">
									<label style="float:left; margin-top: 15px; margin-left: 70px;"  for="addr">주소</label>
									<input type="text" name="addr" id="addr" />
								</div>
								<div class="form-group">
									<label style="float:left; margin-top: 15px; margin-left: 70px;"  for="detailaddr">상세주소</label>
									<input type="text" name="detailaddr" id="detailaddr" style="margin-bottom: 20px" />
								</div>
								<button class="btn btn-default" type="submit" id="submit" style="margin-right:100px; float:right;">가입하기</button>
							</form>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
	
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.js"></script>
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

<script>
$(function(){

	var idValid=false;

		
	$("#checkBtn").click(function(){
	
		var inputId=$("#id").val();
		
		$.ajax({
			url:"checkid.do", 
			method:"GET",
			data: {"inputId":inputId},
			success:function(data){  
				if(data.canUse){
					$("#checkResult").text("사용가능").css("color", "green");
					idValid = true;
				}else{
					$("#checkResult").text("사용불가").css("color", "red");
					idValid = false;
				}
			}
		});
		return false; 
	});
	

 	$("#myform").submit(function(){
		if(idValid==false){
			alert("아이디 중복 확인을 하세요.");
			$("#id").focus();
			return false; 
		}
		
	}); 
	

	$("#id").keydown(function(){
		idValid=false;
		$("#checkResult").text("");
	});

	
});
	
	
	$("#myform").submit(function(){
		
		var regId=/^[a-zA-Z][a-zA-Z0-9]{4,9}$/; //아이디 
		var regPwd=/^[^가-힝ㄱ-ㅎ]{5,10}$/; //비밀번호 
		var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i; //이메일유효성검사식 
		var regName=/^[가-힣]{2,15}|[a-zA-Z]{2,15}\s[a-zA-Z]{2,15}$/;	// 이름 유효성 검사식
		var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;	// 핸드폰번호 유효성 검사식
		
		if($("#id").val() == ""){
			alert("아이디를 입력하세요.");
			$("#id").focus();
			return false;
		}else if(regId.test($("#id").val())==false){
			alert("아이디는 영문자로만 최소 5-10글자로 입력하세요.");
			$("#id").focus();
			return false;
		}else if($("#pwd").val() == ""){
			alert("비밀번호를 입력하세요.");
			$("#pwd").focus();
			return false;
		}else if(regPwd.test($("#pwd").val())==false){	
			alert("비밀번호는 6-10글자, 특수문자를 최소 하나 포함 해 주세요.");
			$("#pwd").focus();
			return false;
		}else if($("#pwd").val() != $("#pwd2").val()){
			alert("비밀번호와 비밀번호 확인이 맞지 않습니다.");
			$("#pwd").focus();
			return false;
		}else if($("#findAnswer").val() == ""){
			alert("비밀번호 찾기 답변을 입력하세요.");
			$("#findAnswer").focus();
			return false;
		}else if($("#name").val() == ""){
			alert("이름을 입력 하세요.");
			$("#name").focus();
			return false;
		}else if(regName.test($("#name").val())==false){
			alert("이름은 한글, 영문 대소문자만 사용 가능 합니다.");
			$("#name").focus();
			return false;			
		}else if($("#email").val() == ""){
			alert("이메일을 입력하세요.");
			$("#email").focus();
			return false;
		}else if(regEmail.test($("#email").val())==false){
			alert("이메일형식을 다시 한번 확인해 주세요.");
			$("#email").focus();
			return false;				
		}else if($("#phone").val() == ""){
			alert("전화번호는 입력해주세요.");
			$("#phone").focus();
			return false;
		}else if(regPhone.test($("#phone").val())==false){
			alert("전화번호에 -를 빼고 숫자만 입력해주세요.");
			$("#phone").focus();
			return false;				
		}else if($("#addr").val()==""){
			alert("주소를 입력하세요.");
			$("#addr").focus();
			return false;
		}else{
			return true;
		}

	});
	

</script>
</body>
</html>










