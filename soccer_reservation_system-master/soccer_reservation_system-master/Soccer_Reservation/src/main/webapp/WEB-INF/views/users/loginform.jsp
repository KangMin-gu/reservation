<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/loginform.do</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/us-loginform.css" />

</head>
<body>



  <form class="form-signin" action="login.do" method="post">
      <input type="hidden" name="url" value="${url }"/>
      <div class="text-center mb-4">
      <div class="heading-icon">
        
      </div>
       <img src="${pageContext.request.contextPath }/resources/img/icons8-soccer-96.png">
        <h1 class="main-text text-center">Login</h1>
      </div>
	 
      <div class="form-label-group">
        <input name="id" type="text" id="id" class="form-control" placeholder="아이디" required autofocus>
        <label for="id">아이디</label>
      </div>

      <div class="form-label-group">
        <input name="pwd" type="password" id="pwd" class="form-control" placeholder="비밀번호" required>
        <label for="pwd">비밀번호</label>
      </div>

      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" id="isSave"> Remember me
        </label>
      </div>
      <button id="Btn"  class="btn btn-lg  btn-block" type="submit">Sign in</button>
    </form>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.js"></script>
<script>
	
	
	// localStorage 에 저장된 아이디 비밀번호가 있으면 복구시켜준다.
	if(localStorage.id != undefined){
		$("#id").val(localStorage.id);
		$("#pwd").val(localStorage.pwd);
		//체크박스 체크해주기
		$("#isSave").prop("checked", true);
	}


	//폼 전송 이벤트가 발생했을때 실행할 함수 등록
	$(".form-signin").on("submit", function(){
		//아이디 비밀번호 저장여부 
		var isSave=$("#isSave").is(":checked");
		if(isSave){
			//입력한 아이디 비밀번호를 읽어와서
			var inputId=$("#id").val();
			var inputPwd=$("#pwd").val();
			//localStorage 에 저장한다.
			localStorage.id=inputId;
			localStorage.pwd=inputPwd;
		}else{
			//localStorage 에 id, pwd 삭제하기 
			delete localStorage.id;
			delete localStorage.pwd;
		}
	});
</script>

</body>
</html>