package eatoday.bean;

import java.util.ArrayList;
import java.util.List;

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
		
		if (id != null) {
		try {
			request.setCharacterEncoding("UTF-8");
			
			
			int count = (Integer)sql.selectOne("recipe.count");
			ArrayList rcp = new ArrayList();
			
			
			int greatest = sql.selectOne("recipe.greatest",id);
			//recipe.greatest=mem 테이블에서 가장 선호하는 카테고리의 값
			System.out.println(greatest);
			
			String cate = sql.selectOne("recipe.cate", greatest);
			//recipe.cate=mem 테이블에서 가장 선호하는 카테고리의 이름
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
			else if(cate.equals("DRINK")) {
				cate = "15";
			}
			else if(cate.equals("SPA")) {
				cate = "16";
			}
			else if(cate.equals("SNACK")) {
				cate = "17";
			}
			else if(cate.equals("TOAST")) {
				cate = "18";
			}
			else if(cate.equals("BAKING")) {
				cate = "19";
			}
			else if(cate.equals("DESSERT")) {
				cate = "20";
			}
			else if(cate.equals("JUICE")) {
				cate = "21";
			}
			else if(cate.equals("COCKTAIL")) {
				cate = "22";
			}
			else if(cate.equals("HOLIDAY")) {
				cate = "23";
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
		else {
			return "/homepage/index";
		}
		
	}

}