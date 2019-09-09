<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
	<!--원래 css-->
	
	<link rel="stylesheet" href="/eatoday/resource/css/style.css">
	<script>
		function login(){
			document.frm.action = "loginPro.eat";
			document.frm.method="post";
			document.frm.submit();
			}
	</script>
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
	
	<!-- 구글 로그인 script -->
	<script src="https://apis.google.com/js/platform.js" async defer></script><base>
	<!-- Ajax -->
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	
</head>
<body>
	<jsp:include page="../homepage/header.jsp" />
	<div class="limiter">
		<div class="container-login100" style="background-image: url('/eatoday/resource/images/bg_4.jpg');">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54" style = "margin-top : 100px">
				<form class="login100-form validate-form" name="frm">
					<span class="login100-form-title p-b-49">
						Login
					</span>
					<input type="hidden" name="sign" value="0"/>
					<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
						<span class="label-input100">ID</span>
						<input class="input100" type="text" name="id" placeholder="Type your username">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" name="pw" placeholder="Type your password">
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
							<button class="login100-form-btn" onclick="login()">
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
						<a href="${url}" class="login100-social-item bg1">
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
						    	scope: "account_email",
						        success: function(authObj) {
						          Kakao.API.request({
						              url: '/v2/user/me',
						              success: function(res) {
						                console.log('JSON.stringify(res) = '+JSON.stringify(res));
						                var userID = res.id;      //유저의 카카오톡 고유 id
						                var kEmail = res.kakao_account.email;   //유저의 이메일
						                var kpw = kEmail.split('@')[0];
						                var userNickName = res.properties.nickname; //유저가 등록한 별명					                
					               		console.log('userID='+userID);
						                console.log('kEmail='+kEmail);
						                console.log('userNickName='+userNickName);
						                location= "/eatoday/loginpage/CheckSocial.eat?id="+kEmail+"&pw="+kpw;
    
						                //Kakao.Auth.logout();
						                //console.log('Kakao.Auth.logout()');
						              },
						              fail: function(error) {
						                alert(JSON.stringify(error));
						              }
						            });
						        },
						        fail: function(err) {
						          alert(JSON.stringify(err));
						        }
						      });
						    };
						  //]]>
						</script>
						
						
						<!-- 구글 로그인 -->
						
						<a href="javascript:void(0);" onclick="loginWithGoogle();"class="login100-social-item bg3">
							<i class="fa fa-google"></i>
						</a>
						<script>
							function loginWithGoogle(){
								console.log('init');
								gapi.load('auth2', function() {
									console.log('auth2');
									window.gauth=gapi.auth2.init({   //window.를 붙이면 어디서나 사용가능한 전역변수로 변경!
										client_id: '594879915525-eftcqhdi5ejnj8jnktvhkl7lc8ibl239.apps.googleusercontent.com'
									})
								    gauth.then(function(){
										console.log('googleAuth success'); 	
										gauth.isSignedIn.get();	 //구글 로그인 상태 조회 (true=로그인, false=로그아웃)
										window.gloginState;		//구글 로그인 상태 변수....
										glogin(gauth.isSignedIn.get());		//구글 로그인하는 메서드 호출		
									}, function(){
										console.log('googleAuth fail');  									
									});
								  });
							
							}

							//구글 로그인 하기
							function glogin(gloginState){
								window.gloginYN=gauth.isSignedIn.get();
								//console.log('gloginState:'+gloginState);
								
								//로그아웃 상태일 떄
								if(gloginState==false){ 
									console.log('현재 상태:logouted');  
									gauth.signIn({prompt:'select_account'}).then(function(){ //로그인 하기
										console.log('gauth.signIn() 로그인 완료');
										var gUser=gauth.currentUser.get(); //구글 로그인 한 유저
										window.profile=gUser.getBasicProfile(); //유저의 개인정보
										window.gname=profile.getName(); //유저의 이름
										window.gemail=profile.getEmail(); //유저의 이메일
										var pw = gemail.split('@')[0]; //mem DB에 저장할 pw를 위한 이메일 split
										//gauth.signOut().then(function(){ //로그아웃 해주기
											//console.log('로그아웃 완료');
											//gauth.disconnect();
											
										//});
										location = "/eatoday/loginpage/CheckSocial.eat?id="+gemail+"&pw="+pw;
										console.log('구글 사용자 이름:'+gname);  
										console.log('구글 사용자 이메일:'+gemail);  
										console.log('===============================================');
									}); 
									
								//로그인 상태일 때 
								}else{ 
									console.log('현재 상태:logined');   
									//console.log(gname+'님');  
									//console.log('구글 사용자 이메일:'+gemail);  
									gauth.signOut().then(function(){  //로그아웃 해주기
										console.log('로그아웃 완료');
										gauth.disconnect();
										console.log('===============================================');
									});
								}
								
								$.ajax({
									type : "post",
									url : "/eatoday/loginpage/CheckSocial.eat",
									data : {gname : gname,
											 pw : pw }, 
									success : function(data){
										//alert("완료!!");
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