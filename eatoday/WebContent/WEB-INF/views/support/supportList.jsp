<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>support</title>

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
</head>

<body>
<script type="text/javascript">
	//관리자만 사용가능한 문의글 삭제 기능
	function remove(num,i){
			var result = confirm("글을 지우시겠습니까?");
			var tag = "#list"+i;
			if(!result){
				alert("취소되었습니다.");
			} else {
				 $.ajax({
						url: "/eatoday/adminpage/supportRemove.eat",
						type: "post",
						data: { num : num},
						success: function(data) {
						$(tag).remove();
						}
				});	
			}
		}
</script>

<jsp:include page="../homepage/header.jsp" />
<div class="container">
<br><br><br><br>

	<table class="table table-bordered">
		<tr> 
			<td> 분류  </td>
			<td> 제목 </td>
			<td> 닉네임 </td>
			<td> 작성일 </td>
				<c:if test="${sessionScope.loginID.equals('admin@eatoday.com') }"> <!-- 접속한사람이 관리자일때 삭제  보임 -->
					<td>삭제</td>
				</c:if>
		</tr>
		
		<c:set var="i" value="1"/> <!-- 글 삭제 할때 아이디값을 가져오기 위해 선언 -->
		<c:forEach var="supportVO" items="${supportList }">
			<tr id="list${i }">
				<td>
					<!-- notice 값과 커맨트 유무로 공지,문의,해결 구분 -->
					<c:choose>
						<c:when test="${supportVO.notice == 1}">[공지]</c:when>
						<c:when test="${supportVO.comments != null }">[해결]</c:when>
						<c:otherwise>[문의]</c:otherwise>
					</c:choose>
				</td>
				
				<td> <a href="supportContent.eat?num=${supportVO.num }">${supportVO.subject }</a></td>		
				<td>${supportVO.nick }</td>
				<td>${supportVO.reg_date }</td>
				<!-- 접속한 사람이 관리자일때 삭제 버튼 생성 -->
				<c:if test="${sessionScope.loginID.equals('admin@eatoday.com') }">
				<td><input type="button" value="삭제"  onclick="remove('${supportVO.num}','${i }')"></td>
				</c:if>
			</tr>
		<c:set var="i" value="${i+1}"/>
		</c:forEach>
	</table>
	
	<c:if test="${sessionScope.loginID !=null }">
		<div class="form-group">
			<div class="text-right">
				<input type="button" value="내 글 보기" class="btn py-3 px-4 btn-primary" onclick="location='mySupportList.eat'">
				<input type="button" value="글 쓰기" class="btn py-3 px-4 btn-primary" onclick="location='supportWrite.eat'">
			</div>
		</div>
	</c:if>
	<div class="text-center">
		<c:if test="${startPage >10 }">
			<a href="supportList.eat?page=${startPage-10 }">&nbsp;<< &nbsp;</a>
		</c:if>
		
		<c:forEach begin="${startPage }" end="${endPage }" step="1" var="i">
			<a href="supportList.eat?page=${i }">${i }</a>
				<c:if test="${i!=endPage}">
					&nbsp;|&nbsp;
				</c:if>
		</c:forEach>
		
		<c:if test="${endPage < pageCount }">
			<a href="supportList.eat?page=${startPage+10 }"> &nbsp;>>&nbsp; </a>
		</c:if>
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
  <script src="/eatoday/resource/js/main.js"></script>
</body>
</html>