<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:choose>
	<c:when test="${!sessionScope.loginID.equals('admin@eatoday.com')}">
			<script>
				alert("권한이 없습니다.");
				history.go(-1);
			</script>
	</c:when>
	<c:otherwise>
		<c:redirect url="recipeReview.eat"/>
	</c:otherwise>
</c:choose>