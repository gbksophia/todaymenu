<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>오늘 뭐먹지? 회원가입</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 로그인 css -->
	<link rel="icon" type="image/png" href="/eatoday/resource/login/images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="/eatoday/resource/login/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/eatoday/resource/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="/eatoday/resource/login/fonts/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="/eatoday/resource/login/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="/eatoday/resource/login/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="/eatoday/resource/login/vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="/eatoday/resource/login/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="/eatoday/resource/login/vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="/eatoday/resource/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="/eatoday/resource/login/css/main.css">
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
	<!--원래 css-->
	
	<script>
		function sign(){
			var frm = document.frm;
			document.frm.action ="signPro.eat";
			document.frm.method= "post";
			document.frm.submit();
			}
	</script>
	<link rel="stylesheet" href="/eatoday/resource/css/style.css">
	
</head>
<body>
	<jsp:include page="../homepage/header.jsp" />
	<div class="limiter">
		<div class="container-login100" style="background-image: url('/eatoday/resource/images/bg_4.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54" style = "margin-top : 100px">
				<form class="login100-form validate-form" name="frm">
					<span class="login100-form-title p-b-49">
						선호도
					</span>
					
					<input type="hidden" name="id" value=${id} />
					<input type="hidden" name="pw" value=${pw} />
					<!-- <input type="hidden" name="social" value="1" /> -->
					<div data-validate = "Like Food">
						<span class="label-input100">선호 식당</span>
						<br>
						<input type="checkbox" name="food" value="kor" />한식 &nbsp;
						<input type="checkbox" name="food" value="china" />중식 &nbsp;
						<input type="checkbox" name="food" value="japan" />일식 &nbsp;
						<input type="checkbox" name="food" value="european" />양식 &nbsp;
						<input type="checkbox" name="food" value="bunsig" />분식 &nbsp;
						<input type="checkbox" name="food" value="cafe" />카페 &nbsp; <br>
						<input type="checkbox" name="food" value="fm" />패밀리 레스토랑 &nbsp;
						<input type="checkbox" name="food" value="ff" />뷔페 &nbsp;
					</div>
					
					<div data-validate = "Like Food2">
						<span class="label-input100">선호 음식</span>
						<br>
						<input type="checkbox" name="food" value="rice" />밥요리(김밥,초밥 포함) &nbsp;
						<input type="checkbox" name="food" value="soup" />국&탕 &nbsp;
						<input type="checkbox" name="food" value="jeongol" />찌개&전골 &nbsp;<br />
						<input type="checkbox" name="food" value="side" />밑반찬 &nbsp;
						<input type="checkbox" name="food" value="shake" />볶음요리 &nbsp;
						<input type="checkbox" name="food" value="gui" />구이(고기/생선) &nbsp; 
						<input type="checkbox" name="food" value="jjim" />찜&조림 &nbsp;<br />
						<input type="checkbox" name="food" value="guest" />손님상 &nbsp;
						<input type="checkbox" name="food" value="children" />아이반찬 &nbsp;
						<input type="checkbox" name="food" value="dosi" />도시락 &nbsp;
						<input type="checkbox" name="food" value="fry" />튀김 &nbsp;
						<input type="checkbox" name="food" value="noodle" />면요리 &nbsp;<br />
						<input type="checkbox" name="food" value="salad" />샐러드 &nbsp;
						<input type="checkbox" name="food" value="drink" />야식&술안주 &nbsp;
						<input type="checkbox" name="food" value="spa" />스파게티 &nbsp;
						<input type="checkbox" name="food" value="snack" />간식/분식 &nbsp;
						<input type="checkbox" name="food" value="toast" />토스트&샌드위치 &nbsp; 
						<input type="checkbox" name="food" value="baking" />베이킹 &nbsp;
						<input type="checkbox" name="food" value="dessert" />디저트 &nbsp;
						<input type="checkbox" name="food" value="juice" />주스&음료 &nbsp;<br />
						<input type="checkbox" name="food" value="cocktail" />술&칵테일 &nbsp;
						<input type="checkbox" name="food" value="holiday" />명절요리 &nbsp;
					</div>
					 
					
					<div class="text-left p-t-8 p-b-31">
					</div>
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" onclick="return sign()">
								Register
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	<jsp:include page="../homepage/footer.jsp" />
<!--===============================================================================================-->
	<script src="/eatoday/resource/login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/eatoday/resource/login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/eatoday/resource/login/vendor/bootstrap/js/popper.js"></script>
	<script src="/eatoday/resource/login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/eatoday/resource/login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/eatoday/resource/login/vendor/daterangepicker/moment.min.js"></script>
	<script src="/eatoday/resource/login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/eatoday/resource/login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="/eatoday/resource/login/js/main.js"></script>

</body>
</html>