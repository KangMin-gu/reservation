<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	alert("${id}님 회원정보을 삭제 하였습니다.");
	location.href="${pageContext.request.contextPath}/admin/adminlist.do?id=${tmp.id}";
</script>
</body>
</html>