<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.net.URLEncoder" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>${rvo.title }</title>
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
window.onload=function(){
	var id='${sessionScope.loginID}';
	var cnum='${rvo.cnum}';
	$.ajax({
		url: "/eatoday/memberpage/recipeJjim.eat",
		type: "post",
		data: {id : id, cnum : cnum },
		success: function(data) {
			var elem=document.createElement("img");
			elem.setAttribute("src", data);
			elem.setAttribute("height", "50px");
			elem.setAttribute("width", "50px");
			elem.setAttribute("id", "btn_jjim");
			document.getElementById("jjimImg").appendChild(elem);	
		}
	});
   
	// 카테고리 카운트 가져오기
	for(var i=1;i<24;i++){
		var id="cate("+i+")";
		$.ajax({
	    	url: "recipeCateCount.eat",
	        type: "post",
	        data: {cate : i},
	        async: false,
	        success: function(data) {
	        	var categori=document.createElement("span");
	        	var data="("+data+")";
	        	categori.innerHTML=data;
	        	document.getElementById(id).appendChild(categori);	
			}
		});
	}
}

// 찜 클릭 이벤트
function jjimClick(){
	var id='${sessionScope.loginID}';
	var cnum='${rvo.cnum}';
	if(${sessionScope.loginID == null}){
		alert("로그인 후 이용해 주십시오.");
	} else {
		$.ajax({
        	url: "/eatoday/memberpage/recipeJjimClick.eat",
			type: "post",
			data: {id : id, cnum : cnum },
			success: function(data) {
        		var elem=document.createElement("img");
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
	var id='${sessionScope.loginID}';
	var img="img"+i;
	if(${sessionScope.loginID == null}){
		alert("로그인후 이용해주십시오.");
	}else {
    	$.ajax({
        	url: "niceClick.eat",
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
	var img="likeImg"+i;
	var id="img"+i;
		$.ajax({
			url: "nice.eat",
			type: "post",
			async: false,
			data: {id : '${sessionScope.loginID}', num : num},
		  	success: function(data) {
  		  		var elem=document.createElement("img");
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
	id="niceCount"+i;
	$.ajax({
		url: "niceCountCheck.eat",
		type: "post",
		async: false,
		data: { renum : renum},
		success: function(data) {
	  		var elem=document.createElement("span");
	  		elem.innerHTML=data;
      	  	document.getElementById(id).appendChild(elem);	
		}
	});
}
  
// 댓글 좋아요 갯수 클릭
function niceCountClick(renum,i){
	id="niceCount"+i;
	$.ajax({
		url: "niceCountCheck.eat",
		type: "post",
		data: { renum : renum},
		success: function(data) {
			document.getElementById(id).innerHTML=data;
		}
	});
}  
	  
//검색 유효성 검사
function searchCheck() {
	var str=document.getElementById('search');
    var blank=/^[\s]/g;
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
  
// 업데이트 폼 생성
function reviewUpdate(num,i){
	var reviewtext="reviewtext"+i;
	var UpdateBtn="UpdateBtn"+i;
	var check=document.getElementById("textUpdate");
	var textId="#textarea"+i;
	var text=$(textId).val();
	if (check ==null){
		//업데이트 텍스트 에어리어 생성
	  	var elem=document.createElement("textarea");
		elem.setAttribute("class", "form-control");
		elem.setAttribute("rows", "10");
		elem.setAttribute("cols", "30");
		elem.setAttribute("id", "textUpdate");
		elem.setAttribute("name", "textUpdate");
		elem.innerHTML=text;
	  	document.getElementById(reviewtext).appendChild(elem);
	  
		//업데이트 버튼 생성
	  	var btn=document.createElement("input");
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
	var text=$("#textUpdate").val();
	$.ajax({
		url: "reviewUpdate.eat",
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
	var conf=confirm("리뷰를 삭제하시겠습니까?");
	if(conf){
		var id="#comment"+i;
	  	$.ajax({
			url: "reviewRemove.eat",
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
		url: "reviewCount.eat",
		type: "post",
		data: { cnum : cnum},
		success: function(data) {
			var data=data+" Comments";
			document.getElementById("Comments").innerHTML=data;
		}
	});
}

// 리뷰 쓰기
function reviewWrite(){
	var form=$("#reviewWriteForm")[0];
	var data=new FormData(form);
	$.ajax({
		url: "recipeRePro.eat",
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
niceCheck('${recipeReviewVO.num}','${i}');
niceCountCheck('${recipeReviewVO.num}','${i}');
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

.owl-carousel.home-slider .slider-item{
	background-size:contain;
}

</style>
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
	            	<c:set var="cate" value="${rvo.getCate()}"/>
	            	<c:choose>
						<c:when test="${cate == 1 }"><p>밥요리</p></c:when>
						<c:when test="${cate == 2 }"><p>국&탕</p></c:when>
						<c:when test="${cate == 3 }"><p>찌개&전골</p></c:when>
						<c:when test="${cate == 4 }"><p>밑반찬</p></c:when>
						<c:when test="${cate == 5 }"><p>볶음요리</p></c:when>
						<c:when test="${cate == 6 }"><p>구이(고기/생선)</p></c:when>
						<c:when test="${cate == 7 }"><p>찜&조림</p></c:when>
						<c:when test="${cate == 8 }"><p>손님상</p></c:when>
						<c:when test="${cate == 9 }"><p>아이반찬</p></c:when>
						<c:when test="${cate == 10 }"><p>김치 장아찌</p></c:when>
						<c:when test="${cate == 11 }"><p>도시락</p></c:when>
						<c:when test="${cate == 12 }"><p>튀김</p></c:when>
						<c:when test="${cate == 13 }"><p>면요리</p></c:when>
						<c:when test="${cate == 14 }"><p>샐러드</p></c:when>
						<c:when test="${cate == 15 }"><p>야식&술안주</p></c:when>
						<c:when test="${cate == 16 }"><p>스파게티</p></c:when>
						<c:when test="${cate == 17 }"><p>간식&분식</p></c:when>
						<c:when test="${cate == 18 }"><p>토스트&샌드위치</p></c:when>
						<c:when test="${cate == 19 }"><p>베이킹</p></c:when>
						<c:when test="${cate == 20 }"><p>디저트</p></c:when>
						<c:when test="${cate == 21 }"><p>주스&음료</p></c:when>
						<c:when test="${cate == 22 }"><p>술&칵테일</p></c:when>
						<c:when test="${cate == 23 }"><p>명절요리</p></c:when>
					</c:choose>				
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
			<p><c:set var="str" value="${rvo.getMate()}"/>
				<c:forEach var="spt" items="${fn:replace(str, 'next', '<br>')}" varStatus="status">
					<img src="images/image_2.jpg" alt="" class="img-fluid">${spt}
				</c:forEach>
			</p>
			
			<h2 class="mb-3 mt-5">조리법</h2>
			<div class="vcard bio">
				<c:forEach begin="1" end="${proCount }" step="1" var="i">
					<c:if test="${i==1 }">
						<c:set var="j" value="0" />
					</c:if>
				<c:set var="rcpro" value="${pro[i-1]}" />
					<c:choose>
						<c:when test="${i%2 == 1 }">
							<c:set var="img" value="${ivo[j]}" />
							<img src="/eatoday/resource/RecipePro/${img.getImg1()}" alt="" class="img-fluid" width="400px" height="200px">
						</c:when>
						
						<c:otherwise>
							<img src="/eatoday/resource/RecipePro/${img.getImg2()}" alt="" class="img-fluid" width="400px" height="200px">
							<c:set var="j" value="${j+1}" />
						</c:otherwise>
					</c:choose>
					<p>  ${rcpro} </p>
					<br><br>
				</c:forEach>
					<div style="text-align: center">
						<a id="jjimImg" onclick="javascript:jjimClick()"></a>
					</div>
			</div>

<!-- 댓글 -->
			<div class="pt-5 mt-5">
				<h3 id="Comments" class="mb-5">${recount} Comments</h3>
					<ul class="comment-list">
					<c:set var="i" value="0"/>
						<c:forEach var="recipeReviewVO" items="${revo}">
							<c:set var="i" value="${i+1 }" />
								<c:set var="likeImg" value="javascript:imgcheck('${recipeReviewVO.getNum()}')"/>
								<li id="comment${i}" class="comment">
									<div class="comment-body">
										<h3>${recipeReviewVO.nick}</h3>
											<div class="meta">${recipeReviewVO.reg_date}</div>
												<p id="reviewtext${i}"><textarea id="textarea${i}" disabled>${recipeReviewVO.text} </textarea></p>
											<c:if test="${recipeReviewVO.img != null}">
												<img src="/eatoday/resource/RecipeReview/${recipeReviewVO.img}" height="300px">
											</c:if>

											<c:if test="${sessionScope.loginID == recipeReviewVO.id}"><br/>
												<a href="javascript:reviewUpdate('${recipeReviewVO.getNum()}','${i}')">수정	</a> &nbsp;|&nbsp;
												<a href="javascript:reviewRemove('${recipeReviewVO.getNum()}','${i}','${rvo.cnum }')">삭제</a>
												<div class="text-right">
													<div class="form-group">
														<div id="UpdateBtn${i}" class="text-right"></div>
													</div>
												</div>
											</c:if>

										<div class="text-right">
											<div id="niceCount${i}"></div>
												<a id="likeImg${i}" onclick="javascript:niceClick('${recipeReviewVO.num}','${i}')"></a>
										</div> 
									</div>  
								</li>
						</c:forEach>
					</ul>
						<div class="text-center">
								<c:if test="${startPage >10}">
									<a href="recipeDetail.eat?page=${startPage-10}&cate=${rvo.cate}&cnum=${rvo.cnum}">&nbsp;<< &nbsp;</a>
								</c:if>
								<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
									<a href="recipeDetail.eat?page=${i}&cate=${rvo.cate}&cnum=${rvo.cnum}">${i}</a>
										<c:if test="${i!=endPage}">&nbsp;|&nbsp;</c:if>
								</c:forEach>
							<c:if test="${endPage < pageCount}">
								<a href="recipeDetail.eat?page=${startPage+10}&cate=${rvo.cate}&cnum=${rvo.cnum}"> &nbsp;>>&nbsp;</a>
							</c:if>
						</div>
       		<!-- END comment-list -->


			<!-- 댓글 달기 -->
				<div class="comment-form-wrap pt-5">
					<c:choose>
						<c:when test="${sessionScope.loginID == null}">
							<form>
								<div class="form-group">
									<input class="btn py-3 px-4 btn-primary" type="button" value="로그인 후 댓글 쓰기 가능" onclick="location='/eatoday/loginpage/login.eat'">
								</div>
							</form>
						</c:when>
						
						<c:otherwise>
							<form id="reviewWriteForm" action="javascript:reviewWrite()" method="post" enctype="multipart/form-data">
								<input type="hidden" name="cnum" value="${rvo.getCnum()}">
								<input type="hidden" name="cate" value="${rvo.getCate()}">
								<input type="hidden" name="id" value="${sessionScope.loginID}">
							
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
					<ul>
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
					</ul>
				</div>
			</div>
            
			<div class="sidebar-box ftco-animate fadeInUp ftco-animated">
				<div class="categories">
					<h3>관심 있는 레시피</h3>
					<c:choose>
						<c:when test="${sessionScope.loginID ==null }">
							<c:forEach var="recipeVO" items="${recipeList }" >
								<li> 
									<div class="text-left p-t-8 p-b-31">
										<a href="<c:url value="recipeDetail.eat"><c:param name="cnum" value="${recipeVO.cnum}"></c:param><c:param name="cate" value="${recipeVO.cate}"></c:param></c:url>">
										<img src="/eatoday/resource/RecipeImages/${recipeVO.main_name }" style="width: 100px; height: 100px"/>
											${recipeVO.title }</a>
									</div>
								</li>
							</c:forEach>
						</c:when>                		
						<c:otherwise>
							<c:forEach var="recipeVO" items="${recipeList }" >
								<li> 
									<div class="text-left p-t-8 p-b-31">
										<a href="<c:url value="recipeDetail.eat"><c:param name="cnum" value="${recipeVO.cnum}"></c:param><c:param name="cate" value="${recipeVO.cate}"></c:param></c:url>">
										<img src="/eatoday/resource/RecipeImages/${recipeVO.main_name }" style="width: 100px; height: 100px"/>
											${recipeVO.title }</a>
									</div>
								</li>
							</c:forEach>
						</c:otherwise>
					</c:choose>                
				</div>
			</div>
            
            <div class="sidebar-box ftco-animate fadeInUp ftco-animated">
              <div class="categories">
                <h3>관련 레시피</h3>
              		<c:forEach var="randomVO" items="${randomList }" >
	               		<li> 
	               			<div class="text-left p-t-8 p-b-31">
	               				<a href="<c:url value="recipeDetail.eat"><c:param name="cnum" value="${randomVO.cnum}"></c:param><c:param name="cate" value="${randomVO.cate}"></c:param></c:url>">
	               				<img src="/eatoday/resource/RecipeImages/${randomVO.main_name }" style="width: 100px; height: 100px"/>
	               					${randomVO.title }</a>
	               			</div>
	                	</li>
              		</c:forEach>
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