<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${result ==1 }">
		<script>
			alert("이미 추천을 누른 댓글입니다.");
			
		</script>
	</c:when>
</c:choose>