<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${result ==0 }">
		<script>
			location= "Foodselect.eat?id="+${id}+"&pw="+${pw}";
		</script>
	</c:when>	
	<c:otherwise>
		<script>
			location= "loginPro.eat?id="+${id}+"&pw="+${pw}";
		</script>
	</c:otherwise>
</c:choose>