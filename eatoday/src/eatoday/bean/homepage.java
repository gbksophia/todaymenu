package eatoday.bean;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import eatoday.vo.dbManageVO;
@Controller
@RequestMapping("/homepage/")
public class homepage {
	
	@Autowired
	private SqlSessionTemplate sql = null;
	
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
	public String showdb(Model model, HttpServletRequest request) throws Exception {
		try {
			int count = (Integer)sql.selectOne("eatoday.count");
			ArrayList rcp = new ArrayList();
			List rcpList = sql.selectList("eatoday.select");
			
			System.out.println(count);
			//System.out.println(rcpList);

			model.addAttribute("recipeList", rcpList);
			model.addAttribute("count", count);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/homepage/recipeKor";
	}
	
	
	@RequestMapping("recipeKorView.eat")
	public String recipeKorView(Model model, HttpServletRequest request) throws Exception {
		try {
			int count = (Integer)sql.selectOne("eatoday.count");
			ArrayList rcp = new ArrayList();
			List rcpList = sql.selectList("eatoday.select");
			
			String s = request.getParameter("cate");
			System.out.println(count);
			//System.out.println(rcpList);

			model.addAttribute("recipeList", rcpList);
			model.addAttribute("count", count);
			model.addAttribute("s",s);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/homepage/recipeKorView";
	}
	
	
	@RequestMapping("recipeWst.eat")
	public String recipeWst() {
		return "/homepage/recipeWst";
	}

	// index.jsp에서 검색한 결과 표시 - map_kwd.jsp included
	@RequestMapping("searchResult.eat")
	public String searchResult(HttpServletRequest request, Model model) {
		String search = request.getParameter("search");
		
		String s = request.getParameter("cate");
		model.addAttribute("s",s);
		return "/homepage/searchResult";
	}
}



