package eatoday.bean;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/homepage/")
public class homepage {
	
	@RequestMapping("index.do")
	public String index() {
		return "/homepage/index";
	}
	
	@RequestMapping("about.do")
	public String about() {
		return "/homepage/about";
	}
	
	@RequestMapping("blog-single.do")
	public String blogSingle() {
		return "/homepage/blog-single";
	}
	
	@RequestMapping("blog.do")
	public String blog() {
		return "/homepage/blog";
	}
	
	@RequestMapping("cart.do")
	public String cart() {
		return "/homepage/cart";
	}
	
	@RequestMapping("checkout.do")
	public String checkout() {
		return "/homepage/checkout";
	}
	
	@RequestMapping("contact.do")
	public String contact() {
		return "/homepage/contact";
	}
	
	@RequestMapping("menu.do")
	public String menu() {
		return "/homepage/menu";
	}
	
	@RequestMapping("product-single.do")
	public String productSingle() {
		return "/homepage/product-single";
	}
	
	@RequestMapping("services.do")
	public String services() {
		return "/homepage/services";
	}
	
	@RequestMapping("shop.do")
	public String shop() {
		return "/homepage/shop";
	}
	
}
