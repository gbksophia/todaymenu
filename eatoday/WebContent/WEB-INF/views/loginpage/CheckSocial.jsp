<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- idCheck 결과, 0=미가입  -->
<c:choose>
	<c:when test="${result ==0 }">  
		<c:redirect url="Foodselect.eat">
			<c:param name="id" value="${id }"/>
			<c:param name="pw" value="${pw }"/>
		</c:redirect>
	</c:when>	
	<c:otherwise>
		<c:redirect url="loginPro.eat">
		<c:param name="id" value="${id }"/>
		<c:param name="pw" value="${pw }"/>
		<c:param name="sign" value="0"/>
	</c:redirect>
	</c:otherwise>
</c:choose>