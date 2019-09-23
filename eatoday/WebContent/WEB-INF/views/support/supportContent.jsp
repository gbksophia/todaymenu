<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${supportVO.subject }</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="/eatoday/resource/js/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Great+Vibes" rel="stylesheet">

    <link rel="stylesheet" href="/eatoday/resource/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/eatoday/resource/css/animate.css">
    
    <link rel="stylesheet" href="/eatoday/resource/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/eatoday/resource/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/eatoday/resource/css/magnific-popup.css">

    <link rel="stylesheet" href="/eatoday/resource/css/aos.css">

    <link rel="stylesheet" href="/eatoday/resource/css/ionicons.min.css">

    <link rel="stylesheet" href="/eatoday/resource/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/eatoday/resource/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="/eatoday/resource/css/flaticon.css">
    <link rel="stylesheet" href="/eatoday/resource/css/icomoon.css">
    <link rel="stylesheet" href="/eatoday/resource/css/style.css">
     <script src="/eatoday/resource/js/jquery-migrate-3.0.1.min.js"></script>
    
<style>
	
		img {
			display: block;
		}
		
		textarea {
			color: #585858;
			background-color: #000000;
		}

	  .wrap {
      width: 500px;
    }
    .wrap textarea {
      width: 100%;
      resize: none;
      overflow-y: hidden; /* prevents scroll bar flash */
      padding: 1.1em; /* prevents text jump on Enter keypress */
      padding-bottom: 0.2em;
      line-height: 1.6;
    }

    textarea:disabled{
    	width: 800px;
    	resize: none;
    	border: 0;
    	overflow-y:hidden;
    } 
</style>
     <script type="text/javascript">
  $(document).ready(function() {
      $('.wrap').on( 'keyup', 'textarea', function (e){
        $(this).css('height', 'auto' );
        $(this).height( this.scrollHeight );
      });
      $('.wrap').find( 'textarea' ).keyup();
    });
 </script>
 <script>
 function commentRemove(){
		var result = confirm("답변을 삭제하시겠습니까?");

		if(result){
			alert("삭제하였습니다.");
			location = "supportCommentRemove.eat?num=${supportVO.num}";
			}
}
	function commentUpdate(){
		var text = $("#comments").val();
		var check = document.getElementById("commentUp");
		var num = '${supportVO.num}';
		if(check ==null){
	var comment = document.createElement("textarea");	
		comment.setAttribute("id","commentUp");
		comment.setAttribute("name","commentUp");
		comment.innerHTML = text;
		document.getElementById("commentsUpdate").appendChild(comment);	
		}
	 else {
		var comments =$("#commentUp").val();
		 $.ajax({
				url: "supportCommentUpdate.eat",
				type: "post",
				data: { comments : comments, num : num},
			  success: function(data) {
				  document.getElementById("comments").innerHTML = data;
				  $("#commentUp").remove();
				  }
			  });
		}
	}

	function remove() {
		var result = confirm("해당 질문을 지우시겠습니까?");

		if(result) {
			location = "removePro.eat?num=${supportVO.num}&id=${supportVO.id}";
			}
		}
 </script>
</head>
<body>

<jsp:include page="../homepage/header.jsp" />
<div class="container">
<br><br><br><br>
	<div class="comment-form-wrap pt-5">
	<form action="commentPro.eat?">
	<input type="hidden" value="${supportVO.num }" name="num">
		<table>
			<tr>
				<td ><h5> 제목 </h5>
				 ${supportVO.subject}   <br><br>
				<h5>닉네임</h5> ${supportVO.nick } <br><br>
				<h5>내용</h5> 
				</td>
			</tr>
			
			<tr>
				<td>
				<div class="wrap">
				<textarea id="content" disabled >${supportVO.content }</textarea>
				</div>
				<c:if test="${supportVO.img != null }">
				<img src="/eatoday/resource/support/${supportVO.img}" width="500px">
				</c:if>
				<c:if test="${sessionScope.loginID.equals('admin@eatoday.com') && supportVO.comments == null && supportVO.notice != 1 }">
				<br><br>
				<h5>답변하기</h5> 
				</c:if>
				<c:if test="${supportVO.comments != null }">
				<br><br>
					<h5>답변</h5>
				</c:if>
				</td>
			</tr>
			
			<c:if test="${sessionScope.loginID.equals('admin@eatoday.com') && supportVO.comments == null&& supportVO.notice != 1 }">
				<tr>
				<td>
				<textarea cols="107" rows="10" name="comments" ></textarea>
				</td>
			</tr>
			
			<tr>
				<td>
				 <div class="text-right">
				<input class="btn py-3 px-4 btn-primary" type="submit" value="답변하기" >
				</div>
				</td>			
			</tr>		
			</c:if>	
			<c:if test="${supportVO.comments != null }">
				<tr>
					<td>
				<div class="wrap" id="commentsUpdate" >
				<textarea id="comments" disabled >${supportVO.comments }</textarea>
				</div>
					</td>
				</tr>
			<c:if test="${sessionScope.loginID.equals('admin@eatoday.com') }">
				<tr>
					<td>
						<div class="text-right">
						<input class="btn py-3 px-4 btn-primary" type="button" value="삭제하기" onclick="javascript:commentRemove()">
						<input class="btn py-3 px-4 btn-primary" type="button" value="수정하기" onclick="javascript:commentUpdate()">
						</div>
					</td>
				</tr>
			</c:if>
			</c:if>		
		</table>
		</form>	
	</div>
</div>
<jsp:include page="../homepage/footer.jsp" />
<!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>



  <script src="/eatoday/resource/js/jquery.min.js"></script>
  <script src="/eatoday/resource/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/eatoday/resource/js/popper.min.js"></script>
  <script src="/eatoday/resource/js/bootstrap.min.js"></script>
  <script src="/eatoday/resource/js/jquery.easing.1.3.js"></script>
  <script src="/eatoday/resource/js/jquery.waypoints.min.js"></script>
  <script src="/eatoday/resource/js/jquery.stellar.min.js"></script>
  <script src="/eatoday/resource/js/owl.carousel.min.js"></script>
  <script src="/eatoday/resource/js/jquery.magnific-popup.min.js"></script>
  <script src="/eatoday/resource/js/aos.js"></script>
  <script src="/eatoday/resource/js/jquery.animateNumber.min.js"></script>
  <script src="/eatoday/resource/js/bootstrap-datepicker.js"></script>
  <script src="/eatoday/resource/js/jquery.timepicker.min.js"></script>
  <script src="/eatoday/resource/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="/eatoday/resource/js/google-map.js"></script>
  <script src="/eatoday/resource/js/main.js"></script>
</body>
</html>