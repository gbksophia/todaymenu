<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<script>
	$(document).ready(function(){
		window.setInterval('dateTime()',1000);
	});

	function dateTime(){
		$.ajax({
			type : "post",
			/* url : "date.do", */
			url : "date.eat",
			data : {id:"java", pw:"1234"},
			success : function(data){
				$("#time").html(data);
			}
		});
	}
</script>

<h1>Time</h1>
<h2 id="time"></h2>
