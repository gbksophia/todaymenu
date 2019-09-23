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
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>    
        /*********************************************SEARCH INPUT************/
@import
   url('https://fonts.googleapis.com/css?family=Raleway:400,700,900');

/* Base styling */
.search_body {
   width: 430px;
   @import
   url("https://fonts.googleapis.com/css?family=Raleway:400,700,900");
   margin : 0 auto;
     font-family   :'Raleway',sans-serif;
}

.search__input {
   width: 90%; /*검색 창 길이*/
   padding: 12px 24px; /*검색 입력 값 안의 padding*/
   background-color: transparent;
   transition: transform 250ms ease-in-out;
   font-size: 20px;
   line-height: 18px;
   color: white;
   background-color: transparent;
   background-image:
      url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'%3E%3Cpath d='M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z'/%3E%3Cpath d='M0 0h24v24H0z' fill='none'/%3E%3C/svg%3E");
   background-repeat: no-repeat;
   background-size: 18px 18px;
   background-position: 95% center;
   border-radius: 50px;
   border: 3px solid #c49b63;
   transition: all 250ms ease-in-out;
   backface-visibility: hidden;
   transform-style: preserve-3d;
}

.search__input::placeholder {
   color: rgba(87, 87, 86, 0.8);
   /* text-transform: uppercase;*/
   letter-spacing: 1.5px;
}

.search__input:hover, .search__input:focus {
   padding: 12px 0;
   outline: 0;
   border: 1px solid transparent;
   border-bottom: 2px solid #c49b63;
   border-radius: 0;
   background-position: 100% center;
}

.ftco-counter{
	padding-top:3em;
	padding-bottom:0em;
}

.ftco-bg-dark{
	background:none;
}

.ftco-menu{
	padding-top:0em;
}

.search-form .form-group input {
	font-size:20px;
}

.ftco-counter .icon:after{
	border: none;
}

.ftco-counter .icon span{
	color:#bfbfbf;
}
</style>

<script type = "text/javascript">
	function searchCheck() {
	    var str = document.getElementById('search');
	    var blank = /^[\s]/g;
	
	    //검색어 입력필수
	    if (str.value == '' || str.value == null) {
	       alert("검색어를 입력하세요.");
	       return false;
	    }
	
	    //공백금지
	    if (blank.test(str.value) == true) {
	       alert("제대로 좀 입력하세요.")
	       return false;
	    }
	 }
</script>
</head>
<body>
<jsp:include page="../homepage/header.jsp" />
<!-- END nav -->
<section class="home-slider owl-carousel">
	<!-- <div class="slider-item" style="background-image: url(/eatoday/resource/images/recipe_bg.jpg);" data-stellar-background-ratio="0.5"> -->
	<c:set var = "cate" value = "${cate}"/>
	<c:choose>
		<c:when test="${cate == '한식'}"><div class="slider-item" style="background-image: url(/eatoday/resource/images/rest_hs.jpg);" data-stellar-background-ratio="0.5"></c:when>
		<c:when test="${cate == '중식'}"><div class="slider-item" style="background-image: url(/eatoday/resource/images/rest_js.jpg);" data-stellar-background-ratio="0.5"></c:when>
		<c:when test="${cate == '일식'}"><div class="slider-item" style="background-image: url(/eatoday/resource/images/rest_is.jpg);" data-stellar-background-ratio="0.5"></c:when>
		<c:when test="${cate == '양식'}"><div class="slider-item" style="background-image: url(/eatoday/resource/images/rest_ys.jpg);" data-stellar-background-ratio="0.5"></c:when>
		<c:when test="${cate == '분식'}"><div class="slider-item" style="background-image: url(/eatoday/resource/images/rest_bs.jpg);" data-stellar-background-ratio="0.5"></c:when>
		<c:when test="${cate == '카페'}"><div class="slider-item" style="background-image: url(/eatoday/resource/images/rest_cf.jpg);" data-stellar-background-ratio="0.5"></c:when>
		<c:when test="${cate == '기타'}"><div class="slider-item" style="background-image: url(/eatoday/resource/images/rest_guitar.png);" data-stellar-background-ratio="0.5"></c:when>
	</c:choose>
	<div class="overlay"></div>
		<div class="container">
			<div class="row slider-text justify-content-center align-items-center">
				<div class="col-md-7 col-sm-12 text-center ftco-animate">
					<c:set var = "cate" value = "${cate}"/>
					<c:choose>
						<c:when test="${cate == '한식'}"><h1 class="mb-3 mt-5 bread">한식</h1></c:when>
						<c:when test="${cate == '중식'}"><h1 class="mb-3 mt-5 bread">중식</h1></c:when>
						<c:when test="${cate == '일식'}"><h1 class="mb-3 mt-5 bread">일식</h1></c:when>
						<c:when test="${cate == '양식'}"><h1 class="mb-3 mt-5 bread">양식</h1></c:when>
						<c:when test="${cate == '분식'}"><h1 class="mb-3 mt-5 bread">분식</h1></c:when>
						<c:when test="${cate == '카페'}"><h1 class="mb-3 mt-5 bread">카페</h1></c:when>
						<c:when test="${cate == '기타'}"><h1 class="mb-3 mt-5 bread">기타</h1></c:when>
					</c:choose>
					<p class="breadcrumbs"><span class="mr-2"><a href="/eatoday/homepage/index.eat">Home</a></span></p>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- 식당 검색기능 -->
