<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta charset="utf-8">
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="594879915525-eftcqhdi5ejnj8jnktvhkl7lc8ibl239.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
  	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<body>
	<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
    <a href="javascript:void(0);" onclick="signOut();">Sign out</a>
<script>
function onSignIn(googleUser) {
	// Useful data for your client-side scripts:
	var profile = googleUser.getBasicProfile();
	//console.log("ID: " + profile.getId()); // Don't send this directly to your server!
	console.log('Full Name: ' + profile.getName());
	//console.log('Given Name: ' + profile.getGivenName());
	//console.log('Family Name: ' + profile.getFamilyName());
	//console.log("Image URL: " + profile.getImageUrl());
	console.log("Email: " + profile.getEmail());

	// The ID token you need to pass to your backend:
	var id_token = googleUser.getAuthResponse().id_token;
	console.log("ID Token: " + id_token);

	var gname=profile.getName();
	var gemail=profile.getEmail();
	
	$.ajax({
		type : "post",
		url : "/eatoday/googlelogin/googlelogin.eat",
		data : { id_token : id_token,
				 gname : gname,
				 gemail : gemail }, 
		success : function(data){
			//alert("완료!!");
		}
	});
}
   
function signOut() {
	var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
    	console.log('User signed out.');
	});
}
</script>

</body>
</html>