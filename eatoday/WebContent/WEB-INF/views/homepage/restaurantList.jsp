<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Restaurant List</title>
	
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
	<div class="slider-item" style="background-image: url(/eatoday/resource/images/recipe_bg.jpg);" data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
		<div class="container">
			<div class="row slider-text justify-content-center align-items-center">
				<div class="col-md-7 col-sm-12 text-center ftco-animate">
					<c:set var = "cate" value = "${cate}"/>     	
					<c:choose>
						<c:when test="${cate == '한식' }"><h1 class="mb-3 mt-5 bread">한식</h1></c:when>
						<c:when test="${cate == '중식' }"><h1 class="mb-3 mt-5 bread">중식</h1></c:when>
						<c:when test="${cate == '일식' }"><h1 class="mb-3 mt-5 bread">일식</h1></c:when>
						<c:when test="${cate == '양식' }"><h1 class="mb-3 mt-5 bread">양식</h1></c:when>
						<c:when test="${cate == '분식' }"><h1 class="mb-3 mt-5 bread">분식</h1></c:when>
						<c:when test="${cate == '카페' }"><h1 class="mb-3 mt-5 bread">카페</h1></c:when>
						<c:when test="${cate == '기타' }"><h1 class="mb-3 mt-5 bread">기타</h1></c:when>
					</c:choose>
					<p class="breadcrumbs"><span class="mr-2"><a href="index.eat">Home</a></span></p>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-menu mb-5 pb-5">
	<div class="container">
		<div class="row d-md-flex">
			<div class="col-lg-12 ftco-animate p-md-5">
				<div class="row">
				<div class="col-md-12 nav-link-wrap mb-5">
					<div class="nav ftco-animate nav-pills justify-content-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<a class="nav-link" id="v-pills-0-tab" href="<c:url value="/homepage/restaurantList.eat"><c:param name="cate" value="한식"></c:param><c:param name="area" value="서울"></c:param></c:url>" role="tab" aria-selected="false">한식</a>
						<a class="nav-link" id="v-pills-1-tab" href="<c:url value="/homepage/restaurantList.eat"><c:param name="cate" value="중식"></c:param><c:param name="area" value="서울"></c:param></c:url>" role="tab" aria-selected="false">중식</a>
						<a class="nav-link" id="v-pills-2-tab" href="<c:url value="/homepage/restaurantList.eat"><c:param name="cate" value="일식"></c:param><c:param name="area" value="서울"></c:param></c:url>" role="tab" aria-selected="false">일식</a>
						<a class="nav-link" id="v-pills-3-tab" href="<c:url value="/homepage/restaurantList.eat"><c:param name="cate" value="양식"></c:param><c:param name="area" value="서울"></c:param></c:url>" role="tab" aria-selected="false">양식</a>
						<a class="nav-link" id="v-pills-4-tab" href="<c:url value="/homepage/restaurantList.eat"><c:param name="cate" value="분식"></c:param><c:param name="area" value="서울"></c:param></c:url>" role="tab" aria-selected="false">분식</a>
						<a class="nav-link" id="v-pills-5-tab" href="<c:url value="/homepage/restaurantList.eat"><c:param name="cate" value="카페"></c:param><c:param name="area" value="서울"></c:param></c:url>" role="tab" aria-selected="false">카페</a>
						<a class="nav-link" id="v-pills-6-tab" href="<c:url value="/homepage/restaurantList.eat"><c:param name="cate" value="기타"></c:param><c:param name="area" value="서울"></c:param></c:url>" role="tab" aria-selected="false">기타</a>
					</div>
					<br/>
					<div class="nav ftco-animate nav-pills justify-content-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<c:forEach begin="0" end="${areaCnt-1}" step="1" var="i">
						<c:set var="area" value="${areaList[i]}"/>
							<a class="nav-link" id="v-pills-${i}-tab" 
								href="<c:url value="/homepage/restaurantList.eat">
									<c:param name="cate" value="한식"></c:param><c:param name="area" value="${area.getArea1()}"></c:param></c:url>" role="tab" aria-selected="false">${area.getArea1()}</a>
						</c:forEach>
					</div>
				</div>
					<div class="col-md-12 d-flex align-items-center">
						<div class="tab-content ftco-animate" id="v-pills-tabContent">
							<div class="tab-pane fade show active" id="v-pills-0" role="tabpanel" aria-labelledby="v-pills-0-tab">
								<div class="row">
									<c:forEach begin="0" end="${areaCnt}" step="1" var="i">
										<c:set var="rest" value="${raList[i]}" />
										<c:if test="${rest.getCate() == cate}">
											<div class="col-md-3">
												<div class="menu-entry">
													<%-- <a href="<c:url value = "restaurantDetail.eat">
														<c:param name = "cnum" value = "${rest.getNum()}"></c:param>
														<c:param name = "cate" value = "${cate}"></c:param></c:url>" 
														class="img" style="background-image: url(/eatoday/resource/RecipeImages/${rest.getMain_name()});"></a> --%>
													<div class="text text-center pt-4">
														<h3><a href="<c:url value="restaurantDetail.eat">
																<c:param name="cnum" value="${rest.getCnum()}"></c:param><c:param name="cate" value="${cate}"></c:param>
																</c:url>">${rest.getStore()}<br/>${rest.getArea1()} ${rest.getArea2()}</a></h3>
														
														<a class="btn btn-primary btn-outline-primary" href="<c:url value ="restaurantDetail.eat">
																<c:param name="cnum" value="${rest.getCnum()}"></c:param><c:param name="cate" value="${cate}"></c:param></c:url>">자세히보기</a>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

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