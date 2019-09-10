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
				String cate = request.getParameter("cate");
				System.out.println("cate: "+cate);
				
				int count = (Integer)sql.selectOne("restaurant.count", cate);
				List restList = sql.selectList("restaurant.select", cate);
				
				if (cate.equals("기타")) {
					restList = sql.selectList("restaurant.restEtc");
					count = (Integer)sql.selectOne("restaurant.countEtc");
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
					
			// 해당 식당 정보
			restaurantVO rvo = sql.selectOne("restaurant.info", cnum);

			model.addAttribute("rvo", rvo);

			return "/homepage/restaurantDetail";
		}
}
