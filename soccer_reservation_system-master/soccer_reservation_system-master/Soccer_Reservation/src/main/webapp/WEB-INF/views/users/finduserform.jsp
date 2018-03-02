<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>비밀번호찾기 페이지입니다.</p>
<form action="findid.do" method="post">

	<label for="name">이름</label>
	<input type="text" id="name" name="name" />
	<label for="email">이메일</label>
	<input type="text" id="email" name="email" />
	<button type="submit">아이디 찾기</button>
	
</form>

<form action="findpwd.do" method="post">

	<label for="id">아이디</label>
	<input type="text" id="id" name="id" />
	<label for="email">이메일</label>
	<input type="text" id="email" name="email"/>
	<button type="submit">비밀번호 찾기</button>
	
</form>
</body>
</html>