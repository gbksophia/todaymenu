<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${result ==0 }">
		<script>
			alert("������ �Ϸ� �Ǿ����ϴ�.");
			location= "loginPro.eat";
		</script>
	</c:when>	
	<c:otherwise>
		<script>
			alert("�̹� �����ϴ� ���̵� �Դϴ�.");
			history.go(-1);
		</script>
	</c:otherwise>
</c:choose>