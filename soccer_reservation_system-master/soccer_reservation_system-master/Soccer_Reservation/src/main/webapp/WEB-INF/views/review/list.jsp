<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review/list.jsp</title>

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

	<div class="container">
	<div class="row">
		<div class="divider col-sm-12 col-xs-12 col-md-12">
			<div class="header-text">
				<span>후기 글 페이지</span>
				<div class="container header-start text-center"></div>
				<p class="text-left sub-text">
					<em class="first-line">운동장을 이용한 분들의 후기글을 읽어보세요~</em>
				</p>
			</div>
		</div>
	</div>
</div>
	<!-- ================ Main ============= -->
<div class="container">
	<div class="row">
			<div class=" col-md-12 text-center">
				<div class="panel">
					<div class="panel-body"  style="background-color: #def0f1;">
							<div style="float:left;">
								<h3>후기글 목록입니다.</h3>
								<table  id="listtable" class="table table-hover ">
									<thead>
										<tr>
											<th>번호</th>
											<th>작성자</th>
											<th>제목</th>
											<th>조회수</th>
											<th>등록일</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="tmp" items="${list}">
											<tr>
												<td>${tmp.num }</td>
												<td>${tmp.writer }</td>
												<td><a href="detail.do?num=${tmp.num }&condition=${condition}&keyword=${keyword}">${tmp.title }</a></td>
												<td>${tmp.viewCount }</td>
												<td>${tmp.regdate }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="pull-right"><a class="btn btn-default btn-md " href="insertform.do"><i class="glyphicon glyphicon-pencil"></i> 새글 작성</a></div>
								<ul class="pagination">
									<c:choose>
										<c:when test="${startPageNum ne 1 }">
											<li>
												<a href="list.do?pageNum=${startPageNum-1 }&condition=${condition}&keyword=${keyword}">&laquo;</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="disabled">
												<a href="javascript:">&laquo;</a>
											</li>
										</c:otherwise>
									</c:choose>
									<c:forEach var="i" begin="${startPageNum }" 
											end="${endPageNum }">	
										<c:choose>
											<c:when test="${i eq pageNum }">
												<li class="active"><a href="list.do?pageNum=${i }&condition=${condition}&keyword=${keyword}">${i }</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="list.do?pageNum=${i }&condition=${condition}&keyword=${keyword}">${i }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${endPageNum lt totalPageCount }">
											<li>
												<a href="list.do?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${keyword}">&raquo;</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="disabled">
												<a href="javascript:">&raquo;</a>
											</li>
										</c:otherwise>
									</c:choose>
								</ul>
								
								
								<div  class="row" >
									<div class="col-xs-6">
										<!-- 검색어 관련 form -->
										<form  action="list.do" method="post" >
											<input type="hidden" id="condition" value="${condition }" name="condition" />
									        <div class="input-group">
									          <div class="input-group-btn">
									            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
									              <span id="conditionBtn">제목+파일명</span>
									              <span class="caret"></span>
									            </button>
									            <ul class="dropdown-menu">
									              <li><a href="javascript:set('titlecontent')">제목+파일명</a>
									              </li>
									              <li><a href="javascript:set('title')">제목</a>
									              </li>
									              <li><a href="javascript:set('writer')">작성자</a>
									              </li>
									            </ul>
									          </div>
									          <!-- /btn-group -->
									          <input  type="text" id="keyword" name="keyword" value="${keyword }" class="form-control"/>
									          	<span class="input-group-btn">
										            <button class="btn btn-default" type="submit">
										              <span class="sr-only">검색</span>
										              <span class="glyphicon glyphicon-search"></span>
										            </button>
							          			</span>
									        </div>			
										</form>
									</div>
								</div>
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
	
	set("${condition}");
	
	function set(condition){
		if(condition=="titlecontent" || condition==""){
			condition="titlecontent";
			$("#conditionBtn").text("제목+파일명");
		}else if(condition=="title"){
			$("#conditionBtn").text("제목");
		}else if(condition=="writer"){
			$("#conditionBtn").text("작성자");
		}
		$("#condition").val(condition);
	}
	
	function deleteConfirm(num){
		var result=confirm(num+" 번 파일을 삭제 하시겠습니까?");
		if(result){
			location.href="delete.do?num="+num;
		}
	}
</script>
</body>
</html>











