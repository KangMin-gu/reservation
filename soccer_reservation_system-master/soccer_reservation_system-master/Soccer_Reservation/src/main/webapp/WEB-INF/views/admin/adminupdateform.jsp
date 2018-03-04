<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin/adminupdateform.jsp</title>
 <%@ include file="../include/header_script.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/us-updateform.css" />

</head>
<body>
 <%@ include file="../include/header.jsp" %>
 
<div class="container">
	<div class="row">
		<div class="divider col-sm-12 col-xs-12 col-md-12">
			<div class="header-text">
			 User<span>Update</span>
			<div class="container header-start text-center">
					<h1 class="main-text">${dto.id }회원님의 정보입니다.</h1>
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
	
	
<div style="margin-top: 30px;" class="container">
		<div class="row">
			<div class="col-md-offset-2 col-md-8 text-center">
				<div  class="panel">
					<div  class="panel-body" style="background-color: #def0f1; ">
					<div class="text-center">	
						<form action="adminupdate.do?id=${dto.id }" method="post" id="myForm">
							<input type="hidden" name="id" vlaue="${dto.id }" disabled/>
							<div class="form-group">
							<label style="float:left; margin-top: 15px; margin-left: 70px;" for="id">회원 아아디</label>
								<input type="text" name="id" value="${dto.id }" disabled/>
							</div>
							<div class="form-group">	
								<input type="hidden" name="name" vlaue="${dto.name }" disabled/>
							<label style="float:left; margin-top: 15px; margin-left: 68px;" for="name">회원 이름</label>
								<input type="text" value="${dto.name }" disabled/>
							</div>
							<div class="form-group">	
							<label style="float:left; margin-top: 15px; margin-left: 70px;" for="email">회원 이메일</label>
								<input type="text" name="email" value="${dto.email }" />
							</div>
							<div class="form-group">	
							<label style="float:left; margin-top: 15px; margin-left: 70px;" for="addr">회원 주소</label>
								<input  type="text" name="addr" value="${dto.addr }" />
							</div>
							<div class="form-group">	
							<label style="float:left; margin-top: 15px; margin-left: 70px;" for="detailaddr">상세주소</label>
								<input type="text" name="detailaddr" value="${dto.detailaddr }" />
							</div>
							<div class="form-group">	
							<label style="float:left; margin-top: 15px; margin-left: 70px;" for="phone">회원 전화번호</label>
								<input type="text" name="phone" value="${dto.phone }" />
							</div>	<br/>
							    <a style="margin-left:5px; margin-right: 100px; float:right;" class="btn btn-warning pull-right" href="${pageContext.request.contextPath }/admin/adminlist.do">취소</a>
								<button class="btn btn-default pull-right" type="submit" id="submit" style="float:right;">수정</button>
						</form>
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