package eatoday.bean;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import eatoday.vo.restaurantVO;
@Controller
@RequestMapping("/homepage/")
public class Restaurant {
	
	@Autowired
	private SqlSessionTemplate sql = null;
	
	//접속위치 중심 선호식당 표시
		@RequestMapping("favoriteRestaurant.eat")
		public String favoriteRestaurant(HttpServletRequest request, Model model) {
			String sRec=request.getParameter("search");
			model.addAttribute("sRec", sRec);
			return "/homepage/favoriteRestaurant";
		}
		
		@RequestMapping("restaurantList.eat")
		public String restaurantList(HttpServletRequest request, Model model) {
			try {
				request.setCharacterEncoding("UTF-8");
				int count = (Integer)sql.selectOne("restaurant.count");
				String cate = request.getParameter("cate");
				ArrayList rest = new ArrayList();
				List restList = null;
				System.out.println("1"+cate);
			
				if (cate.equals("기타")) {
					System.out.println("2"+cate);
					restList = sql.selectList("restaurant.restetc");
					model.addAttribute("restList", restList);
				} else {
					System.out.println("3"+cate);
					restList = sql.selectList("restaurant.select", cate);
				}
				model.addAttribute("cate", cate);
				model.addAttribute("restList", restList);
				model.addAttribute("count", count);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "/homepage/restaurantList";
		}
		
		@RequestMapping("restaurantDetail.eat")
		public String restaurantDetail(HttpServletRequest request, Model model) {
			String cnum = request.getParameter("cnum");
			//int recount = sql.selectOne("recipe.ReviewCount",cnum);
			
			// 해당 식당 정보
			restaurantVO rvo = sql.selectOne("restaurant.info", cnum);

			//레시피 리뷰 가져오기
			//List revo = sql.selectList("recipe.reviewSelect",cnum);
			
			//model.addAttribute("pro",pro);
			//model.addAttribute("ivo",ivo);
			model.addAttribute("rvo", rvo);
			//model.addAttribute("revo",revo);
			//model.addAttribute("recount",recount);
			//model.addAttribute("proCount",proCount);

			return "/homepage/restaurantDetail";
		}
}
