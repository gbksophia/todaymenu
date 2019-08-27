<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 테스트</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.js"></script>


</head>
<body>
<script type="text/javascript">  
function openWin(){  
	var winWidth = 500;
	var winHeight = 600;
	var winLeft = parseInt((screen.availWidth/2) - (winWidth/2));
	var winTop = parseInt((screen.availHeight/2) - (winHeight/2));
	var winSize = "width="+winWidth+",height="+winHeight+",left="+winLeft+",top="+winTop+",screenX="+winLeft+",screenY="+winTop;
    window.open("login.do", " 로그인/회원가입", winSize );  
}  
 
</script>  
  
<input type=button value="로그인/회원가입" onclick="javascript:openWin();"/>  
</body>
</html>