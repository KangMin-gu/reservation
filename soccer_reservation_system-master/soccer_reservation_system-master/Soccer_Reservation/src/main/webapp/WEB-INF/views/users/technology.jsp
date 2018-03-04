<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <%@ include file="../include/header_script.jsp" %>
</head>
<body>
 <%@ include file="../include/header.jsp" %>

	<div class="container">
		<div class="row">
			<div class="divider col-sm-12 col-xs-12 col-md-12">
				<div class="header-text">
					 Use<span>Technology</span>
				</div>
				<div class="container header-start text-center">
					<div class="heading-icon" style="width: 17%; margin-top:0px;">
						<img style="max-width:100%;" src="${pageContext.request.contextPath}/resources/img/conveyor.png">
					</div>				
					<p class="text-center sub-text">
						<em class="first-line">해당 홈페이지 제작환경 및 배포에 사용한 기술입니다.</em>
					</p>
				</div>	
			</div>
		</div>
	</div>
		
	<div style="margin-top: 30px;" class="container">
		<div class="row">
			<div class="col-md-offset-2 col-md-8 text-center">
				<div  class="panel">
					<div  class="panel-body" style="background-color: white; ">
						<div class="row">
							<div class="col-xs-3">
								<img style="max-width:100%" src="${pageContext.request.contextPath}/resources/img/java.png" alt="" />
								<p><strong>java 8</strong></p>
							</div>
							<div class="col-xs-3">
								<img style="max-width:100%" src="${pageContext.request.contextPath}/resources/img/javascript.png" alt="" />
								<p><strong>javascript</strong></p>
							</div>
							<div class="col-xs-3">
								<img style="max-width:100%" src="${pageContext.request.contextPath}/resources/img/spring.png" alt="" />
								<p><strong>Spring framework 4.0.0</strong></p>
							</div>
							<div class="col-xs-3">
								<img style="max-width:100%" src="${pageContext.request.contextPath}/resources/img/oracle.png" alt="" />
								<p><strong>Oracle DataBase 11g</strong></p>
							</div>							
						</div>
						<div class="row">
							<div class="col-xs-3">
								<img style="max-width:100%" src="${pageContext.request.contextPath}/resources/img/bootstrap.png" alt="" />
								<p><strong>bootstrap 3</strong></p>
							</div>
							<div class="col-xs-3">
								<img style="max-width:100%" src="${pageContext.request.contextPath}/resources/img/jquery.png" alt="" />
								<p><strong>jquery 3.2.1</strong></p>
							</div>
							<div class="col-xs-3">
								<img style="max-width:100%" src="${pageContext.request.contextPath}/resources/img/aws.png" alt="" />
								<p><strong>AWS</strong></p>
							</div>	
							<div class="col-xs-3">
								<img style="max-width:100%" src="${pageContext.request.contextPath}/resources/img/centos.png" alt="" />
								<p><strong>CentOs 6.5</strong></p>
							</div>														
						</div>
						<div class="row">
							<div class="col-xs-3">
								<img style="max-width:100%" src="${pageContext.request.contextPath}/resources/img/html.png" alt="" />
								<p><strong>html</strong></p>
							</div>
							<div class="col-xs-3">
								<img style="max-width:100%" src="${pageContext.request.contextPath}/resources/img/css.png" alt="" />
								<p><strong>css</strong></p>
							</div>
							<div class="col-xs-3">
								<img style="max-width:100%" src="${pageContext.request.contextPath}/resources/img/tomcat.png" alt="" />
								<p><strong>TomCat 8.0</strong></p>
							</div>	
							<div class="col-xs-3">
								<img style="max-width:100%" src="${pageContext.request.contextPath}/resources/img/mac.png" alt="" />
								<p><strong>macOs 10.13</strong></p>
							</div>														
						</div>	
						<div class="row">
							<table class="table text-center">
								<thead>
									<tr>
										<th style="text-align: center;"> 그 외 주요 라이브러리</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>SmartEditor 1</td>							
									</tr>
									<tr>
										<td>javaX.mail 1.6.1</td>
									</tr>
									<tr>
										<td>Jquery UI 1.12.1- DatePicker</td>
									</tr>
									<tr>
										<td>Geocoder 0.16 JAVA</td>						
									</tr>
									<tr>
										<td>Google Map Javascript</td>
									</tr>
									<tr>
										<td>Commons-io 2.4</td>
									</tr>																																					
								</tbody>
							</table>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>				
	

 <%@ include file="../include/footer.jsp" %>
 <%@ include file="../include/footer_script.jsp" %>
</body>
</html>