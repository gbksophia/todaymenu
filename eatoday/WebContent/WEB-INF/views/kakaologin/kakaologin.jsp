<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
 
<body>
<a id="kakao-login-btn"></a>
<a href="#" onclick="signOut();">Sign out</a>

<script type="text/javascript">
//<![CDATA[
// 사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('80a9e86ee162fbf07ba5299ada0e85a0');
  
// 카카오 로그인 버튼을 생성합니다.
Kakao.Auth.createLoginButton({
	container: '#kakao-login-btn',
    scope: "account_email",
    success: function(authObj) {
        
	    // 로그인 성공시, API를 호출합니다.
	    Kakao.API.request({
	    	url: '/v2/user/me',
	        success: function(res) {
	        	console.log('JSON.stringify(res) = '+JSON.stringify(res));
	          	var userID = res.id;      //유저의 카카오톡 고유 id
	          	var userEmail = res.kakao_account.email;   //유저의 이메일
	          	var userNickName = res.properties.nickname; //유저가 등록한 별명
	          	var userProfile_image = res.properties.profile_image;
	          	//var userBirthday = res.kakao_account.has_birthday;
	          
				console.log('userID='+userID);
				console.log('userEmail='+userEmail);
				console.log('userNickName='+userNickName);
				console.log('userProfile_image='+userProfile_image);
				console.log('authObj.access_token='+authObj.access_token);
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

function signOut() {
	Kakao.Auth.logout();
   	console.log('Kakao.Auth.logout()');
}
//]]>
</script>

<form action = "kakaologin.do" method = "post">
	<input type = "hidden" value = "userID">
</form>
${vo.userID }
</body>
</html>