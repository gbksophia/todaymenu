<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>LoginTest</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

</head>
<body>
	<form>
	<div id="naver_id_login" style="text-align:center">
		id: <input type="text" name="id" ><br/>
		pw: <input type="password" name="pw" ><br/>
		<br/>
		<input type="button" name="sign" value="회원가입"/>
		<input type="submit" name="login" value="로그인"/>
		<hr>
		<a href="${url}"><img width="223" src="/never/resources/img/naverlogin.PNG"/></a></div>
	</form>
<br>
<!-- 네이버 로그인 화면으로 이동 시키는 URL -->
<!-- 네이버 로그인 화면에서 ID, PW를 올바르게 입력하면 callback 메소드 실행 요청 -->

<br>
</body>
</html>