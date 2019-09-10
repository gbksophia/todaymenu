<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 먹지? 레시피 찜 리스트</title>

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
<script type="text/javascript">
		function jjimCheck(i,cnum){
		   var id = '${sessionScope.loginID}';
		   var imgtag = "jjimImg"+i;
		   var imgid = "btn_jjim"+i;
		   $.ajax({
		          url: "/eatoday/memberpage/recipeJjim.eat",
		          type: "post",
		          data: {id : id, cnum : cnum },
		          success: function(data) {
		        	  var elem = document.createElement("img");
		        	  elem.setAttribute("src", data);
		        	  elem.setAttribute("height", "50px");
		      		  elem.setAttribute("width", "50px");
		      		  elem.setAttribute("id", imgid);
		      		 document.getElementById(imgtag).appendChild(elem);	
		        	  }
		    	  });
		   }

	  function jjimClick(i,cnum){
		  var id = '${sessionScope.loginID}';
			var img = 'btn_jjim'+i;
		   if(${sessionScope.loginID == null}){
				alert("로그인 후 이용해 주십시오.");
			   } else {
		   $.ajax({
		          url: "/eatoday/memberpage/recipeJjimClick.eat",
		          type: "post",
		          data: {id : id, cnum : cnum },
		          success: function(data) {
		        	  document.getElementById(img).src=data;
		        	  }
		    	  });
		  }
	  }
</script>

<jsp:include page="../homepage/header.jsp" />
<div class="container">
<br><br><br><br>
<c:set var="i" value="0"/>
<table class="table table-bordered">
	<tr> 
		<td> 음식 사진 </td>
		<td> 음식 이름 </td>
		<td> 찜</td>
	</tr>
	<c:forEach var="jjimVO" items="${jjimList }">
	<tr>
		<td><img src="/eatoday/resource/RecipeImages/${jjimVO.main_name }" style="height: 150px;width: 150px;"></td>
		<td><a href="/eatoday/homepage/recipeDetail.eat?cnum=${jjimVO.con_num }" >${jjimVO.title }</a></td>
		<td>
		<a id="jjimImg${i}" onclick="javascript:jjimClick('${i}',${jjimVO.con_num })"></a>
		<script type="text/javascript">
		jjimCheck('${i}','${jjimVO.con_num}');
		</script>
		</td>
	</tr>
	<c:set var="i" value="${i+1 }"/>
	</c:forEach>
</table>
</div>
</body>
</html>