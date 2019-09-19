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

<form action="recipeCreatePro.eat" method="post" enctype="multipart/form-data">

 <h1>레시피 등록하기</h1><br>
 
<h4>카테고리를 선택해주세요</h4><br>
<table>
	<thead>
		<tr>
			<th>
				<input type = "radio" name = "cate" value = "1" class = "input1" required>밥요리
			</th>
			<th>
				<input type = "radio" name = "cate" value = "2" class = "input2" required>국&탕
			</th>
			<th>
				<input type = "radio" name = "cate" value = "3" class = "input2" required>찌개&전골
			</th>
			<th>
				<input type = "radio" name = "cate" value = "4" class = "input2" required>밑반찬 
			</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>
				<input type = "radio" name = "cate" value = "5" class = "input1" required>볶음요리
			</th>
			<th>
				<input type = "radio" name = "cate" value = "6" class = "input2" required>구이(고기/생선)
			</th>
			<th>
				<input type = "radio" name = "cate" value = "7" class = "input2" required>찜&조림
			</th>
			<th>
				<input type = "radio" name = "cate" value = "8" class = "input2" required>손님상
			</th>
		</tr>
		<tr>
			<th>
				<input type = "radio" name = "cate" value = "9" class = "input1" required>아이 반찬
			</th>
			<th>
				<input type = "radio" name = "cate" value = "10" class = "input2" required>김치 장아찌
			</th>
			<th>
				<input type = "radio" name = "cate" value = "11" class = "input2" required>도시락
			</th>
			<th>
				<input type = "radio" name = "cate" value = "12" class = "input2" required>튀김
			</th>
		<tr>
			<th>
				<input type = "radio" name = "cate" value = "13" class = "input1" required>면요리
			</th>
			<th>
				<input type = "radio" name = "cate" value = "14" class = "input2" required>샐러드
			</th>
			<th>
				<input type = "radio" name = "cate" value = "15" class = "input2" required>야식&술안주
			</th>
			<th>
				<input type = "radio" name = "cate" value = "16" class = "input2" required>스파게티
			</th>
		</tr>
		<tr>
			<th>
				<input type = "radio" name = "cate" value = "17" class = "input1" required>간식&분식
			</th>
			<th>
				<input type = "radio" name = "cate" value = "18" class = "input2" required>토스트&샌드위치
			</th>
			<th>
				<input type = "radio" name = "cate" value = "19" class = "input2" required>베이킹
			</th>
			<th>
				<input type = "radio" name = "cate" value = "20" class = "input2" required>디저트
			</th>
		</tr>
		<tr>
			<th>
				<input type = "radio" name = "cate" value = "21" class = "input1" required>주스&음료
			</th>
			<th>
				<input type = "radio" name = "cate" value = "22" class = "input2" required>술&칵테일
			</th>
			<th>
				<input type = "radio" name = "cate" value = "23" class = "input2" required>명절요리
			</th>
		</tr>
	</tbody>
</table>

<input type="hidden" name="cnum" value="${recipeCnum }">
<br><br>
<h4>썸네일을 등록해주세요</h4>
	<div class="form-group">
	<input type="file" name="main_name" class="form-control"  />
	</div>
	<br>
<h4>제목을 입력하세요</h4>
	<div class="form-group">
	<input class="form-control" type="text" name="title" placeholder="제목을 입력하세요." >  
	</div>
	<br>
<h4>재료를 입력하세요</h4>	
	<div class="form-group">
	<textarea name="mate" cols="30" rows="10" class="form-control" placeholder="ex)주재료 Enter 밥,김가루... Enter 양념  Enter 간장....Enter"></textarea>
	</div> 
	<br>
<h4>조리법을 입력하세요</h4>
	<div class="form-group">
	<textarea name="pro" cols="30" rows="10" class="form-control" placeholder="ex)1.밥을 준비합니다. Enter 2.뭉칩니다. Enter ..."></textarea>
	</div> 
       <div class="form-group">
      <input type="submit" value="다음으로"  class="btn py-3 px-4 btn-primary"  />
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