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
	
	@RequestMapping("recipe.eat")
	public String recipe() {
		return "/homepage/recipe";
	}
	
	@RequestMapping("blog-single.eat")
	public String blogSingle() {
		return "/homepage/blog-single";
	}
	
	@RequestMapping("blog.eat")
	public String blog() {
		return "/homepage/blog";
	}
	
	@RequestMapping("contact.eat")
	public String contact() {
		return "/homepage/contact";
	}
	
	@RequestMapping("restaurant.eat")
	public String restaurant() {
		return "/homepage/restaurant";
	}
	
	@RequestMapping("services.eat")
	public String services() {
		return "/homepage/services";
	}
	
	@RequestMapping("recipeChn.eat")
	public String recipeChn() {
		return "/homepage/recipeChn";
	}

	@RequestMapping("test.eat")
	public String test() {
		
		return "/homepage/test";
	}

	@RequestMapping("recipeJpn.eat")
	public String recipeJpn() {
		return "/homepage/recipeJpn";
	}
	
	@RequestMapping("recipeKor.eat")
	public String recipeKor() {
		return "/homepage/recipeKor";
	}
	
	@RequestMapping("recipeWst.eat")
	public String recipeWst() {
		return "/homepage/recipeWst";
	}

	// index.jsp에서 검색한 결과 표시 - map_kwd.jsp included
	@RequestMapping("searchResult.eat")
	public String searchResult(HttpServletRequest request) {
		String search = request.getParameter("search");
		return "/homepage/searchResult";
	}
}



