<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recipe Create</title>

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
    <style>
    	form {
    		margin: 0 auto;
    		width:500px;
    	}
    </style>
    
<body>


<jsp:include page="header.jsp" />
<div class="container">
<br><br><br><br>
 <div class="comment-form-wrap pt-5">
<form action="recipeCreatePro.eat" method="post" enctype="multipart/form-data">
<input type = "radio" name = "cate" value = "1" required>밥요리
<input type = "radio" name = "cate" value = "2" required>국&탕
<input type = "radio" name = "cate" value = "3" required>찌개&전골
<input type = "radio" name = "cate" value = "4" required>밑반찬
<input type = "radio" name = "cate" value = "5" required>볶음요리
<input type = "radio" name = "cate" value = "6" required>구이(고기/생선)
<input type = "radio" name = "cate" value = "7" required>찜&조림
<input type = "radio" name = "cate" value = "8" required>손님상
<input type = "radio" name = "cate" value = "9" required>아이 반찬
<input type = "radio" name = "cate" value = "10" required>김치 장아찌
<input type = "radio" name = "cate" value = "11" required>도시락
<input type = "radio" name = "cate" value = "12" required>튀김
<input type = "radio" name = "cate" value = "13" required>면요리
<input type = "radio" name = "cate" value = "14" required>샐러드
<input type = "radio" name = "cate" value = "15" required>야식&술안주
<input type = "radio" name = "cate" value = "16" required>스파게티
<input type = "radio" name = "cate" value = "17" required>간식&분식
<input type = "radio" name = "cate" value = "18" required>토스트&샌드위치
<input type = "radio" name = "cate" value = "19" required>베이킹
<input type = "radio" name = "cate" value = "20" required>디저트
<input type = "radio" name = "cate" value = "21" required>주스&음료
<input type = "radio" name = "cate" value = "22" required>술&칵테일
<input type = "radio" name = "cate" value = "23" required>명절요리

<h1>왜 안나와${count }</h1>
<input type="hidden" name="cnum" value="${count }">
	<div class="form-group">
	<input type="file" name="main_name" class="form-control"  />
	</div>
	
	<div class="form-group">
	<input class="form-control" type="text" name="title" placeholder="제목을 입력하세요." >  
	</div>
	
	<div class="form-group">
	<textarea name="mate" cols="30" rows="10" class="form-control" placeholder="재료를 입력하세요"></textarea>
	</div> 
	
	<div class="form-group">
	<textarea name="pro" cols="30" rows="10" class="form-control" placeholder="조리법을 입력하세요"></textarea>
	</div> 
			
       <div class="form-group">
      <input type="submit" value="레시피 등록"  class="btn py-3 px-4 btn-primary"  />
      </div>
</form>
   
 </div>
</div>
<jsp:include page="footer.jsp" />
<!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="/eatoday/resource/js/jquery.min.js"></script>
  <script src="/eatoday/resource/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/eatoday/resource/js/popper.min.js"></script>
  <script src="/eatoday/resource/js/bootstrap.min.js"></script>
  <script src="/eatoday/resource/js/jquery.easing.1.3.js"></script>
  <script src="/eatoday/resource/js/jquery.waypoints.min.js"></script>
  <script src="/eatoday/resource/js/jquery.stellar.min.js"></script>
  <script src="/eatoday/resource/js/owl.carousel.min.js"></script>
  <script src="/eatoday/resource/js/jquery.magnific-popup.min.js"></script>
  <script src="/eatoday/resource/js/aos.js"></script>
  <script src="/eatoday/resource/js/jquery.animateNumber.min.js"></script>
  <script src="/eatoday/resource/js/bootstrap-datepicker.js"></script>
  <script src="/eatoday/resource/js/jquery.timepicker.min.js"></script>
  <script src="/eatoday/resource/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="/eatoday/resource/js/google-map.js"></script>
  <script src="/eatoday/resource/js/main.js"></script>
</body>
</html>