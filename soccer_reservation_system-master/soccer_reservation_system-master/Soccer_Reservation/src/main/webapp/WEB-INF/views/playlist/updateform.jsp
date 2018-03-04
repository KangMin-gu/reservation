<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Soccer_Reservation</title>
 <%@ include file="../include/header_script.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/pl-updateform.css" />

</head>
<body>
 <%@ include file="../include/header.jsp" %>
	<!-- ===========소제목============ -->
	<div class="container">
		<div class="row">
			<div class="divider col-sm-12 col-xs-12 col-md-12">
				<div class="header-text">
					Field <span>Update</span>
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
			<div class="col-md-offset-2 col-md-8 text-center">
				<div class="panel">
					<div class="panel-body" style="background-color: #def0f1;">

						<div class="text-center">
							<form action="update.do" method="post" id="myForm">
								<input type="hidden" name="num" value="${dto.num }"/>
								<label style="float:left; margin-top: 15px; margin-left: 70px;" for="field_name">운동장이름</label>
								<input  type="text" name="field_name" id="field_name" value="${dto.field_name}"    />
								</br>
								<label style="float:left; margin-top: 15px; margin-left: 70px;" for="field_addr">운동장주소</label>
								<input type="text" name="field_addr" id="field_addr" value="${dto.field_addr }"  />
								</br>
								<label style="float:left; margin-top: 15px; margin-right: 12px; margin-left: 70px;"  for="field_morning">오전시간</label>
								<input type="text" name="field_morning" id="field_morning" value="${dto.field_morning }" />
								</br>
								<label style="float:left; margin-top: 15px; margin-right: 12px; margin-left: 70px;" for="field_afternoon">오후시간</label>
								<input type="text" name="field_afternoon" id="field_afternoon" value="${dto.field_afternoon }" />
								</br>
								<label style="float:left; margin-top: 15px; margin-right: 12px; margin-left: 70px;" for="field_night">저녁시간</label>
								<input type="text" name="field_night" id="field_night" style="margin-bottom: 20px;" value="${dto.field_night }" />
								<br/>
								<button class="btn btn-default" type="submit">수정</button>
								<a class="btn btn-default" href="playlist.do">취소</a>

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
