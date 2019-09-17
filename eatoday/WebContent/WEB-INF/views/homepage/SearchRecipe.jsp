<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Search Recipe</title>
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

      <div class="slider-item" style="background-image: url(images/bg_3.jpg);" data-stellar-background-ratio="0.5">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
            	<h1 class="mb-3 mt-5 bread">"${srch}"에 대한 검색결과</h1>
	            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Product Detail</span></p>
            </div>

          </div>
        </div>
      </div>
    </section>


		             <!--  검색  -->
<section class="ftco-counter ftco-bg-dark img" id="section-counter" style="background-image: url(images/bg_2.jpg);" data-stellar-background-ratio="0.5";>
      <div class="container">

         <div class="hd_column2">
            <div class=".search_body">
               <form name="searchBar" action="SearchRecipe.eat"
                  onSubmit="return searchCheck();">
                  <input type="text" name="search" id="search" class="search__input"
                     placeholder="레시피 검색 하시던지 말던지">
                  <input type = "submit" value = "검색">
               </form>
            </div>

         </div>
</div>
</section>

<c:set var = "s" value = "${srch}"/> 

    <section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center mb-5 pb-3">
        </div>

        <div class="row">

        <h2 class="mb-3">재료에서 검색한 결과 </h2>
        <div class="row">        	
          <c:forEach var="rcpMatVO" items="${rcpMat}">
			<div class="col-md-3">
        		<div class="menu-entry">
    					<a href="<c:url value = "recipeDetail.eat"><c:param name = "cnum" value = "${rcpMatVO.getCnum()}"></c:param><c:param name = "cate" value = "${rcpMatVO.getCate()}"></c:param></c:url>" class="img" style="background-image: url(/eatoday/resource/RecipeImages/${rcpMatVO.getMain_name()});"></a>
						<div class="text text-center pt-4">
						    <h3><a href="<c:url value = "recipeDetail.eat"><c:param name = "cnum" value = "${rcpMatVO.getCnum()}"></c:param><c:param name = "cate" value = "${rcpMatVO.getCate()}"></c:param></c:url>">${rcpMatVO.getTitle() }</a></h3>
						    	<a class="btn btn-primary btn-outline-primary" href="<c:url value = "recipeDetail.eat"><c:param name = "cnum" value = "${rcpMatVO.getCnum()}"></c:param></c:url>">자세히보기</a>
						  </div>
    				</div>
        	</div>
        	</c:forEach>
        	</div>
        	
        <div class="container">
    		<div class="row justify-content-center mb-5 pb-3">
        </div>
        
        <h2 class="mb-3">이름에서 검색한 결과</h2>
        	
       
        <div class="row">        	
          <c:forEach var="rcpTitVO" items="${rcpTit}">
			<div class="col-md-3">
        		<div class="menu-entry">
    					<a href="<c:url value = "recipeDetail.eat"><c:param name = "cnum" value = "${rcpTitVO.getCnum()}"></c:param><c:param name = "cate" value = "${rcpTitVO.getCate()}"></c:param></c:url>" class="img" style="background-image: url(/eatoday/resource/RecipeImages/${rcpTitVO.getMain_name()});"></a>
						<div class="text text-center pt-4">
						    <h3><a href="<c:url value = "recipeDetail.eat"><c:param name = "cnum" value = "${rcpTitVO.getCnum()}"></c:param><c:param name = "cate" value = "${rcpTitVO.getCate()}"></c:param></c:url>">${rcpTitVO.getTitle() }</a></h3>
						    	<a class="btn btn-primary btn-outline-primary" href="<c:url value = "recipeDetail.eat"><c:param name = "cnum" value = "${rcpTitVO.getCnum()}"></c:param></c:url>">자세히보기</a>
						  </div>
    				</div>
        	</div>
        	</c:forEach>
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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="/eatoday/resource/js/google-map.js"></script>
  <script src="/eatoday/resource/js/main.js"></script>

  <script>
		$(document).ready(function(){

		var quantitiy=0;
		   $('.quantity-right-plus').click(function(e){
		        
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantity').val());
		        
		        // If is not undefined
		            
		            $('#quantity').val(quantity + 1);

		          
		            // Increment
		        
		    });

		     $('.quantity-left-minus').click(function(e){
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantity').val());
		        
		        // If is not undefined
		      
		            // Increment
		            if(quantity>0){
		            $('#quantity').val(quantity - 1);
		            }
		    });
		    
		});
	</script>

    
  </body>
</html>