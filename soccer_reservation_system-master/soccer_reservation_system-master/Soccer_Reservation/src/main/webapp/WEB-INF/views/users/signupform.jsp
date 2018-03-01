<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/signupform.do</title>
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

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/signupform.css" />


</head>
<body>
<div class="header container">
		<!-- 세션에 id의 유무에따라 보여지는 loginView -->
		<c:choose>
			<c:when test="${not empty id }">
				<div>
					<ul id="loginUl">
						<li class="loginLi"><a href="users/info.do">My info</a></li>
						<li class="loginLi"><a href="users/logout.do">Logout</a></li>
					</ul>
				</div>
			</c:when>
			<c:otherwise>
				<div>
					<ul id="loginUl">
						<li class="loginLi"><a href="${pageContext.request.contextPath}/users/loginform.do">Login</a></li>
						<li class="loginLi"><a href="signupform.do">SignUp</a></li>
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
	
	<div class="container">
		<div class="row">
			<div class="divider col-sm-12 col-xs-12 col-md-12">
				<div class="header-text">
					 Sing<span>Up</span>
				</div>
				<div class="container header-start text-center">
					<div class="heading-icon" style="width: 17%;">
						<img style="max-width:100%;" src="${pageContext.request.contextPath}/resources/img/user.png">
					</div>
				</div>	
			</div>
		</div>
	</div>

	<!-- ============본문============== -->
    	<div class="container" style="margin-top: 50px; margin-bottom: 50px;">
           <div class="row">
           		<div class="col-md-12 " style="background-color: white;" >         
					<div class="container">
						<div class="row">
							<div class="col-lg-6 col-lg-offset-3" >
								<form action="signup.do" method="post" id="myForm" style="margin-top: 50px; margin-bottom:50px;" >
								
									<div id="checkid" class="form-group has-feedback" >
										<label for="id" class="control-label">아이디</label>
										<input type="text" name="id" id="id" oninput="checkId()" placeholder="아이디" class="form-control"/>
										<span id="glyphiconid" class="glyphicon form-control-feedback"></span> 
										<p class="help-block" id="checkidResult"></p><br/>
									</div>
									<div id="checkpwd" class="form-group has-feedback" >
										<label for="pwd" class="control-label">비밀번호</label>
										<input type="password" name="pwd" id="pwd" oninput="checkPwd()" placeholder="비밀번호" class="form-control"/>
										<span id="glyphiconpwd" class="glyphicon form-control-feedback"></span> 
										<p class="help-block" id="checkpwdResult"></p><br/>
									</div>
									
									<div id="checkpwd2" class="form-group has-feedback" >
										<label for="pwd2" class="control-label">비밀번호 확인</label>
										<input type="password" name="pwd2" id="pwd2" oninput="checkPwd2()" placeholder="비밀번호 확인" class="form-control"/>
										<span id="glyphiconpwd2" class="glyphicon form-control-feedback"></span> 
										<p class="help-block" id="checkpwd2Result"></p><br/>
									</div>
									
									<div class="form-group">
										<p class="help-block">비밀번호를 찾으실때 필요한 질문과 답변 입니다.</p>
												<label for="findQuestion">질문 선택</label>
												<select name="findQuestion" id="findQuestion" class="">
													<option value="나의 초등학교 이름은?">나의 초등학교 이름은?</option>
													<option value="나의 중학교 이름은?">나의 중학교 이름은?</option>
													<option value="나의 고등학교 이름은?">나의 고등학교 이름은?</option>
													<option value="나의 대학교 이름은?">나의 대학교 이름은?</option>
												</select>	
									</div><br/>
											
									<div id="checkfindAnswer" class="form-group">
										<label for="findAnswer">질문 답변</label>
										<input type="text" name="findAnswer" id="findAnswer" placeholder="비밀번호 찾기 답변" class="form-control"/>
									</div><br/>
									
									<div class="form-group">
										<label for="name">이름</label>
										<input type="text" name="name" id="name" placeholder="이름" class="form-control"/>
									</div>
									
									<div id="checkemail" class="form-group has-feedback" >
										<label for="email" class="control-label">이메일</label>
										<input type="text" name="email" id="email" oninput="checkEmail()" placeholder="이메일" class="form-control"/>
										<span id="glyphiconemail" class="glyphicon form-control-feedback"></span> 
										<p class="help-block" id="checkemailResult"></p><br/>
									</div>
									
									<div id="checkphone" class="form-group has-feedback" >
										<label for="phone" class="control-label">휴대전화</label>
										<input type="text" name="phone" id="phone" oninput="checkPhone()" placeholder="휴대전화" class="form-control"/>
										<span id="glyphiconphone" class="glyphicon form-control-feedback"></span> 
										<p class="help-block" id="checkphoneResult"></p><br/>
									</div>
										
									<div class="form-inline form-group">
										<p class="help-block">우편번호 찾기로 주소를 입력해주세요.</p>
										<label for="addr">우편번호</label>																	
										<input type="text" name="post" id="post" placeholder="우편번호" style="width: 30%;" class="form-control"/>	
										<a class="btn btn-default" href="javascript:void(0);" onclick="findPostbtn();">우편번호 찾기</a>		
														
									</div>
									
									<div id="checkaddr" class="form-group">
										<label for="addr">주소</label>
										<input type="text" name="addr" id="addr" placeholder="주소" class="form-control"/>
									</div>
									
									<div id="checkdetailaddr" class="form-group">
										<label for="detailaddr">상세주소</label>
										<input type="text" name="detailaddr" id="detailaddr" placeholder="상세주소" class="form-control"/>
										<span id="glyphicondetailaddr" class="glyphicon form-control-feedback"></span>
										<p class="help-block" id="checkdetailaddr"></p>
									</div><br/>
										<a class="btn btn-warning" style="float:right; margin-right:20px;" href="${pageContext.request.contextPath}/">취소</a>
										<button class="btn btn-primary" style="float:right; margin-right:20px;" type="submit" id="submit" disabled="disabled">가입하기</button>
				
									</form>
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
	
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
			<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/nav-hover.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<!-- 다음 주소 api -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
