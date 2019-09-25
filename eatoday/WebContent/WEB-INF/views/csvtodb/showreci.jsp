<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>db->jsp</title>
</head>
<body>
<h1>${count}</h1>

Recipe List
<c:forEach begin="0" end="${count}" step="1" var="i">
	<c:set var="rcp" value="${recipeList[i]}" />
	<c:if test="${rcp.getCate() == 10}">
		<table border="1">
			<tr><td>cate: ${rcp.getCate()}</td></tr>
			<tr><td>con_num: ${rcp.getCon_num()}</td></tr>
			<tr><td>main_name: ${rcp.getMain_name()}</td></tr>
			<tr><td>title: ${rcp.getTitle()}</td></tr>
			<tr><td>mate: ${rcp.getMate()}</td></tr>
			<tr><td>pro: ${rcp.getPro()}</td></tr>
		</table>
		<br/>
	</c:if>
</c:forEach>

</body>
</html>
