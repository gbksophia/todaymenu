<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>오늘 뭐먹지? 로그인</title>
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
	<!--원래 css-->
	<link rel="stylesheet" href="/eatoday/resource/css/style.css">
	
	<!-- 소셜 로그인 버튼 css -->
	<style>
	.fa-naver:before{
		font-family : Arial;
		font-weight: bold;
		content: 'N';
	}
	
	.fa-kakao:before{
		font-family : Arial;
		font-weight : bold;
		color : black;
		content : "K"
	}
	</style>
	<!-- 카카오 로그인 script -->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	
</head>
<body>
	<jsp:include page="../homepage/header.jsp" />
	<div class="limiter">
		<div class="container-login100" style="background-image: url('/eatoday/resource/images/bg_4.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54" style = "margin-top : 100px">
				<form class="login100-form validate-form">
					<span class="login100-form-title p-b-49">
						Login
					</span>

					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
						<span class="label-input100">ID</span>
						<input class="input100" type="text" name="username" placeholder="Type your username">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" name="pass" placeholder="Type your password">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					
					<div class="text-left p-t-8 p-b-31">
						<a href="#">
							아이디 찾기
						</a>
						&nbsp;|&nbsp;
						<a href = "#">
						비밀번호 찾기
						</a>
					</div>
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">
								Login
							</button>
						</div>
					</div>

					<div class="txt1 text-center p-t-54 p-b-20">
						<span>
							Social Login
						</span>
					</div>
					
					
					<!-- 네이버 로그인 -->
					
					<div class="flex-c-m">
						<a href="#" class="login100-social-item bg1">
							<img src = "/eatoday/resource/images/naver.JPG" width = "55">
						</a>
						
						<!-- 카카오 로그인 -->
						<a id="custom-login-btn" href="javascript:loginWithKakao()">
						<img src="/eatoday/resource/images/kakao.jpg" width="55"/>
						</a>
						<script type='text/javascript'>
						  //<![CDATA[
						    // 사용할 앱의 JavaScript 키를 설정해 주세요.
						    Kakao.init('80a9e86ee162fbf07ba5299ada0e85a0');
						    function loginWithKakao() {
						      // 로그인 창을 띄웁니다.
						      Kakao.Auth.login({
						        success: function(authObj) {
						          alert(JSON.stringify(authObj));
						        },
						        fail: function(err) {
						          alert(JSON.stringify(err));
						        }
						      });
						    };
						  //]]>
						</script>
						
						
						<!-- 구글 로그인 -->
						
						<a href="/eatoday/homepage/index.eat" class="login100-social-item bg3">
							<i class="fa fa-google"></i>
						</a>
					</div>

					<div class="txt1 text-center p-t-54 p-b-20">
						<a href="#" class="txt2">
							Sign Up
						</a>
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