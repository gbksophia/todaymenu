<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- idCheck ���, 0=�̰���  -->
<c:choose>
	<c:when test="${result ==0 }">
		<c:redirect url="loginPro.eat">
			<c:param name="id" value="${vo.getId()}"/>
			<c:param name="pw" value="${vo.getPw()}"/>
			<c:param name="sign" value="1"/>
		</c:redirect>
	</c:when>	
	<c:otherwise>
		<script>
			alert("�̹� �����ϴ� ���̵� �Դϴ�.");
			history.go(-1);
		</script>
	</c:otherwise>
</c:choose>