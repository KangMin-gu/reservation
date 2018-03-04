<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/signup_form.jsp</title>
 <%@ include file="../include/header_script.jsp" %>
<!-- 현재 페이지에 적용할 style.css 파일을 여기에서 로딩한다 -->	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/pl-insertform.css" />
</head>
<body>
<%@ include file="../include/header.jsp" %>
	<!-- ===========소제목============ -->
	<div class="container">
		<div class="row">
			<div class="divider col-sm-12 col-xs-12 col-md-12">
				<div class="header-text">
					Admin <span>Insert Ground</span>
										<div class="container header-start text-center">
						<div class="heading-icon">
							<img src="https://png.icons8.com/material/96/000000/stadium.png">
						</div>
					</div>	
				</div>
			</div>
		</div>
	</div>


<div class="container">
		<div class="row">
			<div class="hidden-xs col-md-offset-2 col-md-8 text-center">
				<div  class="panel">
					<div  class="panel-body" style="background-color: #def0f1; ">

						<div class="text-center">
							<form action="insert.do" method="post" id="myForm" 	enctype="multipart/form-data">
									
								<label style="float:left; margin-top: 15px; margin-left: 70px;" for="field_name" >운동장이름</label>
								<input type="text" name="field_name" id="field_name" placeholder="운동장이름" />
								</br>
								<label style="float:left; margin-top: 15px; margin-left: 70px;" for="field_addr">운동장주소</label>
								<input type="text" name="field_addr" id="field_addr" placeholder="운동장주소" />
								</br>
								<label style="float:left; margin-top: 15px; margin-right: 12px; margin-left: 70px;"  for="field_morning">오전시간</label>
								<input type="text" name="field_morning" id="field_morning"  placeholder="오전시간대" />
								</br>
								<label style="float:left; margin-top: 15px; margin-right: 12px; margin-left: 70px;" for="field_afternoon">오후시간</label>
								<input type="text" name="field_afternoon" id="field_afternoon" placeholder="오후시간대" />
								</br>
								<label style="float:left; margin-top: 15px; margin-right: 12px; margin-left: 70px;" for="field_night">저녁시간</label>
								<input type="text" name="field_night" id="field_night" style="margin-bottom: 20px;" placeholder="저녁시간대" />
								<br/>
								<label style="float:left; margin-top: 15px; margin-right: 12px; margin-left: 70px;" for="file">사진올리기</label>
								<input type="file" name="file" id="file" style="margin-bottom: 20px;"/>
								<br/>
								<button class="btn btn-default" type="submit">추가</button>
								<a class="btn btn-default" href="playlist.do">취소</a>

							</form>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ============FOOTER============= -->

	
 <%@ include file="../include/footer.jsp" %>
  <%@ include file="../include/footer_script.jsp" %>

</body>
</html>











