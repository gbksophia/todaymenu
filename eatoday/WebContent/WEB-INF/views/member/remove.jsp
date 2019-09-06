<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${result ==1 }">
		<script>
			alert("그동안 이용해주셔서 감사합니다. 안녕히 가십시오.");
			location = "/eatoday/homepage/index.eat";
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("패스워드를 다시 입력해주십시오.");
			history.go(-1);
		</script>
	</c:otherwise>
</c:choose>