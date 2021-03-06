<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Recipe List</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
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

//레시피 삭제 
function delchk(cnum,i){
	var result = confirm("삭제하시겠습니까?");
	var tag = "#object"+i;
	if(result){
		$.ajax({
			url: "recipeDelete.eat",
			type: "post",
			data: {cnum:cnum },
			success: function(data) {
				$(tag).remove();
			}
	});
	}
}
</script>
</head>

<body>
<jsp:include page="header.jsp" />
<!-- END nav -->

<div="container"  style="padding-down:300px;"></div>


<section class="home-slider owl-carousel">
	<div class="slider-item" style="background-image: url(/eatoday/resource/RecipeImages/${cateImg}); ">
    <div class="overlay"></div>
    	<div class="container">
        	<div class="row slider-text justify-content-center align-items-center">
            	<div class="col-md-7 col-sm-12 text-center ftco-animate">
		        	<c:choose>
		         		<c:when test = "${cate == 1 }"><h1 class="mb-3 mt-5 bread">밥요리</h1></c:when>
						<c:when test = "${cate == 2 }"><h1 class="mb-3 mt-5 bread">국&탕</h1></c:when>
						<c:when test = "${cate == 3 }"><h1 class="mb-3 mt-5 bread">찌개&전골</h1></c:when>
						<c:when test = "${cate == 4 }"><h1 class="mb-3 mt-5 bread">밑반찬</h1></c:when>
						<c:when test = "${cate == 5 }"><h1 class="mb-3 mt-5 bread">볶음요리</h1></c:when>
						<c:when test = "${cate == 6 }"><h1 class="mb-3 mt-5 bread">구이(고기/생선)</h1></c:when>
						<c:when test = "${cate == 7 }"><h1 class="mb-3 mt-5 bread">찜&조림</h1></c:when>
						<c:when test = "${cate == 8 }"><h1 class="mb-3 mt-5 bread">손님상</h1></c:when>
						<c:when test = "${cate == 9 }"><h1 class="mb-3 mt-5 bread">아이반찬</h1></c:when>
						<c:when test = "${cate == 10 }"><h1 class="mb-3 mt-5 bread">김치 장아찌</h1></c:when>
						<c:when test = "${cate == 11 }"><h1 class="mb-3 mt-5 bread">도시락</h1></c:when>
						<c:when test = "${cate == 12 }"><h1 class="mb-3 mt-5 bread">튀김</h1></c:when>
						<c:when test = "${cate == 13 }"><h1 class="mb-3 mt-5 bread">면요리</h1></c:when>
						<c:when test = "${cate == 14 }"><h1 class="mb-3 mt-5 bread">샐러드</h1></c:when>
						<c:when test = "${cate == 15 }"><h1 class="mb-3 mt-5 bread">야식&술안주</h1></c:when>
						<c:when test = "${cate == 16 }"><h1 class="mb-3 mt-5 bread">스파게티</h1></c:when>
						<c:when test = "${cate == 17 }"><h1 class="mb-3 mt-5 bread">간식&분식</h1></c:when>
						<c:when test = "${cate == 18 }"><h1 class="mb-3 mt-5 bread">토스트&샌드위치</h1></c:when>
						<c:when test = "${cate == 19 }"><h1 class="mb-3 mt-5 bread">베이킹</h1></c:when>
						<c:when test = "${cate == 20 }"><h1 class="mb-3 mt-5 bread">디저트</h1></c:when>
						<c:when test = "${cate == 21 }"><h1 class="mb-3 mt-5 bread">주스&음료</h1></c:when>
						<c:when test = "${cate == 22 }"><h1 class="mb-3 mt-5 bread">술&칵테일</h1></c:when>
						<c:when test = "${cate == 23 }"><h1 class="mb-3 mt-5 bread">명절요리</h1></c:when>
					</c:choose>
					<p class="breadcrumbs"><span class="mr-2"><a href="index.eat">Home</a></span></p>
            	</div>
			</div>
		</div>
	</div>
</section>

<!--  검색  -->
<section class="ftco-counter ftco-bg-dark img" id="section-counter" style="background-image: url(images/bg_2.jpg);" data-stellar-background-ratio="0.5";>
	<div class="container">
		<div class="hd_column2">
        	<form name="searchBar" action="SearchRecipe.eat" onSubmit="return searchCheck();" class="search-form">
            	<div class="form-group">
                	<div class="icon">
	                	<span class="icon-search"></span>
					</div>
					<input type="text" name="search" id="search" class="form-control" placeholder="Search...">
                </div>
			</form>
		</div>
	</div>
</section> 

