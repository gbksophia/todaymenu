package eatoday.bean;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/map/")
public class MapAPI {
	
	// 검색어 지도에 표시
	@RequestMapping("map_kwd.eat")
	public String map_kwd(HttpServletRequest request, String search) {
		//index.jsp, searchResult.jsp 에서 입력한 값
		request.setAttribute("kwd", search);
		return "/map/map_kwd";
	}
	
	// 현위치 주변 카테고리별 지도에 표시
	@RequestMapping("map_gc.eat")
	public String map_gc() {
		return "/map/map_gc";
	}

}
