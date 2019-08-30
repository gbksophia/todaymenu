package eatoday.bean;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import eatoday.vo.restaurantVO;

@Controller
@RequestMapping("/map/")
public class MapAPI {
	
	// 검색어 지도에 표시 - index의 검색창에 입력한 결과
	@RequestMapping("map_kwd.eat")
	public String map_kwd(HttpServletRequest request, String search) {
		request.setAttribute("kwd", search);
		return "/map/map_kwd";
	}
	
	// 현위치 주변 카테고리별 지도에 표시 - restaurant 페이지
	@RequestMapping("map_gc.eat")
	public String map_gc() {
		return "/map/map_gc";
	}
	
	//접속위치 + DB에 등록된 식당위치 표시
	@RequestMapping("map_gn")
	public String map_gn(HttpServletRequest request, Model model) {
		try {
			request.setCharacterEncoding("UTF-8");
			restaurantVO restVO = new restaurantVO();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/map/map_gn";
	}

}