<section class="ftco-menu mb-5 pb-5">
	<div class="container">
	   	<!-- 레시피 카테고리 버튼 --> 
    	<div class="row d-md-flex">
			<div class="col-lg-12 ftco-animate p-md-5">
				<div class="row">
		    		<div class="col-md-12 nav-link-wrap mb-5">
		            	<div class="nav ftco-animate nav-pills justify-content-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
							<a class="nav-link" id="v-pills-0-tab" href="<c:url value = "/homepage/recipeListView.eat"><c:param name = "cate" value = "1"></c:param></c:url>" role="tab" aria-selected="false">밥요리</a>
							<a class="nav-link" id="v-pills-1-tab" href="<c:url value = "/homepage/recipeListView.eat"><c:param name = "cate" value = "2"></c:param></c:url>" role="tab" aria-selected="false">국&탕</a>
							<a class="nav-link" id="v-pills-2-tab" href="<c:url value = "/homepage/recipeListView.eat"><c:param name = "cate" value = "3"></c:param></c:url>" role="tab" aria-selected="false">찌개&전골</a>
							<a class="nav-link" id="v-pills-3-tab" href="<c:url value = "/homepage/recipeListView.eat"><c:param name = "cate" value = "4"></c:param></c:url>" role="tab" aria-selected="false">밑반찬</a>
							<a class="nav-link" id="v-pills-4-tab" href="<c:url value = "/homepage/recipeListView.eat"><c:param name = "cate" value = "5"></c:param></c:url>" role="tab" aria-selected="false">볶음요리</a>
							<a class="nav-link" id="v-pills-5-tab" href="<c:url value = "/homepage/recipeListView.eat"><c:param name = "cate" value = "6"></c:param></c:url>" role="tab" aria-selected="false">구이(고기/생선)</a>
							<a class="nav-link" id="v-pills-6-tab" href="<c:url value = "/homepage/recipeListView.eat"><c:param name = "cate" value = "7"></c:param></c:url>" role="tab" aria-selected="false">찜&조림</a>
							<a class="nav-link" id="v-pills-7-tab" href="<c:url value = "/homepage/recipeListView.eat"><c:param name = "cate" value = "8"></c:param></c:url>" role="tab" aria-selected="false">손님상</a>
							<a class="nav-link" id="v-pills-8-tab" href="<c:url value = "/homepage/recipeListView.eat"><c:param name = "cate" value = "9"></c:param></c:url>" role="tab" aria-selected="false">아이 반찬</a>
							<a class="nav-link" id="v-pills-9-tab" href="<c:url value = "/homepage/recipeListView.eat"><c:param name = "cate" value = "10"></c:param></c:url>" role="tab" aria-selected="false">김치 장아찌</a>
							<a class="nav-link" id="v-pills-10-tab" href="<c:url value = "/homepage/recipeListView.eat"><c:param name = "cate" value = "11"></c:param></c:url>" role="tab" aria-selected="false">도시락</a>
							<a class="nav-link" id="v-pills-11-tab" href="<c:url value = "/homepage/recipeListView.eat"><c:param name = "cate" value = "12"></c:param></c:url>" role="tab" aria-selected="false">튀김</a>
							<a class="nav-link" id="v-pills-12-tab" href="<c:url value = "/homepage/recipeListView.eat"><c:param name = "cate" value = "13"></c:param></c:url>" role="tab" aria-selected="false">면요리</a>
							<a class="nav-link" id="v-pills-13-tab" href="<c:url value = "/homepage/recipeListView.eat"><c:param name = "cate" value = "14"></c:param></c:url>" role="tab" aria-selected="false">샐러드</a>
							<a class="nav-link" id="v-pills-14-tab" href="<c:url value = "/homepage/recipeListView.eat"><c:param name = "cate" value = "15"></c:param></c:url>" role="tab" aria-selected="false">야식&술안주</a>
							<a class="nav-link" id="v-pills-15-tab" href="<c:url value = "/homepage/recipeListView.eat"><c:param name = "cate" value = "16"></c:param></c:url>" role="tab" aria-selected="false">스파게티</a>
							<a class="nav-link" id="v-pills-16-tab" href="<c:url value = "/homepage/recipeListView.eat"><c:param name = "cate" value = "17"></c:param></c:url>" role="tab" aria-selected="false">간식&분식</a>
							<a class="nav-link" id="v-pills-17-tab" href="<c:url value = "/homepage/recipeListView.eat"><c:param name = "cate" value = "18"></c:param></c:url>" role="tab" aria-selected="false">토스트&샌드위치</a>
							<a class="nav-link" id="v-pills-18-tab" href="<c:url value = "/homepage/recipeListView.eat"><c:param name = "cate" value = "19"></c:param></c:url>" role="tab" aria-selected="false">베이킹</a>
							<a class="nav-link" id="v-pills-19-tab" href="<c:url value = "/homepage/recipeListView.eat"><c:param name = "cate" value = "20"></c:param></c:url>" role="tab" aria-selected="false">디저트</a>
							<a class="nav-link" id="v-pills-20-tab" href="<c:url value = "/homepage/recipeListView.eat"><c:param name = "cate" value = "21"></c:param></c:url>" role="tab" aria-selected="false">주스&음료</a>
							<a class="nav-link" id="v-pills-21-tab" href="<c:url value = "/homepage/recipeListView.eat"><c:param name = "cate" value = "22"></c:param></c:url>" role="tab" aria-selected="false">술&칵테일</a>
							<a class="nav-link" id="v-pills-22-tab" href="<c:url value = "/homepage/recipeListView.eat"><c:param name = "cate" value = "23"></c:param></c:url>" role="tab" aria-selected="false">명절요리</a>
						</div> <!-- "nav ftco-animate nav-pills justify-content-center" -->
					</div> <!-- "col-md-12 nav-link-wrap mb-5" -->
				</div> <!-- "row" -->
			</div> <!-- "col-lg-12 ftco-animate p-md-5" -->
		      
			<c:if test = "${sessionScope.loginID.equals('admin@eatoday.com') }">		   
				<div class="text-left">
   					<input type="button" value="레시피 등록" class="btn py-3 px-4 btn-primary" onclick="location='recipeCreate.eat'">
    			</div>
    		</c:if>
		</div> <!-- "row d-md-flex" -->

		<!-- 카테고리별 레시피 출력 파트 -->  
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3"></div>
        	<div class="row">
        		<c:set var="i" value="0"/>	          	
		    	<c:forEach var = "rcp" items = "${recipeList}" >
		    		<c:set var="i" value="${i+1 }"/>	         	
		     		<div id="object${i}" class="col-md-3">
						<div class="menu-entry">
							<a href="<c:url value = "recipeDetail.eat">
								<c:param name = "cnum" value = "${rcp.getCnum()}"></c:param>
								<c:param name = "cate" value = "${cate}"></c:param></c:url>" 
								class="img" style="background-image: url(/eatoday/resource/RecipeImages/${rcp.getMain_name()});"></a>

							<div class="text text-center pt-4">
								<h3><a href="<c:url value = "recipeDetail.eat">
									<c:param name = "cnum" value = "${rcp.getCnum()}"></c:param>
									<c:param name = "cate" value = "${cate}"></c:param></c:url>">${rcp.getTitle() }</a></h3>
								<a class="btn btn-primary btn-outline-primary" id="showRbtn" href="<c:url value = "recipeDetail.eat">
									<c:param name = "cnum" value = "${rcp.getCnum()}"></c:param>
									<c:param name = "cate" value = "${cate}"></c:param></c:url>">자세히보기</a>	
								<c:if test = "${sessionScope.loginID.equals('admin@eatoday.com') }">		
									<a class="btn btn-primary btn-outline-primary" id="editRbtn" href="<c:url value = "recipeEdit.eat">
										<c:param name = "cnum" value = "${rcp.getCnum()}"></c:param>
										<c:param name = "cate" value = "${cate}"></c:param></c:url>">수정</a>	
									<a class="btn btn-primary btn-outline-primary" id="deleteRbtn" onclick="return delchk('${rcp.cnum}','${i }');">삭제</a>	
								</c:if>
							</div>
						</div>
					</div>
		    	</c:forEach>	
		    </div> <!-- "row" -->

			<!-- 페이징 -->  
		  	<div class="text-center">
		  		<c:if test="${startPage >10 }">
 			 		<a href="recipeListView.eat?page=${startPage-10 }&cate=${cate}">&nbsp;<< &nbsp;</a>
 		 		</c:if>
         		<c:forEach begin="${startPage }" end="${endPage }" step="1" var="i">
            		<a href="recipeListView.eat?page=${i}&cate=${cate}">${i }</a>
            		<c:if test="${i!=endPage}">&nbsp;|&nbsp;</c:if>
          		</c:forEach>
          		<c:if test="${endPage < pageCount }">
 					<a href="recipeListView.eat?page=${startPage+10 }&cate=${cate}"> &nbsp;>>&nbsp; </a>
 		  		</c:if>
          	</div> <!-- "text-center" -->  
		</div>	 <!-- "container" -->
	</div> <!--"container"   -->
</section> <!--"ftco-menu mb-5 pb-5"   -->
    
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