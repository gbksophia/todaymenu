<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${result ==0 }">
	<c:if test="${social ==1}">
		<script>
			alert("������ �Ϸ� �Ǿ����ϴ�.");
			location= "loginPro.eat?id="+${sid}+"&pw="+${spw}+";"
		</script>
	</c:if>
	<c:if test="${social !=1}">
		<script>
			alert("������ �Ϸ� �Ǿ����ϴ�.");
			location= "loginPro.eat";
		</script>
		</c:if>
	</c:when>	
	<c:otherwise>
		<script>
			alert("�̹� �����ϴ� ���̵� �Դϴ�.");
			history.go(-1);
		</script>
	</c:otherwise>
</c:choose>