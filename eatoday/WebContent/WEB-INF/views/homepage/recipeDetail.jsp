<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ page import = "java.net.URLEncoder" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Coffee - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
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
   <script>
   // 찜 여부 확인 실행시 1회  동작
   window.onload = function(){
	   var id = '${sessionScope.loginID}';
	   var cnum = '${rvo.con_num}';
	   $.ajax({
	          url: "/eatoday/memberpage/recipeJjim.eat",
	          type: "post",
	          data: {id : id, cnum : cnum },
	          success: function(data) {
	        	  var elem = document.createElement("img");
	        	  elem.setAttribute("src", data);
	        	  elem.setAttribute("height", "50px");
	      		  elem.setAttribute("width", "50px");
	      		  elem.setAttribute("id", "btn_jjim");
	      		 document.getElementById("jjimImg").appendChild(elem);	
	        	  }
	    	  });
	   
	   // 카테고리 카운트 가져오기
	   for(var i=1;i<24;i++){
		   var id = "cate("+i+")";
	   $.ajax({
	          url: "recipeCateCount.eat",
	          type: "post",
	          data: {cate : i},
	          async: false,
	          success: function(data) {
	        	  var elem = document.createElement("span");
	        	  var data = "("+data+")";
	        	  elem.innerHTML = data;
	        	  document.getElementById(id).appendChild(elem);	
	        	  }
	    	  });
	   console.log(id);
	   }
	   }
	
   
   // 찜 클릭 이벤트
  function jjimClick(){
	  var id = '${sessionScope.loginID}';
	   var cnum = '${rvo.con_num}';

	   if(${sessionScope.loginID == null}){
			alert("로그인 후 이용해 주십시오.");
		   } else {
	   $.ajax({
	          url: "/eatoday/memberpage/recipeJjimClick.eat",
	          type: "post",
	          data: {id : id, cnum : cnum },
	          success: function(data) {
	        	  var elem = document.createElement("img");
	        	  elem.setAttribute("src", data);
	        	  elem.setAttribute("height", "50px");
	      		  elem.setAttribute("width", "50px");
	      		  elem.setAttribute("id", "btn_jjim");
	      		document.getElementById("btn_jjim").src=data;	
	        	  }
	    	  });
	  }
  }
   
  // 댓글 좋아요 클릭 이벤트
  function niceClick(num,i) {
	  var id = '${sessionScope.loginID}';
	  var img = "img"+i;

	  if(${sessionScope.loginID == null}){
			alert("로그인후 이용해주십시오.");
		  }else {
      $.ajax({
          url: "niceClick.eat",
          type: "post",
          data: {id : id, num : num },
          success: function(data) {
        document.getElementById(img).src=data;
        	  }
    	  });
  		}
  	}
  
  // 댓글 좋아요 체크
  function niceCheck(num,i){
	  var img = "likeImg"+i;
	  var id = "img"+i;
	  $.ajax({
			url: "nice.eat",
			type: "post",
			async: false,
			data: {id : '${sessionScope.loginID}', num : num},
		  success: function(data) {
  		  var elem = document.createElement("img");
  		  elem.setAttribute("src", data);
  		  elem.setAttribute("height", "20px");
  		  elem.setAttribute("width", "20px");
  		  elem.setAttribute("id", id);
		  document.getElementById(img).appendChild(elem);	
				}
		  });
	  }
  
  //검색 유효성 검사
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


      <div class="slider-item" style="background-image: url(/eatoday/resource/RecipeImages/${rvo.getMain_name()});">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
            	<h1 class="mb-3 mt-5 bread">${rvo.getTitle() }</h1>
	            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span class="mr-2"><a href="blog.html">Blog</a></span> <span>Blog Single</span></p>
            </div>

          </div>
        </div>
      </div>
    </section>
    
    <section class="ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-md-8 ftco-animate">
            <h2 class="mb-3">재료</h2>
<p>
		     <c:set var = "str" value = "${rvo.getMate() }"/>
             <c:forEach var = "spt" items = "${fn:replace(str, 'next', '<br>') }" varStatus = "status">
             <img src="images/image_2.jpg" alt="" class="img-fluid">
             ${spt }
             </c:forEach>
        
   
             
            </p>
            <h2 class="mb-3 mt-5">조리법</h2>

            
            <div class="vcard bio">
            
            <c:forEach begin="1" end="${proCount }" step="1" var="i">
            	<c:if test="${i==1 }">
            	<c:set var = "j" value = "0" />
            	</c:if>
				<c:set var = "rcpro" value = "${pro[i-1]}" />
				<c:choose>
				<c:when test="${i%2 == 1 }">
				<c:set var = "img" value = "${ivo[j]}" />
				<img src="/eatoday/resource/RecipePro/${img.getImg1() }" alt="" class="img-fluid" width = "400px" height = "200px">
				</c:when>
				<c:otherwise>
				<img src="/eatoday/resource/RecipePro/${img.getImg2() }" alt="" class="img-fluid" width = "400px" height = "200px">
				<c:set var = "j" value = "${j+1 }" />
				</c:otherwise>
				</c:choose>
			<p>  ${rcpro } </p>
				<br><br>
			</c:forEach>
			<div style="text-align: center">
				<a id="jjimImg" onclick="javascript:jjimClick()">
					
				</a>
			</div>