<section class="ftco-counter ftco-bg-dark img" id="section-counter" data-stellar-background-ratio="0.5";>
	<div class="container">
	    <div class="hd_column2">
	      <form name="searchBar" action="../restaurant/searchResult.eat" onSubmit="return searchCheck();" class="search-form">
	        <div class="form-group">
	        	<div class="icon">
	           <span class="icon-search"></span>
	          </div>
	          <input type="text" name="search" id="search" class="form-control" placeholder="Search... ex)관악구 카페">
	        </div>
	      </form>
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
						<a class="nav-link" id="v-pills-0-tab" href="<c:url value="/restaurant/restaurantList.eat"><c:param name="cate" value="한식"></c:param><c:param name="area" value="서울"></c:param></c:url>" role="tab" aria-selected="false">한식</a>
						<a class="nav-link" id="v-pills-1-tab" href="<c:url value="/restaurant/restaurantList.eat"><c:param name="cate" value="중식"></c:param><c:param name="area" value="서울"></c:param></c:url>" role="tab" aria-selected="false">중식</a>
						<a class="nav-link" id="v-pills-2-tab" href="<c:url value="/restaurant/restaurantList.eat"><c:param name="cate" value="일식"></c:param><c:param name="area" value="서울"></c:param></c:url>" role="tab" aria-selected="false">일식</a>
						<a class="nav-link" id="v-pills-3-tab" href="<c:url value="/restaurant/restaurantList.eat"><c:param name="cate" value="양식"></c:param><c:param name="area" value="서울"></c:param></c:url>" role="tab" aria-selected="false">양식</a>
						<a class="nav-link" id="v-pills-4-tab" href="<c:url value="/restaurant/restaurantList.eat"><c:param name="cate" value="분식"></c:param><c:param name="area" value="서울"></c:param></c:url>" role="tab" aria-selected="false">분식</a>
						<a class="nav-link" id="v-pills-5-tab" href="<c:url value="/restaurant/restaurantList.eat"><c:param name="cate" value="카페"></c:param><c:param name="area" value="서울"></c:param></c:url>" role="tab" aria-selected="false">카페</a>
						<a class="nav-link" id="v-pills-6-tab" href="<c:url value="/restaurant/restaurantList.eat"><c:param name="cate" value="기타"></c:param><c:param name="area" value="서울"></c:param></c:url>" role="tab" aria-selected="false">기타</a>
					</div>
					<br/>
					<div class="nav ftco-animate nav-pills justify-content-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<c:forEach begin="0" end="${areaCnt-1}" step="1" var="i">
						<c:set var="area" value="${areaList[i]}"/>
							<a class="nav-link" id="v-pills-${i}-tab" 
								href="<c:url value="/restaurant/restaurantList.eat">
									<c:param name="cate" value="${cate}"></c:param>
									<c:param name="area" value="${area.getArea1()}"></c:param></c:url>" role="tab" aria-selected="false">${area.getArea1()}</a>
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
													<div class="text text-center pt-4">
														<h3><a href="<c:url value="/restaurant/restaurantDetail.eat">
																<c:param name="cnum" value="${rest.getCnum()}"></c:param><c:param name="cate" value="${cate}"></c:param>
																</c:url>">${rest.getStore()}<br/>${rest.getArea1()} ${rest.getArea2()}</a></h3>
														<a class="btn btn-primary btn-outline-primary" href="<c:url value ="/restaurant/restaurantDetail.eat">
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

<jsp:include page="../homepage/footer.jsp"/>

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