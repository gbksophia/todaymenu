<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${result ==1 }">
		<c:if test="${sign ==1 }">
			<script>
			alert("ȸ������ ����!.");
			location= "/eatoday/homepage/index.eat";
		</script>
		</c:if>
		<script>
			alert("${id}�� ȯ���մϴ�.");
			location= "/eatoday/homepage/index.eat";
		</script>
	</c:when>	
	<c:otherwise>
		<script>
			alert("id/pw�� Ȯ�����ֽʽÿ�.");
			history.go(-1);
		</script>
	</c:otherwise>
</c:choose>