<script>

 /* 다음주소찾기 api  */
function findPostbtn() {
    new daum.Postcode({
    	
        oncomplete: function(data) {     	       	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('post').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('addr').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('detailaddr').focus();
        },
        
    	theme: {
    		bgColor: "#DEF0F1",
    		searchBgColor: "#DEF0F1"
    	}
    	 	
    }).open();
}
 
 	


/* 실시간으로 id를 check하여 확인한다.  */
	var idValid=false;

	function checkId(){
		
		var inputId=$("#id").val();	
		var regId=/^[a-zA-Z][a-zA-Z0-9]{4,11}$/; //아이디 
		
		console.log(inputId);
		if(inputId == ""){
			$("#checkid").removeClass('has-error');
			$("#checkid").removeClass('has-success');
			$("#glyphiconid").removeClass("glyphicon-remove");
			$("#glyphiconid").removeClass("glyphicon-ok");
			$("#submit").attr('disabled', true);
			$("#submit").remove('disabled', false);
			$("#checkidResult").text("").css('color', '');
			return;
		}else if(regId.test($("#id").val())==false){	
			$("#checkidResult").text("아이디는 영문자로 시작하여 숫자포함 최소 5-12글자로 입력하세요.").css("color", "red");
			$("#checkid").addClass('has-error');
			$("#checkid").removeClass('has-success');
			$("#glyphiconid").removeClass("glyphicon-ok");
			$("#glyphiconid").addClass("glyphicon-remove");
			$("#submit").attr('disabled', true);
			$("#submit").remove('disabled', false);
			return ;
			}
		
		$.ajax({
			url:"checkid.do", 
			method:"GET",
			data: {"inputId":inputId},
			success:function(data){  
				
				var regId=/^[a-zA-Z][a-zA-Z0-9]{4,9}$/; //아이디 
				
				if(data.canUse){
					$("#checkidResult").text("입력하신 ID는 사용가능 합니다.").css("color", "green");
					idValid = true;
					$("#checkid").addClass('has-success');
					$("#checkid").removeClass('has-error');
					$("#glyphiconid").addClass("glyphicon-ok");
					$("#glyphiconid").removeClass("glyphicon-remove");
					$("#id").addClass("form-control-success");
					$("#submit").attr('disabled', false);
				}else{
					$("#checkidResult").text("입력하신 ID는 사용 불가능 합니다.").css("color", "red");
					idValid = false;
					$("#checkid").addClass('has-error');
					$("#checkid").removeClass('has-success');
					$("#glyphiconid").addClass("glyphicon-remove");
					$("#glyphiconid").removeClass("glyphicon-ok");
					$("#submit").attr('disabled', true);
				}
			}
		});
	}

	/* 비밀번호체크 */
	function checkPwd(){
		
		var regPwd=/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/; //비밀번호 
		var inputPwd = $("#pwd").val();
		console.log(inputPwd);
		
		if($("#pwd").val() == ""){
			$("#checkpwd").removeClass('has-error');
			$("#checkpwd").removeClass('has-success');
			$("#glyphiconpwd").removeClass("glyphicon-remove");
			$("#glyphiconpwd").removeClass("glyphicon-ok");
			$("#submit").attr('disabled', true);
			$("#submit").remove('disabled', false);
			$("#checkpwdResult").text("").css('color', '');
			return;
		}
		
		if(regPwd.test($("#pwd").val()) == false){
			$("#checkpwdResult").text("비밀번호는 8-16글자, 특수문자를 최소 하나 포함 해 주세요.").css("color", "red");
			$("#checkpwd").addClass('has-error');
			$("#checkpwd").removeClass('has-success');
			$("#glyphiconpwd").removeClass("glyphicon-ok");
			$("#glyphiconpwd").addClass("glyphicon-remove");
			$("#submit").attr('disabled', true);
			$("#submit").remove('disabled', false);
			return ;
		}else{
			$("#checkpwdResult").text("").css("color", "");
			$("#checkpwd").removeClass('has-error');
			$("#checkpwd").addClass('has-success');
			$("#glyphiconpwd").removeClass("glyphicon-remove");
			$("#glyphiconpwd").addClass("glyphicon-ok");
			$("#submit").attr('disabled', false);
			$("#submit").remove('disabled', true);
			return ;
		}
			
	}
	
	//비밀번호 확인	
	function checkPwd2(){
		var inputPwd2 = $("#pwd2").val();
		
		if($("#pwd2").val() == ""){
			$("#checkpwd2").removeClass('has-error');
			$("#checkpwd2").removeClass('has-success');
			$("#glyphiconpwd2").removeClass("glyphicon-remove");
			$("#glyphiconpwd2").removeClass("glyphicon-ok");
			$("#submit").attr('disabled', true);
			$("#submit").remove('disabled', false);
			$("#checkpwd2Result").text("").css('color', '');
			return;
		}
		
		if($("#pwd2").val() != $("#pwd").val()){
			$("#checkpwd2Result").text("비밀번호가 같지 않습니다.").css("color", "red");
			$("#checkpwd2").addClass('has-error');
			$("#checkpwd2").removeClass('has-success');
			$("#glyphiconpwd2").removeClass("glyphicon-ok");
			$("#glyphiconpwd2").addClass("glyphicon-remove");
			$("#submit").attr('disabled', true);
			$("#submit").remove('disabled', false);
			return ;
		}else{
			$("#checkpwd2Result").text("").css("color", "");
			$("#checkpwd2").removeClass('has-error');
			$("#checkpwd2").addClass('has-success');
			$("#glyphiconpwd2").addClass("glyphicon-ok");
			$("#glyphiconpwd2").removeClass("glyphicon-remove");
			$("#submit").attr('disabled', false);
			$("#submit").remove('disabled', true);
			return ;
		}
		
	}
	
	//이메일 유효성 검사
	function checkEmail(){
		var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i; //이메일유효성검사식 
		var email = $("#email").val();
		
		if($("#email").val() == ""){
			$("#checkemail").removeClass('has-error');
			$("#checkemail").removeClass('has-success');
			$("#glyphiconemail").removeClass("glyphicon-remove");
			$("#glyphiconemail").removeClass("glyphicon-ok");
			$("#submit").attr('disabled', true);
			$("#submit").remove('disabled', false);
			$("#checkemailResult").text("").css('color', '');
			return;
		}
		
		if(regEmail.test($("#email").val()) == false){
			$("#checkemailResult").text("이메일형식을 다시 한번 확인해 주세요.").css("color", "red");
			$("#checkemail").addClass('has-error');
			$("#checkemail").removeClass('has-success');
			$("#glyphiconemail").removeClass("glyphicon-ok");
			$("#glyphiconemail").addClass("glyphicon-remove");
			$("#submit").attr('disabled', true);
			$("#submit").remove('disabled', false);
			return ;
		}else{
			$("#checkemailResult").text("").css("color", "");
			$("#checkemail").removeClass('has-error');
			$("#checkemail").addClass('has-success');
			$("#glyphiconemail").addClass("glyphicon-ok");
			$("#glyphiconemail").removeClass("glyphicon-remove");
			$("#submit").attr('disabled', false);
			$("#submit").remove('disabled', true);
			return ;
		}
		
	}
	
	//휴대전화 유효성검사
	function checkPhone(){
		var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;	// 핸드폰번호 유효성 검사식
		var phone = $("#phone").val();
		
		if($("#phone").val() == ""){
			$("#checkphone").removeClass('has-error');
			$("#checkphone").removeClass('has-success');
			$("#glyphiconphone").removeClass("glyphicon-remove");
			$("#glyphiconphone").removeClass("glyphicon-ok");
			$("#submit").attr('disabled', true);
			$("#submit").remove('disabled', false);
			$("#checkphoneResult").text("").css('color', '');
			return;
		}
		
		if(regPhone.test($("#phone").val()) == false){
			$("#checkphoneResult").text("전화번호에 -를 빼고 숫자만 입력해주세요.").css("color", "red");
			$("#checkphone").addClass('has-error');
			$("#checkphone").removeClass('has-success');
			$("#glyphiconphone").removeClass("glyphicon-ok");
			$("#glyphiconphonel").addClass("glyphicon-remove");
			$("#submit").attr('disabled', true);
			$("#submit").remove('disabled', false);
			return ;
		}else{
			$("#checkphoneResult").text("").css("color", "");
			$("#checkphone").removeClass('has-error');
			$("#checkphone").addClass('has-success');
			$("#glyphiconphone").addClass("glyphicon-ok");
			$("#glyphiconphone").removeClass("glyphicon-remove");
			$("#submit").attr('disabled', false);
			$("#submit").remove('disabled', true);
			return ;
		}
	}
	
	// 빈공백 제출시 form전송 막기
	
	$("#myForm").submit(function(){
	
		var regName=/^[가-힣]{2,15}|[a-zA-Z]{2,15}\s[a-zA-Z]{2,15}$/;	// 이름 유효성 검사식
		
		if($("#id").val() == ""){
			alert("아이디를 입력하세요.");
			$("#id").focus();
			return false;
		}else if($("#pwd").val() == ""){
			alert("비밀번호를 입력하세요.");
			$("#pwd").focus();
			return false;
		}else if($("#pwd2").val() == ""){
			alert("비밀번호를 확인 해주세요.");
			$("#pwd").focus();
			return false;
		}else if($("#findAnswer").val() == ""){
			alert("비밀번호 찾기 답변을 입력하세요.");
			$("#findAnswer").focus();
			return false;
		}else if($("#name").val() == ""){
			alert("이름을 입력 하세요.");
			$("#name").focus();
			return false;
		}else if(regName.test($("#name").val())==false){
			alert("이름은 한글, 영문 대소문자만 사용 가능 합니다.");
			$("#name").focus();
			return false;			
		}else if($("#email").val() == ""){
			alert("이메일을 입력하세요.");
			$("#email").focus();
			return false;			
		}else if($("#phone").val() == ""){
			alert("전화번호는 입력해주세요.");
			$("#phone").focus();
			return false;				
		}else if($("#addr").val()==""){
			alert("우편번호찾기를 통해 주소를 입력하세요.");
			$("#addr").focus();
			return false;
		}else if($("#detailaddr").val()==""){
			alert("상세주소를 입력해 주세요.");
			$("#detailaddr").focus();
			return false;
		}else{
			return true;
		}
	});
	
	
	
   
	
</script>
</body>
</html>










