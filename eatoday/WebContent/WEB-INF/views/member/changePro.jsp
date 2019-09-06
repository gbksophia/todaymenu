<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${result == 1 }">
		<script>
			alert("비밀번호가 일치 하지 않습니다.");
			history.go(-1);
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("변경이 완료 되었습니다.");
			location = "information.eat";
		</script>
	</c:otherwise>
</c:choose>