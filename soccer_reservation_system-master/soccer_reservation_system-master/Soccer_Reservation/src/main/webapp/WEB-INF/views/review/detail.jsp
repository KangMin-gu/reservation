<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review/insertform.jsp</title>
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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reviewDetail.css" />	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="${pageContext.request.contextPath}/smarteditor/js/HuskyEZCreator.js"></script>

<style>
	textarea{resize:none;}
	#content{display:none;width:100%;height:300px;}
	.comments{
		border: 1px dotted #cecece;
	}
		.comment textarea{
		width:80%;
		background-color: #fff;
	}
	.comment form{
		display: none;
	}
	.comment{
		position: relative;
	}
	.comment .reply_icon{
		position: absolute;
		width: 20px;
		height: 20px;
		top:0;
		left:-50px;
	
	
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
				<span>후기글 본문</span>
				<div class="container header-start text-center"></div>
			</div>
		</div>
	</div>
</div>
	<!-- ================ Main ============= -->
<div class="container">
	<div class="row">
			<div class=" col-md-12 text-center">
				<div class="panel">
					<div class="panel-body">
							<div style="float:center;">
								<c:if test="${not empty msg }">
								<div class="alert alert-success">${msg }</div>
							</c:if>
						   <div class="panel panel-default">
								<div class="panel-body">
								  		<h1><strong>${dto.title }</strong></h1>
								  </div>
								  <div class="panel-body">
								  		<p>${dto.regdate} <em>By</em> <strong>${dto.writer}</strong></p>   
								</div>
								<div class="panel-body">
										<div class="content">${dto.content }</div>
								</div>
								<div class="panel-footer">
									<%-- 로그인한 회원이 작성한 글이라면  수정, 삭제 링크를 출력한다. --%>
								   <c:if test="${dto.prevNum ne 0 }">
								   	<a class="btn btn-default btn-sm pull-left" href="detail.do?num=${dto.prevNum}&condition=${condition}&keyword=${keyword}"><i class="glyphicon glyphicon-chevron-up"></i></a>
								   </c:if>
								   <c:if test="${dto.nextNum ne 0 }">
								   	<a class="btn btn-default btn-sm pull-left" href="detail.do?num=${dto.nextNum}&condition=${condition}&keyword=${keyword}"><i class="glyphicon glyphicon-chevron-down"></i></a>
								   </c:if>
									<a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/review/list.do">리스트로 가기</a>
								    <c:if test="${id eq dto.writer }">
								    <a class="btn btn-default btn-sm" href="updateform.do?num=${dto.num }">수정</a>
								    <a class="btn btn-default btn-sm" href="javascript:deleteCheck()">삭제</a>
								    </c:if>
								</div>
							</div>
							<br />
						
							<!-- 덧글 목록 출력하기 -->
							<div class="comments">
								<c:forEach var="tmp" items="${commentList }">
									<div class="comment" <c:if test="${tmp.num ne tmp.comment_group }">style="margin-left:100px"</c:if> >
										<c:if test="${tmp.num ne tmp.comment_group }">
											<div class="reply_icon"><i class="fa fa-comments-o fa-2x" aria-hidden="true"></i></div>
										</c:if>
										<div class='left-box'>
											From&nbsp;<strong>${tmp.writer }</strong>
											${tmp.regdate }<br/>
											To&nbsp;<strong>${tmp.target_id }</strong>
											<a class="btn btn-default btn-xs" href="javascript:">답글</a>
										</div>
										<textarea id="texta" rows="2" disabled>${tmp.content }</textarea>
										<form class="form" action="comment_insert.do" method="post">
											<!-- 덧글 작성자 -->
											<input type="hidden" name="writer" value="${id }"/>
											<!-- 덧글 그룹 -->
											<input type="hidden" name="ref_group" value="${dto.num }" />
											<!-- 덧글 대상 -->
											<input type="hidden" name="target_id" value="${tmp.writer }" />
											<input type="hidden" name="comment_group" value="${tmp.comment_group }" />
											<textarea name="content"  class="form-control" ></textarea>
											<button class="btn btn-default" type="submit">등록</button>
										</form>		
									</div>
								</c:forEach>
							</div>
							
							<!-- 원글에 대한 덧글 입력 폼 -->
							<div class="comment_form">
								<form action="comment_insert.do" method="post">
									<!-- 덧글 작성자 -->
									<input type="hidden" name="writer" value="${id }"/>
									<!-- 덧글 그룹 -->
									<input type="hidden" name="ref_group" value="${dto.num }" />
									<!-- 덧글 대상 -->
									<input type="hidden" name="target_id" value="${dto.writer }" />
									<br />
									<textarea id="texta" name="content"  rows="2"  cols="75" placeholder="댓글을 입력하세요"></textarea>
									<button class="btn btn-default" type="submit">등록</button>
								</form>
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

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.js"></script>
<script>
	//로그인 했는지 안했는지 여부 
	var isLogin=${isLogin};
	
	//덧글 전송 이벤트가 일어 났을때 실행할 함수 등록 
	$(".comment_form > form, .comment form").submit(function(){
		if(!isLogin){//만일 로그인 하지 않았다면 
			alert("로그인이 필요 합니다.");
			//로그인 페이지로 이동 
			location.href="${pageContext.request.contextPath}"+
			"/users/loginform.do"+
			"?url=${pageContext.request.contextPath}"+
			"/review/detail.do?num=${dto.num}";
			
			return false; //폼전송 막기 
		}
	});
	
	//덧글 달기 혹은 취소 버튼을 눌렀을때 실행할 함수 등록 
	$(".comment a").click(function(){
		if($(this).text()=="답글"){
			$(this)
			.text("취소")
			.parent()
			.parent()
			.find("form")
			.slideToggle();	
		}else{
			$(this)
			.text("답글")
			.parent()
			.parent()
			.find("form")
			.slideToggle();
		}
	});	

	function deleteCheck(){
		var isDelete=confirm("삭제 하시겠습니까?");
		if(isDelete){
			location.href="delete.do?num=${dto.num}";
		}
	}
</script>
</body>
</html>








