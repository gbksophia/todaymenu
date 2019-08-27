package eatoday.bean;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/homepage/")
public class homepage {
	
	//http://localhost:8080/eatoday/homepage/index.eat
	@RequestMapping("index.eat")
	public String index(HttpServletRequest request) {
		String search = request.getParameter("search");
		return "/homepage/index";
	}
	
	@RequestMapping("about.eat")
	public String about() {
		return "/homepage/about";
	}
	
	@RequestMapping("blog-single.eat")
	public String blogSingle() {
		return "/homepage/blog-single";
	}
	
	@RequestMapping("blog.eat")
	public String blog() {
		return "/homepage/blog";
	}
	
	@RequestMapping("cart.eat")
	public String cart() {
		return "/homepage/cart";
	}
	
	@RequestMapping("checkout.eat")
	public String checkout() {
		return "/homepage/checkout";
	}
	
	@RequestMapping("contact.eat")
	public String contact() {
		return "/homepage/contact";
	}
	
	@RequestMapping("menu.eat")
	public String menu() {
		return "/homepage/menu";
	}
	
	@RequestMapping("product-single.eat")
	public String productSingle() {
		return "/homepage/product-single";
	}
	
	@RequestMapping("services.eat")
	public String services() {
		return "/homepage/services";
	}
	
	@RequestMapping("shop.eat")
	public String shop() {
		return "/homepage/shop";
	}
	
	@RequestMapping("login.eat")
	public String login() {
		return "/homepage/login";
	}
	
	// index.jsp에서 검색한 결과 표시 - map_kwd.jsp included
	@RequestMapping("searchResult.eat")
	public String searchResult(HttpServletRequest request) {
		String search = request.getParameter("search");
		return "/homepage/searchResult";
	}
}
