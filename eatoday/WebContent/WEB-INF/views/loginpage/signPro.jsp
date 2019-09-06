<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${result ==0 }">
		<script>
			alert("가입이 완료 되었습니다.");
			location= "loginPro.eat";
		</script>
	</c:when>	
	<c:otherwise>
		<script>
			alert("이미 존재하는 아이디 입니다.");
			history.go(-1);
		</script>
	</c:otherwise>
</c:choose>