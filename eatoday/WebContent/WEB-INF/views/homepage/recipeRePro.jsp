<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<c:redirect url="recipeDetail.eat">
	<c:param name="cnum" value="${cnum}"></c:param>
	<c:param name="cate" value="${cate}"></c:param>
</c:redirect>