<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">	
<link href="${pageContext.request.contextPath}/resources/css/styles.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/demo.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/testimonial.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link href='http://fonts.googleapis.com/css?family=Poiret+One'rel='stylesheet' type='text/css'>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rv-insertform.css" />

</head>
<body>
 <%@ include file="../include/header.jsp" %>

<div class="container">
	<div class="row">
		<div class="divider col-sm-12 col-xs-12 col-md-12">
			<div class="header-text">
				Field <span>Reservation</span>
									<div class="container header-start text-center">
					<div class="heading-icon" style="margin-top:50px;">
						<img src="https://png.icons8.com/material/96/000000/stadium.png">
					</div>
					<p class="text-center sub-text">
						<em class="first-line">예약정보를 추가로 입력해주세요!</em>
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
			<div class="col-md-offset-2 col-md-8 text-center">
				<div  class="panel">
					<div  class="panel-body" style="background-color: #def0f1; ">

									
						<div class="text-center">
						
								<form action="rvinsert.do?num=${dto.num }" method="POST" id="rvform">
								
								<div class="form-group">
									<label style="float:left; margin-top: 15px; margin-left: 70px;" for="field_name">운동장 이름</label>
									<input type="hidden" id="field_name" name="field_name" value="${field_name }"/>
									<input type="text" id="field_name" name="field_name" value="${field_name }" disabled/>
								</div>
								
								<div class="form-group">
									<label style="float:left; margin-top: 15px; margin-left: 70px;" for="field_date">예약 날짜</label>
									<input type="hidden" id="field_date" name="field_date" value="${field_date }"/>
									<input type="text" id="field_date" name="field_date" value="${field_date }" disabled/>
								</div>
								
								<div class="form-group">
									<label style="float:left; margin-top: 15px; margin-left: 70px;" for="rv_time">예약할시간대</label>
									<input type="text" id="rv_time" name="rv_time" value="${rv_time }"/>
								</div>
								<div class="form-group">
									<label style="float:left; margin-top: 15px; margin-left: 70px;" for="id">예약자 ID</label>
									<input type="text" id="id" name="id" value="${id}"/>
								</div>
								<div class="form-group">
									<label style="float:left; margin-top: 15px; margin-left: 70px;" for="team">예약팀명</label>
									<input type="text" id="team" name="team" placeholder="이용하시는 팀이름을 적어주세요."/>
								</div>
								<div class="form-group">
									<label style="float:left; margin-top: 15px; margin-left: 70px;" for="phone">예약자 전화번호</label>
									<input type="text" id="phone" name="phone" value="${phone }"/>
								</div>
								<div class="form-group" style="margin-left:170px;">
									<label style="float:left; margin-top: 15px; margin-left: -100px; margin-bottom: 20px;" 
									for="teamNP">예약팀인원수</label>
									<select name="teamNP" id="teamNP">
										<option>--이용 인원 선택--</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="11">11</option>	
									</select>
								</div>
								<div class="form-group" style="    margin-top: 9px;">
									<label style="float:left; margin-top: 15px;   margin-left: -100px;" for="etc">기타입력사항</label>
									<textarea rows="5" cols="50" id="etc" name="etc"></textarea>
								</div>
									<button style="margin-top: 10px;" class="btn btn-primary" id="submit" type="submit">예약하기</button>
								</form>
							</div>					
						</div>
					</div>
				</div>
			</div>
		</div>




 <%@ include file="../include/footer.jsp" %>
 <%@ include file="../include/footer_script.jsp" %>

<script type="text/javascript">


$("#rvform").submit(function(){
	
	if($("#team").val() == ""){
		alert("팀명을 넣어주세요!");
		$("#team").focus();
		return false;
	}else if($("#teamNP").val()=="--이용 인원 선택--"){
		alert("이용 인원수를 선택해주세요.");
		$("#teamNP").focus();
		return false;	
	}else{
		return true;
	}
	
});
</script>
</body>
</html>