</div>
         

	<!-- 댓글 -->
            <div class="pt-5 mt-5">
              <h3 class="mb-5">${recount} Comments</h3>
              <ul class="comment-list">
              <c:set var="i" value="0"/>
              	<c:forEach var="recipeReviewVO" items="${revo }">
              	<c:set var="i" value="${i+1 }" />
              	<c:set var="likeImg" value="javascript:imgcheck('${recipeReviewVO.getNum() }')"/>
              	 <li class="comment">
                  <div class="comment-body">
                  <h3>${recipeReviewVO.nick }</h3>
                  <div class="meta">${recipeReviewVO.reg_date }</div>
                  <p>${recipeReviewVO.text }</p>
                  <c:if test="${recipeReviewVO.img != null }">
                  	<img src="/eatoday/resource/RecipeReview/${recipeReviewVO.img }" height="400px">
                  </c:if>
           			
                   <div class="text-right">
                   <p>${reviewNiceCount}</p>
                   <a id="likeImg${i }" onclick="javascript:niceClick('${recipeReviewVO.num}','${i }')">
                    <script>
                    niceCheck('${recipeReviewVO.num}','${i}')	
 				 	</script>
                   </a>
                   </div> 
                  </div>  
                </li>
              	</c:forEach>
              </ul>
              <!-- END comment-list -->
      <!-- 댓글 달기 -->
              <div class="comment-form-wrap pt-5">
              	<c:choose>
              		<c:when test="${sessionScope.loginID == null }">
              			<form>
              			<div class="form-group">
              				<input class="btn py-3 px-4 btn-primary" type="button" value="로그인 후 댓글 쓰기 가능" onclick="location='/eatoday/loginpage/login.eat'">
              				</div>
              			</form>
              		</c:when>
              		<c:otherwise>
              		 <form action="recipeRePro.eat" method="post" enctype="multipart/form-data">
                	<input type="hidden" name="cnum" value="${rvo.getCon_num() }">
                	<input type="hidden" name="id" value="${sessionScope.loginID }">
                  <div class="form-group">
                    <textarea name="text" id="text" cols="30" rows="10" class="form-control" placeholder="댓글을 입력해주세요"></textarea>
                  </div>
                  
                  <div class="form-group">
                    <input  class="form-control" type="text" name="nick"  placeholder="닉네임" />
                  </div>
                  
                  <div class="form-group">
                    <input type="file" name="img"  />
                  </div>
                  <div class="form-group">
                  	<div class="text-right">
                    <input type="submit" value="Post Comment" class="btn py-3 px-4 btn-primary">
                  </div>
                  </div>
                </form>
              		</c:otherwise>
              	</c:choose>
              </div>
              </div>
             </div>
            <div class="col-md-4 sidebar ftco-animate fadeInUp ftco-animated">
            <div class="sidebar-box">
              <form name="searchBar" action="SearchRecipe.eat" onSubmit="return searchCheck();" class="search-form">
                <div class="form-group">
                	<div class="icon">
	                  <span class="icon-search"></span>
                  </div>
                  <input type="text" name="search" id="search" class="form-control" placeholder="Search...">
                </div>
              </form>
            </div>
            <div class="sidebar-box ftco-animate fadeInUp ftco-animated">
              <div class="categories">
                <h3>Categories</h3>
                <li><a href="recipeListView.eat?cate=1" id="cate(1)">밥요리</a></li>
                <li><a href="recipeListView.eat?cate=2" id="cate(2)">국&탕 </a></li>
                <li><a href="recipeListView.eat?cate=3" id="cate(3)">찌개&전골 </a></li>
                <li><a href="recipeListView.eat?cate=4" id="cate(4)">밑반찬 </a></li>
                <li><a href="recipeListView.eat?cate=5" id="cate(5)">볶음요리 </a></li>
                <li><a href="recipeListView.eat?cate=6" id="cate(6)">구이(고기/생선)</a></li>
                <li><a href="recipeListView.eat?cate=7" id="cate(7)">찜&조림</a></li>
                <li><a href="recipeListView.eat?cate=8" id="cate(8)">손님상 </a></li>
                <li><a href="recipeListView.eat?cate=9" id="cate(9)">아이 반찬 </a></li>
                <li><a href="recipeListView.eat?cate=10" id="cate(10)">김치 장아찌</a></li>
                <li><a href="recipeListView.eat?cate=11" id="cate(11)">도시락</a></li>
                <li><a href="recipeListView.eat?cate=12" id="cate(12)">튀김 </a></li>
                <li><a href="recipeListView.eat?cate=13" id="cate(13)">면요리</a></li>
             	<li><a href="recipeListView.eat?cate=14" id="cate(14)">샐러드</a></li>
             	<li><a href="recipeListView.eat?cate=15" id="cate(15)">야식&술안주</a></li>
             	<li><a href="recipeListView.eat?cate=16" id="cate(16)">스파게티 </a></li>
             	<li><a href="recipeListView.eat?cate=17" id="cate(17)">간식&분식 </a></li>
             	<li><a href="recipeListView.eat?cate=18" id="cate(18)">토스트&샌드위치</a></li>
             	<li><a href="recipeListView.eat?cate=19" id="cate(19)">베이킹</a></li>
             	<li><a href="recipeListView.eat?cate=20" id="cate(20)">디저트 </a></li>
             	<li><a href="recipeListView.eat?cate=21" id="cate(21)">주스&음료 </a></li>
             	<li><a href="recipeListView.eat?cate=22" id="cate(22)">술&칵테일</a></li>
             	<li><a href="recipeListView.eat?cate=23" id="cate(23)">명절요리</a></li>
              </div>
            </div>
		</div>
		</div>
            </div>
      
    </section> <!-- .section -->

   <jsp:include page="footer.jsp" />
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


 
  
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