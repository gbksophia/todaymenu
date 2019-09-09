<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="/eatoday/homepage/index.eat">Today's<small>MEAL</small></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="/eatoday/homepage/recipeListView.eat?cate=1" class="nav-link">recipe</a></li>
	          <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="/eatoday/homepage/restaurant.eat" id="dropdown04" aria-haspopup="true" aria-expanded="false">restaurant</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item" href="/eatoday/homepage/favoriteRestaurant.eat">선호식당</a>
                <!-- <a class="dropdown-item" href="/eatoday/homepage/recipeJpn.eat">일식</a>
                <a class="dropdown-item" href="/eatoday/homepage/recipeChn.eat">중식</a>
                <a class="dropdown-item" href="/eatoday/homepage/recipeWst.eat">양식</a> -->
              </div>
            </li>
	          <li class="nav-item"><a href="contact.eat" class="nav-link">Contact</a></li>
	          <c:if test="${sessionScope.loginID == null}">
	          	<li class="nav-item"><a href="/eatoday/loginpage/login.eat" class="nav-link">login</a></li>
	          </c:if>
	          <c:if test="${sessionScope.loginID != null}">
	          	<li class="nav-item"><a href="/eatoday/memberpage/information.eat" class="nav-link">information</a></li>
	          </c:if>
	          <li class="nav-item cart"><a href="cart.eat" class="nav-link"><span class="icon icon-shopping_cart"></span><span class="bag d-flex justify-content-center align-items-center"><small>1</small></span></a></li>
	        </ul>
	      </div>
		  </div>
	  </nav>
</html>