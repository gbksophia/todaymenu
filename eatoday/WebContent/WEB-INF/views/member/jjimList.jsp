<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 먹지? 회원 관리</title>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="/eatoday/resource/js/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Great+Vibes" rel="stylesheet">

    <link rel="stylesheet" href="/eatoday/resource/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/eatoday/resource/css/animate.css">
    
    <link rel="stylesheet" href="/eatoday/resource/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/eatoday/resource/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/eatoday/resource/css/magnific-popup.css">

    <link rel="stylesheet" href="/eatoday/resource/css/aos.css">

    <link rel="stylesheet" href="/eatoday/resource/css/ionicons.min.css">

    <link rel="stylesheet" href="/eatoday/resource/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/eatoday/resource/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="/eatoday/resource/css/flaticon.css">
    <link rel="stylesheet" href="/eatoday/resource/css/icomoon.css">
    <link rel="stylesheet" href="/eatoday/resource/css/style.css">
</head>

<body>
<c:choose>
<c:when test="${!sessionScope.loginID.equals('admin@eatoday.com')}">
	<script>
		alert("이페이지를 볼 권한이 없습니다.");
		history.go(-1);
	</script>
</c:when>
<c:otherwise>
<script type="text/javascript">
	function remove(id){
			var result = confirm(id+"님을 탈퇴 시키겠습니까?");

			if(!result){
				alert("취소되었습니다.");
			} else {
				alert(id+"님을 탈퇴시키셨습니다.");
				location="memberRemove.eat?id="+id;
			}
		}
</script>

<jsp:include page="../homepage/header.jsp" />
<div class="container">
<br><br><br><br>
<table class="table table-bordered">
	<tr> 
		<td> 음식 사진 </td>
		<td> 음식 이름 </td>
	</tr>
	<c:forEach var="jjimVO" items="${jjimList }">
	<tr>
		<td><img src="/eatoday/resource/RecipeImages/${jjimVO.main_name }" style="height: 150px;width: 150px;"></td>
		<td><a href="/eatoday/homepage/recipeDetail.eat?cnum=${jjimVO.con_num }" >${jjimVO.title }</a></td>
	</tr>
	</c:forEach>
</table>
</div>
</c:otherwise>
</c:choose>
</body>
</html>