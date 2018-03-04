<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Soccer_Reservation</title>
 <%@ include file="../include/header_script.jsp" %>
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
 <%@ include file="../include/header.jsp" %>

	<div class="container">
		<div class="row">
			<div class="divider col-sm-12 col-xs-12 col-md-12">
				<div class="header-text">
					Near<span>Ground</span>
					<div class="container header-start text-center">
						<div class="heading-icon" style=" margin-top:0px;">
							<img src="https://png.icons8.com/material/96/000000/stadium.png">
						</div>
						<h1 class="main-text">가까운 축구장을 찾아보세요!</h1>
						<p class="text-center sub-text">
							<em class="first-line"> 가입시 등록한 주소 중심으로 가까운 운동장을 찾아보세요! </em>
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
			<div class="col-md-12 text-center">
				<div class="panel">
					<div class="panel-body">
						<h3> 여러분의 집 주변을 중심으로 축구장이 나옵니다.</h3>
						<p><strong>Mark Up</strong>을 눌르면 바로 예약하실 수 있습니다.</p>
						<div id="map"></div>
					</div>	
				</div>
				<div class="text-center">
		           <ul class="list-unstyled list-inline list-social-sq-primary">
		           <li><a class="btn btn-default" href="${pageContext.request.contextPath}/playlist/playlist.do">축구장 전체 목록</a></li>
		           </ul>
	            </div>
			</div>
		</div>
	</div>
	

 <%@ include file="../include/footer.jsp" %>

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
		var lat =  parseFloat("${dto.lat }"); //jquery와 jstl이 충돌나서 String으로 넣은후 원래 타입인 parseFloat으로 형변환.
		var lng =  parseFloat("${dto.lng }");
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