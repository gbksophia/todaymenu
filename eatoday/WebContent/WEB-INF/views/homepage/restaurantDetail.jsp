<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ page import = "java.net.URLEncoder" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Restaurant Detail</title>
	
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
<jsp:include page="header.jsp" />
<!-- END nav --> 
<section class="home-slider owl-carousel">
<div class="slider-item" style="background-image: url(/eatoday/resource/RecipeImages/${rca.getMain_name()});">
	<div class="overlay"></div>
	<div class="container">
		<div class="row slider-text justify-content-center align-items-center">
			<div class="col-md-7 col-sm-12 text-center ftco-animate">
				<h1 class="mb-3 mt-5 bread">${rvo.getStore() }</h1> <p>${rvo.getCate()}</p>
				<!-- <p class="breadcrumbs"><span class="mr-2"><a href="index.eat">Home</a></span>
					<span class="mr-2"><a href="blog.eat">Blog</a></span>
					<span>Blog Single</span>
				</p> -->
			</div>
		</div>
	</div>
</div>
</section>

<section class="ftco-section">
<div class="container">
	<div class="row">
		<div class="col-md-8 ftco-animate">
			<h2 class="mb-3">식당이름</h2>
			<div class="vcard bio">
				<p>${rvo.getStore()}</p><br/>
			</div>
			<%-- <p> <c:set var="str" value="${rvo.getStore()}"/>
				<c:forEach var="spt" items="${fn:replace(str, 'next', '<br>')}" varStatus="status">
					<img src="images/image_2.jpg" alt="" class="img-fluid">${spt}
				</c:forEach>
			</p> --%>
			
			<h2 class="mb-3">주소</h2>
			<div class="vcard bio">
				<p>${rvo.getAddr()}</p><br/>
			</div>
			<%-- <div class="vcard bio">
				<c:forEach begin="1" end="${proCount}" step="1" var="i">
					<c:if test="${i==1}">
						<c:set var="j" value="0" />
					</c:if>
					<c:set var="rcpro" value="${pro[i-1]}" />
					<c:choose>
						<c:when test="${i%2 == 1}">
							<c:set var="img" value="${ivo[j]}" />
							<img src="/eatoday/resource/RecipePro/${img.getImg1()}" alt="" class="img-fluid" width = "400px" height = "200px">
						</c:when>
						<c:otherwise>
							<img src="/eatoday/resource/RecipePro/${img.getImg2()}" alt="" class="img-fluid" width = "400px" height = "200px">
							<c:set var = "j" value = "${j+1}" />
						</c:otherwise>
					</c:choose>
					<p>${rcpro}</p>
					<br/><br/>
				</c:forEach>
			</div> --%>
			<h2 class="mb-3">전화번호</h2>
			<div class="vcard bio">
				<p>${rvo.getTel()}</p><br/>
			</div>
			
			<h2 class="mb-3">위치</h2>
			<div class="vcard bio">
				<jsp:include page="/eatoday/map/map_kwd_rest.eat"/>
			</div>
			
			<div class="pt-5 mt-5">
				<h3 class="mb-5">${recount} Comments</h3>
				<ul class="comment-list">
					<c:forEach var="recipeReviewVO" items="${revo}">
						<li class="comment">
							<div class="comment-body">
								<h3>${recipeReviewVO.nick}</h3>
								<div class="meta">${recipeReviewVO.reg_date}</div>
								<p>${recipeReviewVO.text}</p>
								<c:if test="${recipeReviewVO.img != null}">
									<img src="/eatoday/resource/RecipeReview/${recipeReviewVO.img}" height="400px">
								</c:if>
								<div class="text-right">
									<img src="/eatoday/resource/images/like.png" height="20px">
								</div> 
							</div>  
						</li>
					</c:forEach>
				</ul>
			<!-- END comment-list -->
			<!-- 댓글 달기 -->
				<div class="comment-form-wrap pt-5">
				<form action="recipeRePro.eat" method="post" enctype="multipart/form-data">
					<input type="hidden" name="cnum" value="${rvo.getCnum()}"/>
					<input type="hidden" name="id" value="${sessionScope.loginID}"/>
					<div class="form-group">
						<textarea name="text" id="text" cols="30" rows="10" class="form-control" placeholder="댓글을 입력해주세요"></textarea>
					</div>
					<div class="form-group">
						<input class="form-control" type="text" name="nick"  placeholder="닉네임"/>
					</div>
					<div class="form-group">
						<input type="file" name="img"/>
					</div>
					<div class="form-group">
						<div class="text-right">
							<input type="submit" value="Post Comment" class="btn py-3 px-4 btn-primary"/>
						</div>
					</div>
				</form>
				</div>
			</div> 
		<!-- .col-md-8 -->
		<div class="col-md-4 sidebar ftco-animate">
			<c:set var="c" value="${cookie.cookie.value}"/>  
			<c:forEach begin="0" end="${count}" step="1" var="i">
				<c:set var="rca" value="${restList[i]}" />
				<c:if test="${rca.getCnum() == c}">
					<div class="sidebar-box ftco-animate">
						<h3>Recent Recipe</h3>
						<div class="block-21 mb-4 d-flex">
							<%-- <a class="blog-img mr-4" style="background-image: url(/eatoday/resource/RecipeImages/${rca.getMain_name()});"></a> --%>
							<div class="text">
								<h3 class="heading"><a href="<c:url value="restaurantDetail.eat">
									<c:param name="abc" value="${rca.getCnum()}"></c:param></c:url>">${rca.getStore() }</a></h3>
								<div class="meta">
									<div><a class="btn btn-primary btn-outline-primary" href="<c:url value="restaurantDetail.eat">
										<c:param name="abc" value="${rca.getCnum()}"></c:param></c:url>">자세히보기</a></div>
								</div>
							</div>
						</div>
					</div>
					<div class="sidebar-box ftco-animate">
						<div class="categories">
						<h3>${j}Categories</h3>
						<br/><br/>
							<p>
								<c:forEach begin="0" end="${count}" step="1" var="i">
									<c:set var="rvo" value="${recipeList[i]}"/>
									<c:if test="${rvo.getCnum() == abc }">
										<c:set var="str" value="${rvo.getPro()}"/>
										<c:forEach var="spt" items="${fn:replace(str, 'next', '<br><br>')}" varStatus="status">
											<img src="images/image_2.jpg" alt="" class="img-fluid">${spt}
										</c:forEach>
									</c:if>
								</c:forEach>
							</p>
						</div>
					</div>
				</c:if>
			</c:forEach>           
		</div>
	</div>
</div>
</div>
</section> <!-- .section -->
<jsp:include page="footer.jsp" />

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