<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error/data_access.jsp</title>
</head>
<body>
<script>
	alert("데이터 불러오는중 오류가 발생하여   메인페이지로 이동합니다. ");
	location.href="${pageContext.request.contextPath}/";
</script>
</body>
</html>











