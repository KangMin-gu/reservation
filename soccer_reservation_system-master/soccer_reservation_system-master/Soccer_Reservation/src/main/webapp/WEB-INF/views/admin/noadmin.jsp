<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Soccer_Reservation</title>
</head>
<body>
<script>
alert("${id}님은 해당 권한이 없어 메인 페이지로 이동합니다.");
location.href="${pageContext.request.contextPath}/";
</script>>
</body>
</html>