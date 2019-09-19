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
    	
    	.input1{
    		margin-right:10px;
    	}
    	
    	.input2{
    		margin-right:10px;
    		margin-bottom:10px;
    	}
    </style>
    
<body>


<jsp:include page="header.jsp" />
<div class="container">
<br><br><br><br>
 <div class="comment-form-wrap pt-5">

<form action="recipeCreateDetailPro.eat" method="post" enctype="multipart/form-data">

 <h1>${recipeCnum - 1}</h1><br>
 
<h4>레시피 세부 사진을 등록해주세요 (조리법 갯수에 맞춰서 이미지를 올리면 깔끔하게 보입니다.)</h4>
<h4> (*사진은 8개까지만 등록됩니다!)</h4><br>

<input type="hidden" name="cnum" value="${recipeCnum - 1}">
<br><br>
<h4>레시피 1번 사진을 등록해주세요</h4>
	<div class="form-group">
	<input type="file" name="img1" class="form-control"  />
	</div>
<h4>레시피 2번 사진을 등록해주세요</h4>
	<div class="form-group">
	<input type="file" name="img2" class="form-control"  />
	</div>

<h4>레시피 3번 사진을 등록해주세요</h4>
	<div class="form-group">
	<input type="file" name="img3" class="form-control"  />
	</div>
	
<h4>레시피 4번 사진을 등록해주세요</h4>
	<div class="form-group">
	<input type="file" name="img4" class="form-control"  />
	</div>	
<h4>레시피 5번 사진을 등록해주세요</h4>
	<div class="form-group">
	<input type="file" name="img5" class="form-control"  />
	</div>
<h4>레시피 6번 사진을 등록해주세요</h4>
	<div class="form-group">
	<input type="file" name="img6" class="form-control"  />
	</div>
<h4>레시피 7번 사진을 등록해주세요</h4>
	<div class="form-group">
	<input type="file" name="img7" class="form-control"  />
	</div>
<h4>레시피 8번 사진을 등록해주세요</h4>
	<div class="form-group">
	<input type="file" name="img8" class="form-control"  />
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