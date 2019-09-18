<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>오늘 뭐 먹지?</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
</head>
<body>
<jsp:include page="header.jsp" />
<!-- END nav -->
<section class="home-slider owl-carousel">
	<div class="slider-item" style="background-image: url(/eatoday/resource/images/bg7.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">
				<div class="col-md-8 col-sm-12 text-center ftco-animate">
					<span class="subheading">Welcome</span>
					<h1 class="mb-4">The Best Coffee Testing Experience</h1>
					<p class="mb-4 mb-md-5">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
					<p><a href="menu.eat" class="btn btn-primary p-3 px-xl-4 py-xl-3">식당 찾기</a>
					   <a href="#" class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">만들어 먹기</a></p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="slider-item" style="background-image: url(/eatoday/resource/images/r5.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">
				<div class="col-md-8 col-sm-12 text-center ftco-animate">
					<span class="subheading">Welcome</span>
					<h1 class="mb-4">Amazing Taste &amp; Beautiful Place</h1>
					<p class="mb-4 mb-md-5">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
					<p><a href="menu.eat" class="btn btn-primary p-3 px-xl-4 py-xl-3">식당 찾기</a>
					   <a href="#" class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">만들어 먹기</a></p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="slider-item" style="background-image: url(/eatoday/resource/images/breadcumb4.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">
				<div class="col-md-8 col-sm-12 text-center ftco-animate">
					<span class="subheading">Welcome</span>
					<h1 class="mb-4">Creamy Hot and Ready to Serve</h1>
					<p class="mb-4 mb-md-5">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
					<p><a href="menu.eat" class="btn btn-primary p-3 px-xl-4 py-xl-3">식당 찾기</a>
					   <a href="#" class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">만들어 먹기</a></p>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-intro">
</section>

<section class="ftco-about d-md-flex">
</section>

<section class="ftco-counter ftco-bg-dark img" id="section-counter" style="background-image: url(images/bg_2.jpg);" data-stellar-background-ratio="0.5";>
	<div class="overlay"></div>
      <div class="container">
        <div class="row justify-content-center">
    		<h1>레스토랑</h1>
        	<!--============================= FIND PLACES =============================-->
			<section class="main-block">
        		<div class="container">
		            <div class="row">
						<div class="col-md-4">
		                    <div class="row find-img-align">
        		                <div class="col-md-12">
                		            <div class="find-place-img_wrap">
                        		        <div class="grid">
                                		    <figure class="effect-ruby">
	                                    		<a href="<c:url value = "restaurantList.eat"><c:param name = "cate" value = "한식"></c:param><c:param name = "area" value = "서울"></c:param></c:url>">
	                                        	<img src="/eatoday/resource/images/korean.JPG" class="img-fluid" alt="img13" /></a>
	                                        	<figcaption>
	                                            	<h5 align = "center" style = "color:white;"><a href="<c:url value = "restaurantList.eat"><c:param name = "cate" value = "한식"></c:param><c:param name = "area" value = "서울"></c:param></c:url>">한식</a></h5>
		                                        </figcaption>
        		                            </figure>
                		                </div>
                        		    </div>
                        		</div>
                    		</div>
                    	<div class="row">
                        	<div class="col-md-12">
	                            <div class="find-place-img_wrap">
	                                <div class="grid">
	                                    <figure class="effect-ruby">
	                                    <a href="<c:url value = "restaurantList.eat"><c:param name = "cate" value = "분식"></c:param><c:param name = "area" value = "서울"></c:param></c:url>">
	                                        <img src="/eatoday/resource/images/bunsik.JPG" class="img-fluid" alt="img13" /></a>
	                                        <figcaption>
	                                            <h5 align = "center" style = "color:white;"><a href="<c:url value = "restaurantList.eat"><c:param name = "cate" value = "분식"></c:param><c:param name = "area" value = "서울"></c:param></c:url>">분식</a></h5>
	              
	                                        </figcaption>
	                                    </figure>
	                                </div>
	                            </div>
							</div>
						</div>
					</div>              
                <div class="col-md-4">
                    <div class="row find-img-align">
                        <div class="col-md-12">
                            <div class="find-place-img_wrap">
                                <div class="grid">
                                    <figure class="effect-ruby">
                                    	<a href="<c:url value = "restaurantList.eat"><c:param name = "cate" value = "양식"></c:param><c:param name = "area" value = "서울"></c:param></c:url>">
                                        <img src="/eatoday/resource/images/west.JPG" class="img-fluid" alt="img13" /></a>
                                        <figcaption>
                                            <h5 align = "center" style = "color:white;"><a href="<c:url value = "restaurantList.eat"><c:param name = "cate" value = "양식"></c:param><c:param name = "area" value = "서울"></c:param></c:url>">양식</a></h5>
                                        </figcaption>
                                    </figure>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="find-place-img_wrap">
                                <div class="grid">
                                    <figure class="effect-ruby">
                                    <a href="<c:url value = "restaurantList.eat"><c:param name = "cate" value = "중식"></c:param><c:param name = "area" value = "서울"></c:param></c:url>">
                                        <img src="/eatoday/resource/images/china.JPG" class="img-fluid" alt="img13" /></a>
                                        <figcaption>
                                            <h5 align = "center" style = "color:white;"><a href="<c:url value = "restaurantList.eat"><c:param name = "cate" value = "중식"></c:param><c:param name = "area" value = "서울"></c:param></c:url>">중식</a></h5>
                                        </figcaption>
                                    </figure>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="row find-img-align">
                        <div class="col-md-12">
                            <div class="find-place-img_wrap">
                                <div class="grid">
                                    <figure class="effect-ruby">
                                    <a href="<c:url value = "restaurantList.eat"><c:param name = "cate" value = "일식"></c:param><c:param name = "area" value = "서울"></c:param></c:url>">
                                        <img src="/eatoday/resource/images/japan.jpg" class="img-fluid" alt="img13" /></a>
                                        <figcaption>
                                            <h5 align = "center" style = "color:white;"><a href="<c:url value = "restaurantList.eat"><c:param name = "cate" value = "일식"></c:param><c:param name = "area" value = "서울"></c:param></c:url>">일식</a></h5>
                                        </figcaption>
                                    </figure>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="find-place-img_wrap">
                                <div class="grid">
                                    <figure class="effect-ruby">
                                    <a href="<c:url value = "restaurantList.eat"><c:param name = "cate" value = "카페"></c:param><c:param name = "area" value = "서울"></c:param></c:url>">
                                        <img src="/eatoday/resource/images/cafe.JPG" class="img-fluid" alt="img13" /></a>
                                        <figcaption>
                                            <h5 align = "center" style = "color:white;"><a href="<c:url value = "restaurantList.eat"><c:param name = "cate" value = "카페"></c:param><c:param name = "area" value = "서울"></c:param></c:url>">카페</a></h5>
                                        </figcaption>
                                    </figure>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--//END FIND PLACES -->
		</div>
	</div>
</section>

<c:if test="${sessionScope.loginID != null}">
<section class="ftco-counter ftco-bg-dark img" id="section-counter" style="background-image: url(images/bg_2.jpg);" data-stellar-background-ratio="0.5";>
			<div class="overlay"></div>
      <div class="container">
        <div class="row justify-content-center">
			<h1>${sessionScope.loginID }님의 추천 레시피</h1><br/>
        	<div class="row" style = "margin-top:100px;">
				<c:forEach var="rcp" items="${recipeList }">
                <!-- Small Receipe Area -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-small-receipe-area d-flex">
                        <!-- Receipe Thumb -->
                        <div class="receipe-thumb">
                            <a href="<c:url value = "recipeDetail.eat"><c:param name = "cnum" value = "${rcp.getCnum()}"></c:param>
	                            <c:param name = "cate" value = "${rcp.getCate()}"></c:param></c:url>">
	                            <img src="/eatoday/resource/RecipeImages/${rcp.getMain_name()}" alt="" width = "100px" height = "100px">
							</a>
                        </div>
                        <!-- Receipe Content -->
                        <div class="receipe-content">
                            <a href="<c:url value = "recipeDetail.eat"><c:param name = "cnum" value = "${rcp.getCnum()}"></c:param>
	                            <c:param name = "cate" value = "${rcp.getCate()}"></c:param></c:url>">
    	                        <h5>${rcp.getTitle()}</h5>
                            </a>
                            <p>&nbsp;<a class="btn btn-primary btn-outline-primary" href="<c:url value = "recipeDetail.eat"><c:param name = "cnum" value = "${rcp.getCnum()}"></c:param>
                            	<c:param name = "cate" value = "${rcp.getCate()}"></c:param></c:url>">자세히보기</a></p>
                        </div><br/>
                    </div><br/>
                </div><br/>
                </c:forEach>
            </div>
        </div>
      </div>
    </section>
</c:if>

<c:if test="${sessionScope.loginID == null}">
</c:if>

<!-- 로그인 상태에서만 회원추천식당 표시 -->
<c:if test="${sessionScope.loginID != null}">
	<section class="ftco-counter ftco-bg-dark img" id="section-counter" style="background-image: url(images/bg_2.jpg);" data-stellar-background-ratio="0.5";>
		<div class="overlay"></div>
		<div class="container">
			<div class="row justify-content-center">
				<h1>${sessionScope.loginID }님의 추천 식당</h1><br/>
				<jsp:include page="/map/map_lf.eat" />
			</div>
		</div>
	</section>
</c:if>

<section class="ftco-counter ftco-bg-dark img" id="section-counter" style="background-image: url(images/bg_2.jpg);" data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-10">
				<h1>우리의 레시피 갯수는?!</h1><br/>
				<div class="row">
					<div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center">
							<div class="text">
								<div class="icon"><span class="flaticon-coffee-cup"></span></div>
								<strong class="number" data-number="100">0</strong>
								<span>한식</span>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center">
							<div class="text">
								<div class="icon"><span class="flaticon-coffee-cup"></span></div>
								<strong class="number" data-number="85">0</strong>
								<span>중식</span>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center">
							<div class="text">
								<div class="icon"><span class="flaticon-coffee-cup"></span></div>
								<strong class="number" data-number="10567">0</strong>
								<span>일식</span>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center">
							<div class="text">
								<div class="icon"><span class="flaticon-coffee-cup"></span></div>
								<strong class="number" data-number="900">0</strong>
								<span>양식</span>
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