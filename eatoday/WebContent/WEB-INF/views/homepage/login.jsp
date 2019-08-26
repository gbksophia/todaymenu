<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style> 
input[type=text] {
  width: 50%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: none;
  background-color: #3CBC8D;
  color: white;
}

.button {
  display: inline-block;
  border-radius: 4px;
  background-color: #787878;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 28px;
  padding: 10px;
  width: 200px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}

a:link {
	color: #787878;
	text-decoration: none;
}

a:visited {
	color: #787878;
	text-decoration: none;
}
</style>
</head>
<body>

<h1>로그인</h1>

<form>
  <input type="text" id="id" name="id" placeholder="EMAIL"><br/>
  <input type="text" id="pw" name="pw" placeholder="Password"><br/>
  <button class="button" style="vertical-align:middle"><span>로그인!</span></button>
</form>
<hr/>
	<a href="#">아이디 찾기</a> |
	<a href="#">비밀번호 찾기</a> |
	<a href="#">회원가입</a>
<hr/>

네이버어<br/>
카카오오<br/>
구그으을

</body>
</html>
