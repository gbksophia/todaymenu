<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>���� ������? �α���</title>
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
	
	<!-- ���� �α��� script -->
	<script src="https://apis.google.com/js/platform.js" async defer></script><base>
	<!-- Ajax -->
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	
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
							���̵� ã��
						</a>
						&nbsp;|&nbsp;
						<a href = "#">
						��й�ȣ ã��
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
					
					
					<!-- ���̹� �α��� -->
					
					<div class="flex-c-m">
						<a href="${url}" class="login100-social-item bg1">
							<img src = "/eatoday/resource/images/naver.JPG" width = "55">
						</a>
						
						<!-- īī�� �α��� -->
						<a id="custom-login-btn" href="javascript:loginWithKakao()">
						<img src="/eatoday/resource/images/kakao.jpg" width="55"/>
						</a>
						<script type='text/javascript'>
						  //<![CDATA[
						    // ����� ���� JavaScript Ű�� ������ �ּ���.
						    Kakao.init('80a9e86ee162fbf07ba5299ada0e85a0');
						    function loginWithKakao() {
						      // �α��� â�� ���ϴ�.
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
						
						
						<!-- ���� �α��� -->
						
						<a href="javascript:void(0);" onclick="loginWithGoogle();"class="login100-social-item bg3">
							<i class="fa fa-google"></i>
						</a>
						<script>
							function loginWithGoogle(){
								gapi.load('auth2', function() {
									console.log('auth2');
									window.gauth=gapi.auth2.init({   //window.�� ���̸� ��𼭳� ��밡���� ���������� ����!
										client_id: '594879915525-eftcqhdi5ejnj8jnktvhkl7lc8ibl239.apps.googleusercontent.com'
									})
								    gauth.then(function(){
										console.log('googleAuth success'); 		
										checkloginStatus();				
									}, function(){
										console.log('googleAuth fail');  									
									});
								  });
							
							}

							function checkloginStatus(){
								var gloginState=gauth.isSignedIn.get();
								console.log(gloginState);
								var gname=gauth.currentUser.get().getBasicProfile().getName();
								var gemail=gauth.currentUser.get().getBasicProfile().getEmail(); 
								if(gauth.isSignedIn.get()){
									console.log('�α��� ����:logined');   
									console.log(gname+'��');  
									console.log('���� ����� �̸���:'+gemail);  
									gauth.signOut().then(function(){console.log('�α׾ƿ� �Ϸ�');});
								}else{
									console.log('�α��� ����:logouted');  
									gauth.signIn({prompt:'select_account'}).then(function(){
										console.log('gauth.signIn() �α��� �Ϸ�');
										console.log('���� ����� �̸�:'+gname);  
										console.log('���� ����� �̸���:'+gemail);  
									});  
								}

								$.ajax({
									type : "post",
									url : "/eatoday/googlelogin/googlelogin.eat",
									data : {gloginState : gloginState,
											 gname : gname,
											 gemail : gemail }, 
									success : function(data){
										//alert("�Ϸ�!!");
										}
								});								
							}
							
						</script>
						
					</div>

					<div class="txt1 text-center p-t-54 p-b-20">
						<a href="sign.eat" class="txt2">
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