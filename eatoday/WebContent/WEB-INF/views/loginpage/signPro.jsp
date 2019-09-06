<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${result ==0 }">
	<c:if test="${social ==1}">
		<script>
			alert("가입이 완료 되었습니다.");
			location= "loginPro.eat?id="+${sid}+"&pw="+${spw}+";"
		</script>
	</c:if>
	<c:if test="${social !=1}">
		<script>
			alert("가입이 완료 되었습니다.");
			location= "loginPro.eat";
		</script>
		</c:if>
	</c:when>	
	<c:otherwise>
		<script>
			alert("이미 존재하는 아이디 입니다.");
			history.go(-1);
		</script>
	</c:otherwise>
</c:choose>