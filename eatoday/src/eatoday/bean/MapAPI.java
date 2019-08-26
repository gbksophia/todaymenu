package eatoday.bean;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/map/")
public class MapAPI {
	
	@RequestMapping("map_kwd.eat")
	public String map_kwd(HttpServletRequest request) {
		String kwd = request.getParameter("kwd");
		request.setAttribute("kwd", kwd);
		return "/map/map_kwd";
	}
	
	@RequestMapping("map_gc.eat")
	public String map_gc() {
		return "/map/map_gc";
	}

}
