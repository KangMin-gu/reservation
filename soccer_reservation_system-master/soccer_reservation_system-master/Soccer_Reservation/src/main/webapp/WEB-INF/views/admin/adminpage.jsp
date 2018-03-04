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
</head>
<body>
 <%@ include file="../include/header.jsp" %>
<!-- ===========소제목============ -->
<div class="container">
	<div class="row">
		<div class="divider col-sm-12 col-xs-12 col-md-12">
			<div class="header-text"> Admin<span>Menu</span></div>
		</div>
	</div>
</div>

<!-- ============본문============== -->
    	<div class="container" style="margin-bottom: 50px;">
           <div class="row">
           		<div class="col-xs-12 text-center" style="background-color: white;" >
           			<div class="row">
           				<div class="container">
		                 	<div class="row" style="height: 80px; margin-top:20px;">		
								<div class="col-xs-6">
									<a class="btn btn-primary" style="width:300px;" href="${pageContext.request.contextPath}/playlist/insertform.do">
									<strong>운동장 등록</strong>
									</a>
								</div>
								<div class="col-xs-6">
									<a class="btn btn-primary" style="width:300px;" href="${pageContext.request.contextPath}/admin/adminlist.do">
									<strong>회원 및 예약관리</strong>
									</a>
								</div>
		                 	</div>
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

	
 <%@ include file="../include/footer.jsp" %>
  <%@ include file="../include/footer_script.jsp" %>
	<script type="text/javascript">
		
	</script>
</body>
</html>
	