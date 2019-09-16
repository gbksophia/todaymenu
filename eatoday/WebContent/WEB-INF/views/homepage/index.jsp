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
    
    <link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
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
   border: 3px solid pink;
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
   border-bottom: 2px solid pink;
   border-radius: 0;
   background-position: 100% center;
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
              <p><a href="menu.eat" class="btn btn-primary p-3 px-xl-4 py-xl-3">식당 찾기</a> <a href="#" class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">만들어 먹기</a></p>
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
              <p><a href="menu.eat" class="btn btn-primary p-3 px-xl-4 py-xl-3">식당 찾기</a> <a href="#" class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">만들어 먹기</a></p>
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
              <p><a href="menu.eat" class="btn btn-primary p-3 px-xl-4 py-xl-3">식당 찾기</a> <a href="#" class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">만들어 먹기</a></p>
            </div>

          </div>
        </div>
      </div>
    </section>

    <section class="ftco-intro">
    	
    </section>

    <section class="ftco-about d-md-flex">
    
    </section>

<!--  검색  -->
<section class="ftco-counter ftco-bg-dark img" id="section-counter" style="background-image: url(images/bg_2.jpg);" data-stellar-background-ratio="0.5";>
      <div class="container">

         <div class="hd_column2">
            <div class=".search_body">
               <form name="searchBar" action="searchResult.eat"
                  onSubmit="return searchCheck();">
                  <input type="text" name="search" id="search" class="search__input"
                     placeholder="식당 검색 하시던지 말던지">
                  <input type = "submit" value = "검색">
               </form>
            </div>

         </div>
</div>
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
                                            <p> </p>
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
        
        			<h1>${sessionScope.loginID }님의 추천 레시피</h1><br/><br/>
        	<div class="row" style = "margin-top:100px;">
			
			
			
			 <c:forEach var="rcp" items="${recipeList }">
		
                <!-- Small Receipe Area -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-small-receipe-area d-flex">
                        <!-- Receipe Thumb -->
                        <div class="receipe-thumb">
                            <img src="/eatoday/resource/RecipeImages/${rcp.getMain_name()}" alt="" width = "100px" height = "100px">
                        </div>
                        <!-- Receipe Content -->
                        <div class="receipe-content">
                            <a href="receipe-post.html">
                                <h5>${rcp.getTitle()}</h5>
                            </a>
                          
                            <p>&nbsp;<a class="btn btn-primary btn-outline-primary" href="<c:url value = "recipeDetail.eat"><c:param name = "cnum" value = "${rcp.getCnum()}"></c:param>
                            <c:param name = "cate" value = "${rcp.getCate()}"></c:param></c:url>">자세히보기</a></p>
                        </div>
                    </div>
                </div>
                <br>
                </c:forEach>

            </div>
        </div>
      </div>
    </section>
</c:if>

<c:if test="${sessionScope.loginID == null}">

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


		<!--  
		<section class="ftco-appointment">
			<div class="overlay"></div>
    	<div class="container-wrap">
    		<div class="row no-gutters d-md-flex align-items-center">
    			<div class="col-md-6 d-flex align-self-stretch">
    				<div id="map"></div>
    			</div>
	    		<div class="col-md-6 appointment ftco-animate">
	    			<h3 class="mb-3">Book a Table</h3>
	    			<form action="#" class="appointment-form">
	    				<div class="d-md-flex">
		    				<div class="form-group">
		    					<input type="text" class="form-control" placeholder="First Name">
		    				</div>
		    				<div class="form-group ml-md-4">
		    					<input type="text" class="form-control" placeholder="Last Name">
		    				</div>
	    				</div>
	    				<div class="d-md-flex">
		    				<div class="form-group">
		    					<div class="input-wrap">
		            		<div class="icon"><span class="ion-md-calendar"></span></div>
		            		<input type="text" class="form-control appointment_date" placeholder="Date">
	            		</div>
		    				</div>
		    				<div class="form-group ml-md-4">
		    					<div class="input-wrap">
		            		<div class="icon"><span class="ion-ios-clock"></span></div>
		            		<input type="text" class="form-control appointment_time" placeholder="Time">
	            		</div>
		    				</div>
		    				<div class="form-group ml-md-4">
		    					<input type="text" class="form-control" placeholder="Phone">
		    				</div>
	    				</div>
	    				<div class="d-md-flex">
	    					<div class="form-group">
		              <textarea name="" id="" cols="30" rows="2" class="form-control" placeholder="Message"></textarea>
		            </div>
		            <div class="form-group ml-md-4">
		              <input type="submit" value="Appointment" class="btn btn-primary py-3 px-4">
		            </div>
	    				</div>
	    			</form>
	    		</div>    			
    		</div>
    	</div>
    </section>
-->
    
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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="/eatoday/resource/js/google-map.js"></script>
  <script src="/eatoday/resource/js/main.js"></script>
    
  </body>
</html>