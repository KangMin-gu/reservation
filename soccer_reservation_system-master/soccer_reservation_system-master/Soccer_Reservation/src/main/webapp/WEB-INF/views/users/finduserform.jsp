<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Soccer_Reservation</title>
 <%@ include file="../include/header_script.jsp" %>
</head>
<body>
 <%@ include file="../include/header.jsp" %>
 
	<div class="container">
		<div class="row">
			<div class="divider col-sm-12 col-xs-12 col-md-12">
				<div class="header-text">
					 Find<span>Id Password</span>
				</div>
				<div class="container header-start text-center">
					<div class="heading-icon" style="width: 17%; margin-top:0px;">
						<img style="max-width:100%;" src="${pageContext.request.contextPath}/resources/img/finduser.png">
					</div>				
					<p class="text-center sub-text">
						<em class="first-line">회원님이 등록한 이메일로 아이디 또는 비밀번호가 발급됩니다.</em>
					</p>
				</div>	
			</div>
		</div>
	</div>

<div style="margin-top: 30px;" class="container">
		<div class="row">
			<div class="col-md-offset-2 col-md-8 text-center">
				<div  class="panel">
					<div  class="panel-body" style="background-color: #def0f1; ">
							<div class="row">
								<div class="col-md-6">
									<div  class="panel">
										<div  class="panel-body" style="background-color: white; ">
									<h3> 아이디 찾기 </h3>
											<form action="findid.do" method="post">
												<div class="form-group" >
													<label style="float:left;" class="control-label" for="name">이름</label>
													<input class="form-control" type="text" id="name" placeholder="이름을 입력하세요." name="name" />
												</div>	
												<div class="form-group">
													<label style="float:left;" class="control-label" for="email">이메일</label>
													<input class="form-control" type="text" id="email" placeholder="회원가입시 입력한 이메일을 입력하세요." name="email" />
												</div>		
													<button style="float:right" class="btn btn-primary" type="submit">아이디 찾기</button>
											</form>
										</div>
									</div>
								</div>
								
								<div class="col-md-6">
									<div  class="panel">
										<div  class="panel-body" style="background-color: white; ">
											<h3> 비밀번호 찾기 </h3>
											<form action="findpwd.do" method="post">
												<div class="form-group">
													<label style="float:left;" class="control-label" for="id">아이디</label>
													<input class="form-control" type="text" id="id" placeholder="회원가입시 입력한 아이디를 입력하세요." name="id" />
												</div>	
												<div  class="form-group">
													<label style="float:left;" class="control-label" for="email">이메일</label>
													<input class="form-control" type="text" id="email" placeholder="회원가입시 입력한 이메일을 입력하세요." name="email"/>
												</div>
												<button style="float:right" class="btn btn-primary" type="submit">비밀번호 찾기</button>
											</form>	
										</div>
									</div>							
								</div>
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