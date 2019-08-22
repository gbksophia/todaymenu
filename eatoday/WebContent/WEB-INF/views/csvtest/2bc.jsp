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
${size} <br/>
${s}

<table>
	<tr>
		<td>${text}<br/></td>
	</tr>
	<tr>
		<td>${mate}<br/></td>
	</tr>
</table>


<c:forEach begin="0" end="${size}" step="1" var="i">
</c:forEach>

</body>
</html>