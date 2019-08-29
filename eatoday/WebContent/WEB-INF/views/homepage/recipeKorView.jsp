<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%

%>



<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Korean Recipe</title>
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
  </head>
  <body>
  	<jsp:include page="header.jsp" />
    <!-- END nav -->

    <section class="home-slider owl-carousel">

      <div class="slider-item" style="background-image: url(/eatoday/resource/images/bg_3.jpg);" data-stellar-background-ratio="0.5">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
            
		              	<c:set var = "a" value = "${s }"/>
            	<h1 class="mb-3 mt-5 bread">${a}</h1>
	            <p class="breadcrumbs"><span class="mr-2"><a href="index.eat">Home</a></span> <span>Shop</span></p>
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
		            
		              <a class="nav-link" id="v-pills-0-tab" href="<c:url value = "/homepage/recipeKorView.eat"><c:param name = "cate" value = "1"></c:param></c:url>" role="tab" aria-selected="false">밥요리</a>
		              <a class="nav-link" id="v-pills-1-tab" href="<c:url value = "/homepage/recipeKorView.eat"><c:param name = "cate" value = "2"></c:param></c:url>" role="tab" aria-selected="false">국&탕</a>
		              <a class="nav-link" id="v-pills-2-tab" href="<c:url value = "/homepage/recipeKorView.eat"><c:param name = "cate" value = "3"></c:param></c:url>" role="tab" aria-selected="false">찌개&전골</a>
		              <a class="nav-link" id="v-pills-3-tab" href="<c:url value = "/homepage/recipeKorView.eat"><c:param name = "cate" value = "4"></c:param></c:url>" role="tab" aria-selected="false">밑반찬</a>
		              <a class="nav-link" id="v-pills-4-tab" href="<c:url value = "/homepage/recipeKorView.eat"><c:param name = "cate" value = "5"></c:param></c:url>" role="tab" aria-selected="false">볶음요리</a>
		              <a class="nav-link" id="v-pills-5-tab" href="<c:url value = "/homepage/recipeKorView.eat"><c:param name = "cate" value = "6"></c:param></c:url>" role="tab" aria-selected="false">구이(고기/생선)</a>
		              <a class="nav-link" id="v-pills-6-tab" href="<c:url value = "/homepage/recipeKorView.eat"><c:param name = "cate" value = "7"></c:param></c:url>" role="tab" aria-selected="false">찜&조림</a>
		              <a class="nav-link" id="v-pills-7-tab" href="<c:url value = "/homepage/recipeKorView.eat"><c:param name = "cate" value = "8"></c:param></c:url>" role="tab" aria-selected="false">손님상</a>
		              <a class="nav-link" id="v-pills-8-tab" href="<c:url value = "/homepage/recipeKorView.eat"><c:param name = "cate" value = "9"></c:param></c:url>" role="tab" aria-selected="false">아이 반찬</a>
		              <a class="nav-link" id="v-pills-9-tab" href="<c:url value = "/homepage/recipeKorView.eat"><c:param name = "cate" value = "10"></c:param></c:url>" role="tab" aria-selected="false">김치 장아찌</a>
		              <a class="nav-link" id="v-pills-10-tab" href="<c:url value = "/homepage/recipeKorView.eat"><c:param name = "cate" value = "11"></c:param></c:url>" role="tab" aria-selected="false">도시락</a>
		              <a class="nav-link" id="v-pills-11-tab" href="<c:url value = "/homepage/recipeKorView.eat"><c:param name = "cate" value = "12"></c:param></c:url>" role="tab" aria-selected="false">튀김</a>
		              <a class="nav-link" id="v-pills-12-tab" href="<c:url value = "/homepage/recipeKorView.eat"><c:param name = "cate" value = "13"></c:param></c:url>" role="tab" aria-selected="false">면요리</a>
		              <a class="nav-link" id="v-pills-13-tab" href="<c:url value = "/homepage/recipeKorView.eat"><c:param name = "cate" value = "14"></c:param></c:url>" role="tab" aria-selected="false">샐러드</a>
		              <a class="nav-link" id="v-pills-14-tab" href="<c:url value = "/homepage/recipeKorView.eat"><c:param name = "cate" value = "15"></c:param></c:url>" role="tab" aria-selected="false">김밥&초밥</a>
		              <a class="nav-link" id="v-pills-15-tab" href="<c:url value = "/homepage/recipeKorView.eat"><c:param name = "cate" value = "16"></c:param></c:url>" role="tab" aria-selected="false">야식&술안주</a>
		              <a class="nav-link" id="v-pills-16-tab" href="<c:url value = "/homepage/recipeKorView.eat"><c:param name = "cate" value = "17"></c:param></c:url>" role="tab" aria-selected="false">스파게티</a>
		              <a class="nav-link" id="v-pills-17-tab" href="<c:url value = "/homepage/recipeKorView.eat"><c:param name = "cate" value = "18"></c:param></c:url>" role="tab" aria-selected="false">간식&분식</a>
		              <a class="nav-link" id="v-pills-18-tab" href="<c:url value = "/homepage/recipeKorView.eat"><c:param name = "cate" value = "19"></c:param></c:url>" role="tab" aria-selected="false">토스트&샌드위치</a>
		              <a class="nav-link" id="v-pills-19-tab" href="<c:url value = "/homepage/recipeKorView.eat"><c:param name = "cate" value = "20"></c:param></c:url>" role="tab" aria-selected="false">베이킹</a>
		              <a class="nav-link" id="v-pills-20-tab" href="<c:url value = "/homepage/recipeKorView.eat"><c:param name = "cate" value = "21"></c:param></c:url>" role="tab" aria-selected="false">디저트</a>
		              <a class="nav-link" id="v-pills-21-tab" href="<c:url value = "/homepage/recipeKorView.eat"><c:param name = "cate" value = "22"></c:param></c:url>" role="tab" aria-selected="false">주스&음료</a>
		              <a class="nav-link" id="v-pills-22-tab" href="<c:url value = "/homepage/recipeKorView.eat"><c:param name = "cate" value = "23"></c:param></c:url>" role="tab" aria-selected="false">술&칵테일</a>
		              <a class="nav-link" id="v-pills-23-tab" href="<c:url value = "/homepage/recipeKorView.eat"><c:param name = "cate" value = "24"></c:param></c:url>" role="tab" aria-selected="false">명절요리</a>
		              <a class="nav-link" id="v-pills-24-tab" href="<c:url value = "/homepage/recipeKorView.eat"><c:param name = "cate" value = "25"></c:param></c:url>" role="tab" aria-selected="false">기타요리</a>
		            
		            </div>
		          </div>
		          <div class="col-md-12 d-flex align-items-center">
		            
		            <div class="tab-content ftco-animate" id="v-pills-tabContent">

		              <div class="tab-pane fade show active" id="v-pills-0" role="tabpanel" aria-labelledby="v-pills-0-tab">
		              	<div class="row">
		              	
						<c:forEach begin="0" end="${count}" step="1" var="i">
		              	<c:set var = "rcp" value = "${recipeList[i]}" />

		              	<c:if test = "${rcp.getCate() == a}">
		              		<div class="col-md-3">
						        		<div class="menu-entry">
						    					<a href="#" class="img" style="background-image: url(/eatoday/resource/images/menu-1.jpg);"></a>
						    					<div class="text text-center pt-4">
						    						<h3><a href="product-single.eat">${rcp.getName() }</a></h3>
						    						<!--  <p>A small river named Duden flows by their place and supplies</p>
						    						<p class="price"><span>$5.90</span></p>-->
						    						<p><a href="cart.eat" class="btn btn-primary btn-outline-primary">Add to Cart</a></p>
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
  <script src="/eatoday/resource/js/google-map.js"></script>
  <script src="/eatoday/resource/js/main.js"></script>
    
  </body>
</html>