<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Soccer_Reservation</title>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fotorama.css">	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/my.css" />
</head>
<body>
 <%@ include file="include/header.jsp" %>

		
<div class="fotorama" data-loop="true" data-arrows="true" data-autoplay="true" data-height="750" data-fit="cover">
	<div data-img="${pageContext.request.contextPath}/resources/img/slide1.jpg" class="inverse">
		<div style="margin-top: 500px; height:100px; text-align: center; font-size: 50px; background-color: black; opacity: 0.8;">
		<strong>It will be energizing in your life.</strong>
		</div>
	</div>
	<div data-img="${pageContext.request.contextPath}/resources/img/slide2.jpg" class="inverse">
		<div style="margin-top: 500px; height:100px; text-align: center; font-size: 50px; background-color: black; opacity: 0.8;">
		<strong>Best playground for your team</strong>
		</div>
	</div>
	<div data-img="${pageContext.request.contextPath}/resources/img/slide3.jpg" class="inverse">
		<div style="margin-top: 500px; height:100px; text-align: center; font-size: 50px; background-color: black; opacity: 0.8;">
		<strong>Get the best play!!</strong>
		</div>
	</div>
</div>

	<div class="container header-start text-center">
		<div class="heading-icon">
			<img src="${pageContext.request.contextPath}/resources/images/soccerfield.png" alt="" />
		</div>
		<h1 class="main-text">언제, 어디든지 원하는 곳의 축구장을 예약하세요!</h1>
		<p class="text-center sub-text">
			<em class="first-line">이제는 무료로 운동장을 예약하여 넓은 필드를 동료들과 함께 누려보세요!</em></p>
	</div>

   <div class="divider col-sm-12 col-xs-12 col-md-12">
      <div class="header-text">
         <span>Many</span> Reservation places
      </div>
   </div>

   <section class="blog">
      <div class="item col-md-4">
         <div class="blok-read-sm">
            <a href="review/detail.do" class="hover-image"> <img src="${pageContext.request.contextPath}/resources/img/sea1.jpg" alt="image">
            <span class="layer-block"></span>
            </a>
            <div class="editor-choice">
               <i class="fa fa-star"></i> <a href="#">Editor’s Choice</a>
            </div>
            <div class="content-block">
               <span class="point-caption bg-blue-point"></span> <span
                  class="bottom-line bg-blue-point"></span>
               <div class="button-main bg-fio-point">read more</div>
            </div>
         </div>
      </div>
      
      <div class="item col-md-4">
         <div class="blok-read-sm">
            <a href="single1.html" class="hover-image"> <img src="${pageContext.request.contextPath}/resources/img/sea2.jpg" alt="image"> 
            <span class="layer-block"></span>
            </a>
            <div class="editor-choice">
               <i class="fa fa-star"></i> <a href="#">Editor’s Choice</a>
            </div>                           
            <div class="content-block">
               <span class="point-caption bg-blue-point"></span> <span
                  class="bottom-line bg-blue-point"></span>
               <div class="button-main bg-fio-point">read more</div>
            </div>
         </div>
      </div>

      <div class="item col-md-4">
         <div class="blok-read-sm">
            <a href="#" class="hover-image"> <img style="max-width:100%;" src="${pageContext.request.contextPath}/resources/img/sea3.jpg" alt="image"> 
            <span class="layer-block"></span>
            </a>            
            <div class="editor-choice">
               <i class="fa fa-star"></i> <a href="#">Editor’s Choice</a>
            </div>                 
            <div class="content-block">
               <span class="point-caption bg-blue-point"></span> <span
                  class="bottom-line bg-blue-point"></span>
               <div class="button-main bg-fio-point">read more</div>
            </div>
         </div>
      </div>
   </section>

 <%@ include file="include/footer.jsp" %>
 
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
	<script src="${pageContext.request.contextPath}/resources/js/fotorama.js"></script>
	<!-- Place in the <head>, after the three links -->
</body>
</html>