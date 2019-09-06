<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>���� ������? ȸ������</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- �α��� css -->
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
	<!--���� css-->
	
	<script>
		function sign(){
			var frm = document.frm;
			var id = frm.id;
			var pw = frm.pw;
			var email = /[@]/;
			if(id.value==""){
				id.focus();
				return false;
				} else if(pw.value==""){
				pw.focus();
				return false;
				} else if(!email.test(id.value)){
					alert("�̸��� ������ �ƴմϴ�.");
					id.focus();
					return false;
					}else {
					document.frm.action ="signPro.eat";
					document.frm.method= "post";
					document.frm.submit();
					}
			}
	</script>
	<link rel="stylesheet" href="/eatoday/resource/css/style.css">
	
	<!-- �Ҽ� �α��� ��ư css -->
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
	<!-- īī�� �α��� script -->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
	<jsp:include page="../homepage/header.jsp" />
	<div class="limiter">
		<div class="container-login100" style="background-image: url('/eatoday/resource/images/bg_4.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54" style = "margin-top : 100px">
				<form class="login100-form validate-form" name="frm">
					<span class="login100-form-title p-b-49">
						Sign-Up
					</span>

					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
						<span class="label-input100">���̵�</span>
						<input class="input100" type="email" name="id" placeholder="example@ex.com">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">��й�ȣ</span>
						<input class="input100" type="password" name="pw" placeholder="Type your password">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					
					<div data-validate = "Like Food">
						<span class="label-input100">��ȣ</span>
						<br>
						<input type="checkbox" name="food" value="kor" />�ѽ� &nbsp;
						<input type="checkbox" name="food" value="china" />�߽� &nbsp;
						<input type="checkbox" name="food" value="japan" />�Ͻ� &nbsp;
						<input type="checkbox" name="food" value="european" />��� &nbsp;
						<input type="checkbox" name="food" value="bunsig" />�н� &nbsp;
						<input type="checkbox" name="food" value="cafe" />ī�� &nbsp; <br>
						<input type="checkbox" name="food" value="fm" />�йи� ������� &nbsp;
						<input type="checkbox" name="food" value="ff" />���� &nbsp;
					</div>
					
					<div data-validate = "Like FoodRes">
						<span class="label-input100">��ȣ</span>
						<br>
						<input type="checkbox" name="food" value="kor" />�ѽ� &nbsp;
						<input type="checkbox" name="food" value="china" />�߽� &nbsp;
						<input type="checkbox" name="food" value="japan" />�Ͻ� &nbsp;
						<input type="checkbox" name="food" value="european" />��� &nbsp;
						<input type="checkbox" name="food" value="bunsig" />�н� &nbsp;
						<input type="checkbox" name="food" value="cafe" />ī�� &nbsp; <br>
						<input type="checkbox" name="food" value="fm" />�йи� ������� &nbsp;
						<input type="checkbox" name="food" value="ff" />���� &nbsp;
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