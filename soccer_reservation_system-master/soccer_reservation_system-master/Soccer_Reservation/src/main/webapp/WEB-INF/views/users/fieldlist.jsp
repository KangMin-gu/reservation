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
<!-- 현재 페이지에 적용할 style.css 파일을 여기에서 로딩한다 -->	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/fieldlist.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
       #map {
        height: 400px;
        width: 100%;
        
       }
    </style>
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
			<a href="${pageContext.request.contextPath}/home.do"><img src="${pageContext.request.contextPath}/resources/img/soccer.png" width="200" alt="logo">
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
				<li><a href="${pageContext.request.contextPath}/playlist/playlist.do">playground List</a></li>
				<li><a href="${pageContext.request.contextPath}/review/list.do">Review</a></li>
				<li><a href="${pageContext.request.contextPath}/">Question</a></li>
			</ul>
		</div>
	</div>
<!-- ============TOP============= -->
<!-- ===========소제목============ -->
<div class="container">
	<div class="row">
		<div class="divider col-sm-12 col-xs-12 col-md-12">
			<div class="header-text"> Near <span>PlayGround</span></div>
				<div class="row">
					<div class="col-sm-12 text-center">
						<div class="heading-icon" >
							<img id="soccericon" src="${pageContext.request.contextPath}/resources/images/mylocation.png"/>
						</div>
					</div>
				</div>
				<div class=" header-start text-center">
					<h1 class="main-text">여러분의 동네의 마음에 드는 축구장을 무료로 예약하세요!</h1>
					<p class="text-center sub-text">지도에서 마음에 드는 축구장을 클릭 후, 예약하기를 눌르세요!</p>
				</div>
		</div>
	</div>
</div>
<!-- ===========소제목============ -->
<!-- ============본문============== -->

	
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<div class="panel">
					<div class="panel-body">
						<h3> 여러분의 집 주변을 중심으로 축구장이 나옵니다.</h3>
						<p>현재 나의 주소는 <strong>${addr }</strong>입니다.</p>
						<div id="map"></div>
					</div>	
				</div>
				<div class="text-center">
		           <ul class="list-unstyled list-inline list-social-sq-primary">
		           <li><a class="btn btn-default" href="${pageContext.request.contextPath}/playlist/playlist.do">동네별 축구장 검색하기</a></li>
		           </ul>
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
		

	
	<!-- Place in the <head>, after the three links -->

<script type="text/javascript">

	$('.testimonials-slider').bxSlider({
		slideWidth : 800,
		minSlides : 1,
		maxSlides : 1,
		slideMargin : 32,
		auto : true,
		autoControls : true
	});
// 페이지 로딩시 구글맵 센터 좌표 	
	function initMap() {
		var lat =  parseFloat("${lat }"); //jquery와 jstl이 충돌나서 String으로 넣은후 원래 타입인 parseFloat으로 형변환.
		var lng =  parseFloat("${lng }");
	    var myLocation = { lat : lat, lng : lng };
	    var map = new google.maps.Map(document.getElementById('map'), {
	      zoom: 14,
	      center: myLocation
	    });
	    
	   	var marker = new google.maps.Marker({
	   		position : myLocation,
	   		map: map
	   	});
	   	
	    setMarkers(map);
	}
	
		
  var icon="http://maps.google.com/mapfiles/kml/pal2/icon57.png"; //축구장 아이콘 이미지 웹호출
  //ajax 구글 운동장 DB 호출
	function setMarkers(map){	
		$.ajax({
			url:"fieldPosition.do",
			method:"GET",
			success:function(data){
				console.log(data);
				
				var marker, i;
				var infowindow = new google.maps.InfoWindow();
			//구글 맵 마커 등록	
				for(var i = 0; i< data.length; i++){
		      		var lats= parseFloat(data[i].lat);
		      		var lngs= parseFloat(data[i].lng);
		      		var latlng = {lat : lats, lng : lngs};
		
		      		//마커 등록
		      		var marker = new google.maps.Marker({
		      			position: {lat : lats, lng : lngs},
		      			map: map,
		      			icon: icon
		      		});
		      	//구글 맵 마커 클릭시 운동장 이름 호출	
		      		var str = JSON.stringify(data[i].title);
		      		var num = data[i].num;
					google.maps.event.addListener(marker, 'click', (function(marker, i){
						return function(){
							infowindow.setContent('<p></p><p><strong>'+(data[i].title)+'</strong></p>'+'<a class="maprv btn btn-primary" href="${pageContext.request.contextPath}/reser/rv_detail.do?num='+(data[i].num)+'">'+'예약하기</a>');
							//infowindow.setContent(str+'<a href="${pageContext.request.contextPath}/reser/reserdetail.do">예약하기</a>');
							infowindow.open(map, marker);
						}
					})(marker, i));
		      		     		
				}//반복문	
			}
		});
	}
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBnXEObf7lWebcW_r-6VMz1cZDIrjrEBQE&callback=initMap"></script>
</body>
</html>