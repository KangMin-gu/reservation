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
alert("${id} 탈퇴처리 되었습니다. ");
location.href="${pageContext.request.contextPath}/";
</script>
</body>
</html>