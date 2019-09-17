<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ page import = "java.net.URLEncoder" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>${rvo.getStore()}</title>
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
   // 카테고리 카운트 가져오기
   window.onload =function(){ 
	   var cate = ["한식","중식","일식","양식","분식","카페","기타"];
	   for(var i=0;i<7;i++){
		   var j = i+1;
		   var id = "cate("+j+")";
		   var item = cate[i];
	   $.ajax({
	          url: "restaurantCateCount.eat",
	          type: "post",
	          data: {cate : item},
	          async: false,
	          success: function(data) {
	        	  var categori = document.createElement("span");
	        	  var data = "("+data+")";
	        	  categori.innerHTML = data;
	        	  document.getElementById(id).appendChild(categori);	
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
          url: "restaurantNiceClick.eat",
          type: "post",
          data: {id : id, num : num },
          success: function(data) {
        document.getElementById(img).src=data;
        niceCountClick(num,i);
        	  }
    	  });
  		}
  	}
  
  // 댓글 좋아요 이미지 체크
  function niceCheck(num,i){
	  var img = "likeImg"+i;
	  var id = "img"+i;
	  $.ajax({
			url: "restaurantNice.eat",
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
	  // 댓글 좋아요 갯수 체크
	  function niceCountCheck(renum,i){
		 id = "niceCount"+i;
		  $.ajax({
				url: "restaurantNiceCountCheck.eat",
				type: "post",
				async: false,
				data: { renum : renum},
			  success: function(data) {
	  		  var elem = document.createElement("span");
	  		 elem.innerHTML = data;
      	  	 document.getElementById(id).appendChild(elem);	
					}
			  });
	  }
  
	// 댓글 좋아요 갯수 클릭
	  function niceCountClick(renum,i){
		 id = "niceCount"+i;
		  $.ajax({
				url: "restaurantNiceCountCheck.eat",
				type: "post",
				data: { renum : renum},
			  success: function(data) {
				  document.getElementById(id).innerHTML = data;
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
  
//업데이트 폼 생성
  function reviewUpdate(num,i){
	  var reviewtext = "reviewtext"+i;
	  var UpdateBtn = "UpdateBtn"+i;
	  var check = document.getElementById("textUpdate");
	 var textId = "#textarea"+i;
	 var text = $(textId).val();
	if(check == null){
	  //업데이트 텍스트 에어리어 생성
	  var elem = document.createElement("textarea");
		  elem.setAttribute("class", "form-control");
		  elem.setAttribute("rows", "10");
		  elem.setAttribute("cols", "30");
		  elem.setAttribute("id", "textUpdate");
		  elem.setAttribute("name", "textUpdate");
		  elem.innerHTML = text;
	  document.getElementById(reviewtext).appendChild(elem);
	  
	  //업데이트 버튼 생성
	  var btn = document.createElement("input");
	  var onclick ="Update('"+num+"','"+textId+"')";
	  btn.setAttribute("type","button");
	  btn.setAttribute("value","Update Comment");
	  btn.setAttribute("class","btn py-3 px-4 btn-primary");
	  btn.setAttribute("onclick",onclick);
	  btn.setAttribute("id", "UpdateBtn");
	  document.getElementById(UpdateBtn).appendChild(btn);
	  } else {
		  $("#textUpdate").remove();
		  $("#UpdateBtn").remove();
	  }
  }
  
  
  // 리뷰 업데이트 적용
  function Update(num,id){
	  var text = $("#textUpdate").val();
	  $.ajax({
			url: "restaurantReviewUpdate.eat",
			type: "post",
			data: { text : text, num : num},
		  success: function(data) {
			  $("#textUpdate").remove();
			  $("#UpdateBtn").remove();
			  $(id).val(data);
				}
		  });
  }
  
  //리뷰 삭제
  function reviewRemove(num,i,cnum){
	  var conf = confirm("리뷰를 삭제하시겠습니까?");
	  
	  if(conf){
	  var id = "#comment"+i;
	  $.ajax({
			url: "restaurantReviewRemove.eat",
			type: "post",
			data: { num : num},
		  success: function() {
			  $(id).remove();
			  reviewCount(cnum);
				}
		  });
	  }
  }
  
  // 리뷰 삭제 후 갯수 초기화
  function reviewCount(cnum){
	  $.ajax({
			url: "restaurantReviewCount.eat",
			type: "post",
			data: { cnum : cnum},
		  success: function(data) {
			  var data = data+" Comments";
			  document.getElementById("Comments").innerHTML = data;
	
				}
		  });
  }

//리뷰 쓰기
  function reviewWrite(){
	  var form = $("#reviewWriteForm")[0];
	  var data = new FormData(form);
	  $.ajax({
			url: "restaurantRePro.eat",
			enctype: 'multipart/form-data',
			type: "post",
			processData: false,
            contentType: false,
            cache: false,
			data:  data,
		  success: function(data) {
			  location.reload();
			  document.getElementById('Comments').scrollIntoView();
				}
		  });
	  }
  </script>
  
  <style>
		
		textarea {
			color: #585858;
			background-color: #000000;
		}

	  .wrap {
      width: 500px;
    }
    .wrap textarea {
      width: 100%;
      resize: none;
      overflow-y: hidden; /* prevents scroll bar flash */
      padding: 1.1em; /* prevents text jump on Enter keypress */
      padding-bottom: 0.2em;
      line-height: 1.6;
    }

    textarea:disabled{
    	width: 800px;
    	resize: none;
    	border: 0;
    	overflow-y:hidden;
    } 
</style>
</head>

<body>
<jsp:include page="header.jsp" />
<!-- END nav --> 
<section class="home-slider owl-carousel">
<%-- <div class="slider-item" style="background-image: url(/eatoday/resource/RecipeImages/${rca.getMain_name()});"> --%>
<div class="slider-item" style="background-image: url(/eatoday/resource/images/breadcumb4.jpg);">
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
				<jsp:include page="/map/map_kwd_rest.eat"/>
			</div>
			
		<!-- 댓글 -->
            <div class="pt-5 mt-5">
              <h3 id="Comments" class="mb-5">${recount} Comments</h3>
              <ul class="comment-list">
              <c:set var="i" value="0"/>
              	<c:forEach var="restaurantReviewVO" items="${revo }">
              	<c:set var="i" value="${i+1 }" />
              	<c:set var="likeImg" value="javascript:imgcheck('${restaurantReviewVO.getNum() }')"/>
              	 <li id="comment${i}" class="comment">
                  <div class="comment-body">
                  <h3>${restaurantReviewVO.nick }</h3>
                  <div class="meta">${restaurantReviewVO.reg_date }</div>
                  <p id="reviewtext${i }">
                   <textarea id="textarea${i }" disabled>${restaurantReviewVO.text}</textarea>
                  </p>
                  <c:if test="${restaurantReviewVO.img != null }">
                  	<img src="/eatoday/resource/RecipeReview/${restaurantReviewVO.img }" height="400px">
                  </c:if>
                  <c:if test="${sessionScope.loginID == restaurantReviewVO.id }">
           		
					<a href="javascript:reviewUpdate('${restaurantReviewVO.getNum() }','${i }')">
							수정
						</a>
						&nbsp;|&nbsp;
						<a href="javascript:reviewRemove('${restaurantReviewVO.getNum() }','${i }','${rvo.cnum }')">
							삭제
						</a>
						 <div class="text-right">
						<div class="form-group">
                   <div id="UpdateBtn${i}" class="text-right"></div>
                   </div>
                   </div>
				</c:if>
                   <div class="text-right">
                   <div id="niceCount${i}"></div>
                   <a id="likeImg${i }" onclick="javascript:niceClick('${restaurantReviewVO.num}','${i }')">
                   </a>
                    </div> 
                  </div>  
                </li>
                <script>
                    niceCheck('${restaurantReviewVO.num}','${i}');
                    niceCountCheck('${restaurantReviewVO.num}','${i}');
 				 	</script>
 				 	<div id="textUpdate${i}"></div>
              	</c:forEach>
              	 <div class="text-center">           	 
              	 <c:if test="${startPage >10 }">
 			 <a href="restaurantDetail.eat?page=${startPage-10 }&cate=${rvo.cate}&cnum=${rvo.cnum}">&nbsp;<< &nbsp;</a>
 				</c:if>
              	<c:forEach begin="${startPage }" end="${endPage }" step="1" var="i">
              	 <a href="restaurantDetail.eat?page=${i }&cate=${rvo.cate}&cnum=${rvo.cnum}">${i }</a>
              	 	<c:if test="${i!=endPage}">
              	 &nbsp;|&nbsp;
              	 </c:if>
              	 </c:forEach>
              	 <c:if test="${endPage < pageCount }">
 					 <a href="restaurantDetail.eat?page=${startPage+10 }&cate=${rvo.cate}&cnum=${rvo.cnum}"> &nbsp;>>&nbsp; </a>
 				</c:if>
                   </div>
              </ul>
    
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
              		 <form id="reviewWriteForm" action="javascript:reviewWrite()" method="post" enctype="multipart/form-data">
                	<input type="hidden" name="cnum" value="${rvo.getCnum() }">
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
                <li><a href="<c:url value="/homepage/restaurantList.eat"><c:param name="cate" value="한식"></c:param><c:param name="area" value="서울"></c:param></c:url>" id="cate(1)">한식</a></li>
                <li><a href=<c:url value= "/homepage/restaurantList.eat"><c:param name="cate" value="중식"></c:param><c:param name="area" value="서울"></c:param></c:url>" id="cate(2)">중식 </a></li>
                <li><a href="<c:url value="/homepage/restaurantList.eat"><c:param name="cate" value="일식"></c:param><c:param name="area" value="서울"></c:param></c:url>" id="cate(3)">일식 </a></li>
                <li><a href="<c:url value="/homepage/restaurantList.eat"><c:param name="cate" value="양식"></c:param><c:param name="area" value="서울"></c:param></c:url>" id="cate(4)">양식 </a></li>
                <li><a href="<c:url value="/homepage/restaurantList.eat"><c:param name="cate" value="분식"></c:param><c:param name="area" value="서울"></c:param></c:url>" id="cate(5)">분식 </a></li>
                <li><a href="<c:url value="/homepage/restaurantList.eat"><c:param name="cate" value="카페"></c:param><c:param name="area" value="서울"></c:param></c:url>" id="cate(6)">카페</a></li>
                <li><a href="<c:url value="/homepage/restaurantList.eat"><c:param name="cate" value="기타"></c:param><c:param name="area" value="서울"></c:param></c:url>" id="cate(7)">기타</a></li>
               
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