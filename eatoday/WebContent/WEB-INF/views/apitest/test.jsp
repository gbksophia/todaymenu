<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$.ajax({
	type : "post",
	url : "map_loc.eat",
	success : function(data){
		alert(data);
	}
});
</script>
<body>
			

<form action="test.eat">
	<input type="text" id="addr2" name="addr2" />
	<input type="submit" value="asdasdasd"/>
</form>
<input type="text" id="d1t" name="d1t" />
<p id="d1"></p>
<p id="d2"></p>
<p id="d3"></p>




</body>
</html>