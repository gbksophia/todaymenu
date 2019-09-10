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
			
</div>
            <%-- 
            <div class="tag-widget post-tag-container mb-5 mt-5">
              <div class="tagcloud">
                <a href="#" class="tag-cloud-link">Life</a>
                <a href="#" class="tag-cloud-link">Sport</a>
                <a href="#" class="tag-cloud-link">Tech</a>
                <a href="#" class="tag-cloud-link">Travel</a>
              </div>
            </div>
--%>


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
          
          <!-- .col-md-8 -->


          <div class="col-md-4 sidebar ftco-animate">
          <%-- 
            <div class="sidebar-box">
              <form action="#" class="search-form">
                <div class="form-group">
                	<div class="icon">
	                  <span class="icon-search"></span>
                  </div>
                  <input type="text" class="form-control" placeholder="Search...">
                </div>
              </form>
            </div>
--%>

			 <c:set var = "c" value = "${cookie.cookie.value }"/>  
						<c:forEach begin="0" end="${count}" step="1" var="i">
		              	<c:set var = "rca" value = "${recipeList[i]}" />
		              	<c:if test = "${rca.getCon_num() == c}">
            

            <div class="sidebar-box ftco-animate">
              <h3>Recent Recipe</h3>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url(/eatoday/resource/RecipeImages/${rca.getMain_name()});"></a>
                <div class="text">
                  <h3 class="heading"><a href="<c:url value = "recipeDetail.eat"><c:param name = "abc" value = "${rca.getCon_num()}"></c:param></c:url>">${rca.getTitle() }</a></h3>
                  <div class="meta">
                    <div><a class="btn btn-primary btn-outline-primary" href="<c:url value = "recipeDetail.eat"><c:param name = "abc" value = "${rca.getCon_num()}"></c:param></c:url>">자세히보기</a></div>
                  </div>
                </div>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <div class="categories">
                <h3>${j}Categories</h3>
                <br><br>
                <p>
             		<c:forEach begin="0" end="${count}" step="1" var="i">
		 <c:set var = "rvo" value = "${recipeList[i]}" />
		 <c:if test = "${rvo.getCon_num() == abc }">
             <c:set var = "str" value = "${rvo.getPro() }"/>
             <c:forEach var = "spt" items = "${fn:replace(str, 'next', '<br><br>') }" varStatus = "status">
             <img src="images/image_2.jpg" alt="" class="img-fluid">
             ${spt }
             </c:forEach>
             </c:if>
             </c:forEach>
            </p>
              </div>
            </div>

             	            </c:if>
            </c:forEach>           
<%--
            <div class="sidebar-box ftco-animate">
              <h3>Tag Cloud</h3>
              <div class="tagcloud">
                <a href="#" class="tag-cloud-link">dish</a>
                <a href="#" class="tag-cloud-link">menu</a>
                <a href="#" class="tag-cloud-link">food</a>
                <a href="#" class="tag-cloud-link">sweet</a>
                <a href="#" class="tag-cloud-link">tasty</a>
                <a href="#" class="tag-cloud-link">delicious</a>
                <a href="#" class="tag-cloud-link">desserts</a>
                <a href="#" class="tag-cloud-link">drinks</a>
              </div>
            </div>
 --%><%--
            <div class="sidebar-box ftco-animate">
              <h3>Paragraph</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut, sunt placeat nam vero culpa sapiente consectetur similique, inventore eos fugit cupiditate numquam!</p>
            </div>
             --%>
          </div>

        </div>
      </div>
    </section> <!-- .section -->
asd
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