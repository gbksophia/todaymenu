<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>restaurant Create</title>

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
<jsp:include page="../homepage/header.jsp" />
<div class="container">
<br/><br/><br/><br/>
<div class="comment-form-wrap pt-5">
	<form action="restaurantCreatePro.eat" method="post" enctype="multipart/form-data">
	<h1>${restaurantCnum }식당 등록하기</h1><br>
	<h4>카테고리를 선택해주세요</h4><br>
	<table>
		<thead>
			<tr>
				<th>
					<input type = "radio" name = "cate" value = "한식" class = "input1" required>한식
				</th>
				<th>
					<input type = "radio" name = "cate" value = "중식" class = "input2" required>중식
				</th>
				<th>
					<input type = "radio" name = "cate" value = "일식" class = "input2" required>일식
				</th>
				<th>
					<input type = "radio" name = "cate" value = "양식" class = "input2" required>양식
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>
					<input type = "radio" name = "cate" value = "분식" class = "input1" required>분식
				</th>
				<th>
					<input type = "radio" name = "cate" value = "카페" class = "input2" required>카페
				</th>
				<th>
					<input type = "radio" name = "cate" value = "기타" class = "input2" required>기타
				</th>
			</tr>
		</tbody>
	</table>

	<h4>지역을 선택해주세요</h4><br/>
	<table>
		<thead>
			<tr>
				<th>
					<input type = "radio" name = "area1" value = "서울" class = "input1" required>서울
				</th>
				<th>
					<input type = "radio" name = "area1" value = "충청남도" class = "input2" required>충청남도
				</th>
				<th>
					<input type = "radio" name = "area1" value = "세종특별자치시" class = "input2" required>세종시
				</th>
				<th>
					<input type = "radio" name = "area1" value = "부산" class = "input2" required>부산
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>
					<input type = "radio" name = "area1" value = "인천" class = "input1" required>인천
				</th>
				<th>
					<input type = "radio" name = "area1" value = "울산" class = "input2" required>울산
				</th>
				<th>
					<input type = "radio" name = "area1" value = "충청북도" class = "input2" required>충청북도
				</th>
				<th>
					<input type = "radio" name = "area1" value = "경상북도" class = "input2" required>경상북도
				</th>
			</tr>
	
			<tr>
				<th>
					<input type = "radio" name = "area1" value = "강원도" class = "input1" required>강원도
				</th>
				<th>
					<input type = "radio" name = "area1" value = "전라남도" class = "input2" required>전라남도
				</th>
				<th>
					<input type = "radio" name = "area1" value = "대전" class = "input2" required>대전
				</th>
				<th>
					<input type = "radio" name = "area1" value = "광주" class = "input2" required>광주
				</th>
			</tr>
			<tr>
				<th>
					<input type = "radio" name = "area1" value = "경기도" class = "input1" required>경기도
				</th>
				<th>
					<input type = "radio" name = "area1" value = "전라북도" class = "input2" required>전라북도
				</th>
				<th>
					<input type = "radio" name = "area1" value = "제주도" class = "input2" required>제주도
				</th>
				<th>
					<input type = "radio" name = "area1" value = "대구" class = "input2" required>대구
				</th>
			</tr>
			<tr>
				<th>
					<input type = "radio" name = "area1" value = "경상남도" class = "input1" required>경상남도
				</th>
			</tr>
		</tbody>
	</table>

	<input type="hidden" name="cnum" value="${restaurantCnum }">
	<input type = "hidden" name = "img" value = "null"/>
	<br/><br/><br/>
	<h4>식당 이름을 입력하세요</h4>
		<div class="form-group">
			<input class="form-control" type="text" name="store" placeholder="식당 이름을 입력하세요." >  
		</div><br/>
	<h4>구, 시를 입력하세요</h4>	
		<div class="form-group">
			<textarea name="area2" cols="30" rows="10" class="form-control" placeholder="ex) 구로구, 태백시..."></textarea>
		</div><br/>
	<h4>주소를 입력하세요</h4>
		<div class="form-group">
			<textarea name="addr" cols="30" rows="10" class="form-control" placeholder="ex) 서울시 구로구 도림천로 446.."></textarea>
		</div>	
	<h4>전화번호를 입력하세요</h4>
		<div class="form-group">
			<input class="form-control" type="text" name="tel" placeholder="전화번호를 입력하세요." >  
		</div><br/>
		<div class="form-group">
			<input type="submit" value="식당 등록"  class="btn py-3 px-4 btn-primary"  />
		</div>
	</form>
</div>
</div>
<jsp:include page="../homepage/footer.jsp" />
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
<script src="/eatoday/resource/js/main.js"></script>
</body>
</html>