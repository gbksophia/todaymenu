<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${result ==1 }">
		<script>
			alert("${id}님 환영합니다.");
			location= "index.eat";
		</script>
	</c:when>	
	<c:otherwise>
		<script>
			alert("id/pw를 확인해주십시오.");
			history.go(-1);
		</script>
	</c:otherwise>
</c:choose>