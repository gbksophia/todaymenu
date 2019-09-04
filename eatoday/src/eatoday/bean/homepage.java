package eatoday.bean;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
//import eatoday.vo.dbManageVO;
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



	@RequestMapping("recipeJpn.eat")
	public String recipeJpn() {
		return "/homepage/recipeJpn";
	}
	
	@RequestMapping("recipeKor.eat")
	public String showdb(Model model, HttpServletRequest request) throws Exception {
	      
			int pageSize = 10;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null) {
				pageNum = "1";
			}
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage-1)*pageSize+1;
			int endRow = currentPage*pageSize;
			int count1 = 0;
			int number = 0;
		try {
			count1 = (Integer)sql.selectOne("recipe.count1");
			if(count1>0) {
				ArrayList recipe = new ArrayList();
				recipe.add(startRow);
				recipe.add(endRow);
				List recipeList = sql.selectList("recipe.select", recipe);
				model.addAttribute("recipeList", recipeList);
			}
			
			number = count1-(currentPage-1)*pageSize;
			int pageCount = count1/pageSize+(count1%pageSize == 0?0:1);
			int startPage = (int)(currentPage/10)*10+1;
			int pageBlock = 10;
			int endPage = startPage+pageBlock-1;
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			
			
			int count = (Integer)sql.selectOne("recipe.count");
			
			ArrayList rcp = new ArrayList();
			List rcpList = sql.selectList("recipe.select");
			
			//System.out.println(rcpList);
	         model.addAttribute("count1", count1);
	         model.addAttribute("startPage", startPage);
	         model.addAttribute("endPage", endPage);
	         model.addAttribute("PageCount", pageCount);
	         model.addAttribute("number", number);
	         model.addAttribute("currentPage", currentPage);
	         model.addAttribute("sdf", sdf);
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
			int count = (Integer)sql.selectOne("recipe.count");
			ArrayList rcp = new ArrayList();
			List rcpList = sql.selectList("recipe.select");
			
			String s = request.getParameter("cate");
			String a = request.getParameter("abc");
			//System.out.println(rcpList);

			model.addAttribute("recipeList", rcpList);
			model.addAttribute("count", count);
			model.addAttribute("cate",s);
			model.addAttribute("abc", a);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/homepage/recipeKorView";
	}
	
	@RequestMapping("recipeDetail.eat")
	public String recipeDetail(Model model, HttpServletRequest request) throws Exception {
		int count = (Integer)sql.selectOne("recipe.count");
		int count1 = (Integer)sql.selectOne("recipe.count1");
		ArrayList rcp = new ArrayList();
		List rcpList = sql.selectList("recipe.select");
		List rcpListPro = sql.selectList("recipe.selectPro");
		
		String s = request.getParameter("cate");
		String a = request.getParameter("abc");
		//System.out.println(rcpList);

		model.addAttribute("recipeList", rcpList);
		model.addAttribute("count", count);
		model.addAttribute("cate",s);
		model.addAttribute("abc", a);
		model.addAttribute("count1", count1);
		model.addAttribute("recipeListPro", rcpListPro);
		return "/homepage/recipeDetail";
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



