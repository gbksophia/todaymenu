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

import eatoday.vo.recipeImgVO;
import eatoday.vo.recipeVO;
//import eatoday.vo.dbManageVO;
@Controller
@RequestMapping("/homepage/")
public class homepage {
	
	@Autowired
	private SqlSessionTemplate sql = null;
	
	//http://localhost:8080/eatoday/homepage/index.eat
	@RequestMapping("index.eat")
	public String index(Model model, HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
			String id = "guswndnjs";
			
			int count = (Integer)sql.selectOne("recipe.count");
			ArrayList rcp = new ArrayList();
			
			
			int greatest = sql.selectOne("recipe.greatest",id);
			System.out.println(greatest);
			
			String cate = sql.selectOne("recipe.cate", greatest);
			System.out.println(cate);

			if(cate.equals("RICE")) {
				cate = "1";
			}
			else if(cate.equals("SOUP")) {
				cate = "2";
			}
			else if(cate.equals("JEONGOL")) {
				cate = "3";
			}
			else if(cate.equals("SIDE")) {
				cate = "4";
			}
			else if(cate.equals("SHAKE")) {
				cate = "5";
			}
			else if(cate.equals("GUI")) {
				cate = "6";
			}
			else if(cate.equals("JJIM")) {
				cate = "7";
			}
			else if(cate.equals("GUEST")) {
				cate = "8";
			}
			else if(cate.equals("CHILDREN")) {
				cate = "9";
			}
			else if(cate.equals("KIMCHI")) {
				cate = "10";
			}
			else if(cate.equals("DOSI")) {
				cate = "11";
			}
			else if(cate.equals("FRY")) {
				cate = "12";
			}
			else if(cate.equals("NOODLE")) {
				cate = "13";
			}
			else if(cate.equals("SALAD")) {
				cate = "14";
			}
			else if(cate.equals("KIMBAB")) {
				cate = "15";
			}
			else if(cate.equals("DRINK")) {
				cate = "16";
			}
			else if(cate.equals("SPA")) {
				cate = "17";
			}
			else if(cate.equals("SNACK")) {
				cate = "18";
			}
			else if(cate.equals("TOAST")) {
				cate = "19";
			}
			else if(cate.equals("BAKING")) {
				cate = "20";
			}
			else if(cate.equals("DESSERT")) {
				cate = "21";
			}
			else if(cate.equals("JUICE")) {
				cate = "22";
			}
			else if(cate.equals("COCKTAIL")) {
				cate = "23";
			}
			else if(cate.equals("HOLIDAY")) {
				cate = "24";
			}
			
			List rcpList = sql.selectList("recipe.select",cate);
			
			model.addAttribute("gnum", greatest);
			model.addAttribute("cate",cate);
			model.addAttribute("recipeList", rcpList);
			model.addAttribute("count", count);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
	
	/*@RequestMapping("recipeKor.eat")
	public String showdb(Model model, HttpServletRequest request) throws Exception {
	      	
		
			// 카테고리 유무 확인
			String cate = request.getParameter("cate");
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
		
			if(cate != null) {
			count1 = (Integer)sql.selectOne("recipe.count1");
			} else {
				
			}
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
			model.addAttribute("cate", cate);
		
		return "/homepage/recipeKor";
	} */	
	
	@RequestMapping("recipeKorView.eat")
	public String recipeKorView(Model model, HttpServletRequest request) throws Exception {
		String cate = request.getParameter("cate");
		int count = (Integer)sql.selectOne("recipe.count");
		ArrayList rcp = new ArrayList();
		List rcpList = sql.selectList("recipe.select",cate);
			
		//System.out.println(rcpList);

		model.addAttribute("recipeList", rcpList);
		model.addAttribute("count", count);
		model.addAttribute("cate",cate);
		
		 
		return "/homepage/recipeKorView";
	}
	
	@RequestMapping("recipeDetail.eat")
	public String recipeDetail(Model model, HttpServletRequest request) throws Exception {
		String cnum = request.getParameter("cnum");
		
		
		// 해당 레시피 정보
		recipeVO vo = sql.selectOne("recipe.info",cnum);
		String [] pro = vo.getPro().split("next"); // 조리법 분리
		int proCount = pro.length; // for문 돌릴값
		// 레시피 해당 이미지 set
		List ivo = sql.selectList("recipe.imgselect", cnum);
		
		
		
		model.addAttribute("pro",pro);
		model.addAttribute("proCount",proCount);
		model.addAttribute("ivo",ivo);
		model.addAttribute("rvo",vo);
		
		return "/homepage/recipeDetail";
	}
	
	@RequestMapping("recipeWst.eat")
	public String recipeWst() {
		return "/homepage/recipeWst";
	}

	// index.jsp에서 검색한 결과 표시 - map_kwd.jsp included
	@RequestMapping("searchResult.eat")
	public String searchResult(HttpServletRequest request, Model model) {
//		String search = request.getParameter("search");
//		
//		String s = request.getParameter("cate");
//		model.addAttribute("s",s);
		return "/homepage/searchResult";
	}
	
	
}



