<%-- 레이어팝업 클릭시 새 창이 아닌 현재 창 내에 팝업 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css"> 
/*	body{ 
    	text-align: center; 
        display: block; 
        margin: 0 auto; 
        font-size: 16px; 
        color: #999; 
	} 
    h1{ 
    	font-family: 'Oswald', sans-serif; 
        font-size: 30px; 
        color: #216182; 
	}
	label { 
    	display: block; 
    	margin-top: 20px; 
    	letter-spacing: 2px; 
	} 
	form { 
    	margin: 0 auto; 
    	width: 459px; 
	} 
	input, textarea { 
	    width: 439px; 
	    height: 27px; 
	    background-color: #efefef; 
	    border-radius: 6px; 
	    border: 1px solid #dedede; 
	    padding: 10px; 
	    margin-top: 3px; 
	    font-size: 0.9em; 
	    color: #3a3a3a; 
	} 
    input:focus, textarea:focus{ 
		border: 1px solid #97d6eb; 
    } 
	textarea{ 
		height: 60px; 
	    background-color: #efefef; 
	}

	#submit{ 
		width: 127px; 
	    height: 48px; 
	    text-align: center; 
	    border: none; 
	    margin-top: 20px; 
	    cursor: pointer; 
	} 
	#submit:hover{ 
	    color: #fff; 
	    background-color: #216282; 
	    opacity: 0.9; 
	} 
	#cancel { 
	    width: 127px; height: 48px; 
	    text-align: center; 
	    border: none; 
	    margin-top: 20px; 
	    cursor: pointer; 
	} 
	#cancel:hover{ 
	    color: #fff; 
	    background-color: #216282; 
	    opacity: 0.9; 
	}
*/
	.modalp { 
		position: fixed; 
		left: 0; 
		top: 0; 
		width: 100%; 
		height: 100%; 
		background-color: rgba(0, 0, 0, 0.5); 
		opacity: 0; 
		visibility: hidden; 
		transform: scale(1.1); 
		transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s; 
	} 
	.modal-contentp { 
		position: absolute; 
		top: 50%; 
		left: 50%; 
		transform: translate(-50%, -50%); 
		background-color: white; 
		padding: 1rem 1.5rem; 
		width: 800px; 
		height: 700px; 
		border-radius: 0.5rem; 
	} 
	.close-buttonp { 
		float: right; 
		width: 1.5rem; 
		line-height: 1.5rem; 
		text-align: center; 
		cursor: pointer; 
		border-radius: 0.25rem; 
		background-color: lightgray; 
	} 
	.close-buttonp:hover { 
		background-color: darkgray; 
	} 
	.show-modal { 
		opacity: 1; 
		visibility: visible; 
		transform: scale(1.0); 
		transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s; 
	}
	.trigger {
		cursor: pointer;
		width:60px;
	}
    
</style>

</head>
<body>
<!-- 버튼 -->
<img src="/eatoday/resource/images/about.jpg" class="trigger"/>
<!-- 팝업 될 레이어 --> 
	<div class="modalp"> 
    	<div class="modal-contentp"> 
        	<span class="close-buttonp">&times;</span> 
            <img src="/eatoday/resource/images/bg_1.jpg" width="150px">
            <br><br>
            <jsp:include page="sideContent.jsp"/>
            
		</div> 
	</div>

	<script type="text/javascript"> 
		var modal = document.querySelector(".modalp");
		var trigger = document.querySelector(".trigger");
		var closeButton = document.querySelector(".close-buttonp"); 
		//var cancelButton = document.querySelector("#cancel");

		function toggleModal() { 
			modal.classList.toggle("show-modal"); 
		}
		
		function windowOnClick(event) { 
			if (event.target === modal) { 
		    	toggleModal(); 
			} 
		}

		trigger.addEventListener("click", toggleModal);
		closeButton.addEventListener("click", toggleModal); 
		//cancel.addEventListener("click", toggleModal); 
		window.addEventListener("click", windowOnClick); 
	</script>
</body>
</html>