package eatoday.bean;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/homepage/")
public class homepage {
	
	@Autowired
	private SqlSessionTemplate sql = null;
	
	//http://localhost:8080/eatoday/homepage/index.eat
	@RequestMapping("index.eat")
	public String index(Model model, HttpServletRequest request,HttpSession session) {
		String id = (String)session.getAttribute("loginID");
		
		//레시피, 레스토랑 갯수
		int recCnt = sql.selectOne("recipe.count");
		int resCnt = sql.selectOne("restaurant.total");
		model.addAttribute("recCnt", recCnt);
		model.addAttribute("resCnt", resCnt);
		
		if (id != null) {
			try {
				request.setCharacterEncoding("UTF-8");
				int count = (Integer)sql.selectOne("recipe.count");			
				int greatest = sql.selectOne("recipe.greatest",id);
				//recipe.greatest=mem 테이블에서 가장 선호하는 카테고리의 값
				
				List rcp = sql.selectList("recipe.cate", greatest);
	
				//recipe.cate=mem 테이블에서 가장 선호하는 카테고리의 이름
				System.out.println(rcp);
	
				// 선호 레시피종류가 중복일 경우 선호레시피를 랜덤으로 검색							
				int rand = (int)(Math.random()*rcp.size());
				String like_cate = (String)rcp.get(rand);
				Map<String,String> like_parameter = new HashMap<String, String>();
				if(like_cate.equals("RICE")) {
					like_parameter.put("key1","1");
				} else if (like_cate.equals("SOUP") || like_cate.equals("JEONGOL")) { 
					like_parameter.put("key1","2");
					like_parameter.put("key2","3");
				} else if (like_cate.equals("SIDE")  || like_cate.equals("SHAKE")  || like_cate.equals("GUI")
						 || like_cate.equals("JJIM")  || like_cate.equals("CHILDREN")  || like_cate.equals("KIMCHI")) 
				{
					like_parameter.put("key1","4");
					like_parameter.put("key2","5");
					like_parameter.put("key3","6");
					like_parameter.put("key4","7");
					like_parameter.put("key5","9");
					like_parameter.put("key6","10");
					
				} else if (like_cate.equals("DOSI")) {
					like_parameter.put("key1","11");
					
				} else if (like_cate.equals("NOODLE") || like_cate.equals("SPA") ) {
					like_parameter.put("key1","13");
					like_parameter.put("key2","16");
				} else if (like_cate.equals("SALAD")) {
					like_parameter.put("key1","14");
					
				} else if (like_cate.equals("SNACK")  || like_cate.equals("FRY")  || like_cate.equals("TOAST")
						 || like_cate.equals("BAKING")  || like_cate.equals("DESSERT")) {
					like_parameter.put("key1","12");
					like_parameter.put("key2","15");
					like_parameter.put("key3","17");
					like_parameter.put("key4","18");
					like_parameter.put("key5","19");
					like_parameter.put("key6","20");
				} else if (like_cate.equals("JUICE") || like_cate.equals("COCKTAIL")) {
					like_parameter.put("key1","21");
					like_parameter.put("key2","22");
				} else if (like_cate.equals("GUEST") || like_cate.equals("HOLIDAY")) {
					like_parameter.put("key1","8");
					like_parameter.put("key2","23");;
				}
				rcp = sql.selectList("recipe.randomSelectMain",like_parameter);
				
				model.addAttribute("gnum", greatest);
				model.addAttribute("recipeList", rcp);
				model.addAttribute("count", count);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "/homepage/index";
		} else {
			//비회원일 때 랜덤으로 레시피 출력
			List rnd = sql.selectList("recipe.recipeRandomMain");
			model.addAttribute("rndReci", rnd);
			return "/homepage/index";
		}
	}
}