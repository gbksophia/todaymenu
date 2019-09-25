<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${result ==1 }">
		<script>
			alert("재발급이 완료되었습니다. 메일을 확인해주십시오.");
			location ="/eatoday/loginpage/login.eat";
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("해당 아이디는 존재하지 않습니다.");
			history.go(-1);
		</script>
	</c:otherwise>
</c:choose>