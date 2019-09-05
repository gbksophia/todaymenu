<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
document.write("asdasd");
</script>
<body>
test.jsp<br/>

<c:forEach begin="0" end="10" step="1" var="i">
	<c:set var="rest" value="${restList[i]}" />
	<table border="1" id="resultList">
		<tr><td>${rest.getNum()}</td></tr>
		<tr><td>${rest.getStore()}</td></tr>
		<tr><td>${rest.getArea1()}</td></tr>
		<tr><td>${rest.getArea2()}</td></tr>
		<tr><td>${rest.getAddr()}</td></tr>
		<tr><td>${rest.getTel()}</td></tr>
		<tr><td>${rest.getCate()}</td></tr>
	</table>
	<br/>
</c:forEach>

</body>
</html>