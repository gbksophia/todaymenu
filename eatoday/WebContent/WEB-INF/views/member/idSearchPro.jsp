<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${result ==1 }">
		<script>
		alert("당신의 아이디는 ${id}입니다.");
		location ="/eatoday/loginpage/login.eat";
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("해당 코드값에 해당하는 아이디는 없습니다.");
			history.go(-1);
		</script>
	</c:otherwise>
</c:choose>