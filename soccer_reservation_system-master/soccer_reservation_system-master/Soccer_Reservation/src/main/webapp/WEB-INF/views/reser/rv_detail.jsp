<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Humanity</title>
<meta name="generator" content="Bootply" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- Latest compiled and minified CSS -->
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
<!-- datepicker UI CSS 로드 -->	
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
<!-- 현재 페이지에 적용할 style.css 파일을 여기에서 로딩한다 -->	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rvdetail.css" />
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
			<a rel="home" href="home.do"> <img src="${pageContext.request.contextPath}/resources/img/soccer.png" width="200" alt="logo">
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
				<li class="selected"><a href="${pageContext.request.contextPath}/home.do">Home</a></li>
				<li><a href="myassist.do">Team</a></li>
				<li><a href="${pageContext.request.contextPath}/users/fieldlist.do">Near Playground</a></li>
				<li class="hidden-xs hidden-sm"><a rel="home" href="${pageContext.request.contextPath}/home.do"><img
						class="logo"
						src="${pageContext.request.contextPath}/resources/img/soccer.png"
						width="200" alt="logo"></a></li>
				<li><a href="playlist.do">playground List</a></li>
				<li><a href="donate.html">Review</a></li>
				<li><a href="contact.html">Question</a></li>
			</ul>
		</div>
	</div>
<!-- ============TOP============= -->
<!-- ===========소제목============ -->
<div class="container">
	<div class="row">
		<div class="divider col-sm-12 col-xs-12 col-md-12">
			<div class="header-text"> Field <span>Reservation</span></div>
		</div>
	</div>
</div>

<!-- ============본문============== -->
    	<div class="container">
           <div class="row">
            	<div class="col-md-offset-2 col-md-8  text-center" >
                  <div class="panel">
                    <div class="panel-body">
						<h3>${dto.field_name }의 예약 가능 시간을 조회하세요!</h3>	
						<p>운동장 주소: <strong>${dto.field_addr }</strong></p>
						<form action="rv_form.do?num=${dto.num}" method="POST" id="reservationform" class="form-inline">
							<input type="hidden" id="field_name" name="field_name" value="${dto.field_name }" /><br/>
								<div id="datepicker" style="margin-left: 32%; margin-bottom:18px;"></div>
									<input type="hidden" id="rv_date" name="rv_date"> 	
									
									
								<div class="form-group">		
									<select name="rv_time" id="rv_time" class="form-control" style="margin-left: 3%; width: 264px;">
										<option>------시간 선택------</option>
										<option id="morninga" value="${dto.field_morning}" disabled="disabled">오전 : ${dto.field_morning}</option>
										<option id="afternoona" value="${dto.field_afternoon }" disabled="disabled">오후 : ${dto.field_afternoon }</option>
										<option id="nighta" value="${dto.field_night }" disabled="disabled">저녁 : ${dto.field_night }</option>
									</select>
									
								</div>	
								<div id="allTime">
									<p class="time" >오전 타임: <strong class="text-primary">${dto.field_morning }</strong></p>
									<br/>
									<p class="time" ><strong id="morning"></strong></p>
									<br/>
									<p class="time">오후 시간 : <strong class="text-primary">${dto.field_afternoon }</strong></p>
									<br/>
									<p class="time" ><strong id="afternoon"></strong></p>
									<br/>
									<p class="time">저녁 시간 : <strong class="text-primary">${dto.field_night }</strong></p>
									<br/>
									<p class="time"><strong id="night"></strong></p>
									<br/>
								</div>
							<button class="btn btn-default" id="submit" type="submit">예약하기</button>
						</form>
		
                        </div>
               		 </div>
             	</div>
             </div>
		</div> 

<!-- ============FOOTER============= -->
	<footer id="footer">
		<div class="footer-content container">
			<div class="footer-adress text-center col-xs-12 col-sm-4 col-md-4">
				<h4>Great love for humanity</h4>
				<ul class="footer-menus">
					<li>Home /</li>
					<li>About</li>
					<br/>
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

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  

<script>



$("#datepicker, rv_time").change(function(){
	
	var date = $("#datepicker").val();
	
	$.ajax({
		url:"rvfieldinfo.do?field_name="+("${dto.field_name }")+"&field_date="+date,
		method:"GET",
		success:function(data){
			console.log(data);
		
				if(data){
					
					if(data.field_m_tname != null){
						$("#morning").text(data.field_m_tname);
						$("#morninga").attr('disabled', 'disabled');
						$("#morning").removeAttr('class','text-success');	
					}else{
						$("#morning").text("예약가능합니다.");
						$("#morninga").removeAttr('disabled');
						$("#morning").attr('class','text-success');
					}
					
					if(data.field_a_tname != null){
						$("#afternoon").text(data.field_a_tname);
						$("#afternoona").attr('disabled', 'disabled');
						$("#afternoon").removeAttr('class','text-success');
					}else{
						$("#afternoon").text("예약가능합니다.");
						$("#afternoona").removeAttr('disabled');	
						$("#afternoon").attr('class','text-success');
					}
					
					if(data.field_n_tname != null){
						$("#night").text(data.field_n_tname);
						$("#nighta").attr('disabled', 'disabled');
						$("#night").removeAttr('class','text-success');
						
					}else{
						$("#night").text("예약가능합니다.");
						$("#nighta").removeAttr('disabled');
						$("#night").attr('class','text-success');
					
					}
					
				}else{
					console.log("empty");
					$("#morning").text("예약가능합니다.");
					$("#morninga").removeAttr('disabled');
					$("#morning").attr('class','text-success');
					$("#afternoon").text("예약가능합니다.");
					$("#afternoon").attr('class','text-success');
					$("#afternoona").removeAttr('disabled');
					$("#night").text("예약가능합니다.");
					$("#night").attr('class','text-success');
					$("#nighta").removeAttr('disabled');
				}
		}
	});
	
});

$("#reservationform").submit(function(){
	console.log($("#rv_time").val());
	if($("#rv_date").val() == ""){
			alert("예약 날짜를 선택하여 조회하세요.");
			$("#rv_date").focus();
			return false;
	}else if($("#rv_time").val() == ""){
		alert("예약 가능한 시간을 선택하여 주세요.");
		$("#rv_time").focus();
		return false;
	}else{
		return true;
	}
});

//date picker
$(function() {
    $( "#datepicker" ).datepicker({
    	altField: '#rv_date',
    	dateFormat:'yy-mm-dd',
    	showOn: "both",
    	changeMonth: true,
    	changeYear: true,
    	minDate: 0,
    	dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
    });
});


$("#reservationform").submit(function(){
	console.log($("#rv_date").val());
	if($("#rv_date").val() == ""){
		alert("날짜를 선택해주세요!");
		$("#rv_date").focus();
		return false;
	}else if($("#rv_time").val()=="------시간 선택------"){
		alert("원하는 날짜를 선택하여 조회한후, 예약가능한 시간을 선택해주세요.");
		$("#rv_time").focus();
		return false;	
	}else{
		return true;
	}
	
});
</script>
</body>
</html>












