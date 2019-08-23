<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<c:forEach begin="0" end="${count}" step="1" var="i"> 
<c:set var="tbc" value="${tbcList[i]}" />
	<table border="1">
		<tr><td>${tbc.getText()}</td></tr>
		<tr><td>${tbc.getMate()}</td></tr>
		<tr><td>${tbc.getPro()}</td></tr>
	</table>
	<br/>
</c:forEach>
</body>
</html>