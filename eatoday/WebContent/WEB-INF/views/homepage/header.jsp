<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	<div class="container">
		<a class="navbar-brand" href="/eatoday/homepage/index.eat">Today's<small>MENU</small></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu
		</button>
		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a href="/eatoday/homepage/recipeListView.eat?cate=1" class="nav-link">recipes</a></li>
				<li class="nav-item"><a href="/eatoday/homepage/restaurantList.eat?cate=한식&area=서울" class="nav-link">Restaurants</a></li>
				<!--  <li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="/eatoday/homepage/restaurantList.eat?cate=한식&area=서울" id="dropdown04" aria-haspopup="true" aria-expanded="false">restaurants</a>
				<div class="dropdown-menu" aria-labelledby="dropdown04">
				<a class="dropdown-item" href="/eatoday/homepage/favoriteRestaurant.eat">Recommend Restaurants</a>
				<a class="dropdown-item" href="/eatoday/homepage/restaurantList.eat?cate=한식&area=서울">Restaurants</a>
				<a class="dropdown-item" href="/eatoday/homepage/recipeChn.eat">중식</a>
				<a class="dropdown-item" href="/eatoday/homepage/recipeWst.eat">양식</a>
				</div>
				</li> -->
				<c:if test="${sessionScope.loginID == null}">
					<li class="nav-item"><a href="/eatoday/loginpage/login.eat" class="nav-link">login</a></li>
				</c:if>
				<c:if test="${sessionScope.loginID != null}">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="member" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">member</a>
						<div class="dropdown-menu" aria-labelledby="member">
							<a class="dropdown-item" href="/eatoday/memberpage/information.eat">information</a>
							<a class="dropdown-item" href="/eatoday/memberpage/jjimList.eat?">recipeNice</a>
							<a class="dropdown-item" href="/eatoday/memberpage/recipeReview.eat">recipeReview</a>
							<a class="dropdown-item" href="/eatoday/memberpage/restaurantReview.eat">restaurantReview</a>
							<a class="dropdown-item" href="/eatoday/memberpage/logout.eat">logout</a>
						</div>
					</li>
				</c:if>
				<li class="nav-item"><a href="/eatoday/homepage/supportList.eat?" class="nav-link">support</a></li>
			</ul>
		</div>
	</div>
</nav>
	  
</html>