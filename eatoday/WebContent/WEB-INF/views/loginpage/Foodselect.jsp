<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						��ȣ��
					</span>
					
					<input type="hidden" name="id" value=${id} />
					<input type="hidden" name="pw" value=${pw} />
					<!-- <input type="hidden" name="social" value="1" /> -->
					<div data-validate = "Like Food">
						<span class="label-input100">��ȣ �Ĵ�</span>
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
					
					<div data-validate = "Like Food2">
						<span class="label-input100">��ȣ ����</span>
						<br>
						<input type="checkbox" name="food" value="rice" />��丮(���,�ʹ� ����) &nbsp;
						<input type="checkbox" name="food" value="soup" />��&�� &nbsp;
						<input type="checkbox" name="food" value="jeongol" />�&���� &nbsp;<br />
						<input type="checkbox" name="food" value="side" />�ع��� &nbsp;
						<input type="checkbox" name="food" value="shake" />�����丮 &nbsp;
						<input type="checkbox" name="food" value="gui" />����(���/����) &nbsp; 
						<input type="checkbox" name="food" value="jjim" />��&���� &nbsp;<br />
						<input type="checkbox" name="food" value="guest" />�մԻ� &nbsp;
						<input type="checkbox" name="food" value="children" />���̹��� &nbsp;
						<input type="checkbox" name="food" value="dosi" />���ö� &nbsp;
						<input type="checkbox" name="food" value="fry" />Ƣ�� &nbsp;
						<input type="checkbox" name="food" value="noodle" />��丮 &nbsp;<br />
						<input type="checkbox" name="food" value="salad" />������ &nbsp;
						<input type="checkbox" name="food" value="drink" />�߽�&������ &nbsp;
						<input type="checkbox" name="food" value="spa" />���İ�Ƽ &nbsp;
						<input type="checkbox" name="food" value="snack" />����/�н� &nbsp;
						<input type="checkbox" name="food" value="toast" />�佺Ʈ&������ġ &nbsp; 
						<input type="checkbox" name="food" value="baking" />����ŷ &nbsp;
						<input type="checkbox" name="food" value="dessert" />����Ʈ &nbsp;
						<input type="checkbox" name="food" value="juice" />�ֽ�&���� &nbsp;<br />
						<input type="checkbox" name="food" value="cocktail" />��&Ĭ���� &nbsp;
						<input type="checkbox" name="food" value="holiday" />�����丮 &nbsp;
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