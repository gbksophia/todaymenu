<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	          <li class="nav-item"><a href="/eatoday/homepage/menu.eat" class="nav-link">restaurant</a></li>
	          <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="/eatoday/homepage/room.eat" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">recipe</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<a class="dropdown-item" href="/eatoday/homepage/shop.eat">한식</a>
                <a class="dropdown-item" href="/eatoday/homepage/product-single.eat">일식</a>
                <a class="dropdown-item" href="/eatoday/homepage/cart.eat">중식</a>
                <a class="dropdown-item" href="/eatoday/homepage/checkout.eat">양식</a>
              </div>
            </li>
	          <li class="nav-item"><a href="contact.eat" class="nav-link">Contact</a></li>
	          <li class="nav-item"><a href="/eatoday/loginpage/login.eat" class="nav-link">log in</a></li>
	          <li class="nav-item cart"><a href="cart.eat" class="nav-link"><span class="icon icon-shopping_cart"></span><span class="bag d-flex justify-content-center align-items-center"><small>1</small></span></a></li>
	        </ul>
	      </div>
		  </div>
	  </nav>
</html>