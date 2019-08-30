<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>db->jsp</title>
</head>
<body>
<h1>${count}</h1>
<%-- <c:forEach begin="0" end="${count}" step="1" var="i">
<c:set var="rcp" value="${recipeList[i]}" />
	<table border="1">
		<tr><td>${rcp.getCate()}</td></tr>
		<tr><td>${rcp.getName()}</td></tr>
		<tr><td>${rcp.getMate()}</td></tr>
		<tr><td>${rcp.getPro()}</td></tr>
	</table>
	<br/>
</c:forEach> --%>


	<c:forEach begin="0" end="${count}" step="1" var="i">
	<c:set var="rest" value="${restList[i]}" />
	<c:if test="${rest.getCate() == '¼îÇÎ'}">
		<table border="1">
			<tr><td>${rest.getCnum()}</td></tr>
			<tr><td>${rest.getStore()}</td></tr>
			<tr><td>${rest.getArea1()}</td></tr>
			<tr><td>${rest.getArea2()}</td></tr>
			<tr><td>${rest.getAddr()}</td></tr>
			<tr><td>${rest.getTel()}</td></tr>
			<tr><td>${rest.getCate()}</td></tr>
		</table>
		<br/>
		</c:if>
	</c:forEach>


</body>
</html>
