<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>2bc csv test</title>
</head>
<body>
	<table border="1">
	<c:forEach begin="0" end="${number}" step="1" var="i">
		<tr>
			<td>${number}<br/></td>
		</tr>
		<tr>
			<td>${text}<br/></td>
		</tr>
		<tr>
			<td>${mate}<br/></td>
		</tr>
		<tr>
			<td>${pro}<br/></td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>