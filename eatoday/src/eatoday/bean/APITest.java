package eatoday.bean;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/apitest/")
public class APITest {

	//http://localhost:8080/eatoday/apitest/map_kwd.do
	@RequestMapping("map_kwd.do")
	public String map_kwd(HttpServletRequest request) {
		String kwd = request.getParameter("kwd");
		request.setAttribute("kwd", kwd);
		return "/apitest/map_kwd";
	}
	
	@RequestMapping("mapapi3.do")
	public String mapapi3(HttpServletRequest request) {
		String kwd = request.getParameter("kwd");
		
		request.setAttribute("kwd", kwd);
		return "/apitest/mapapi3";
	}
	
	@RequestMapping("googleapi.do")
	public String googletest(HttpServletRequest request) {
		return "/apitest/googletest";
	}
	
	//http://localhost:8080/eatoday/apitest/map_geo.do
	@RequestMapping("map_geo.do")
	public String map_geo() {
		return "/apitest/map_geo";
	}
	
	//http://localhost:8080/eatoday/apitest/map_cat.do
	@RequestMapping("map_cat.do")
	public String map_cat() {
		return "/apitest/map_cat";
	}
	
	//http://localhost:8080/eatoday/apitest/map_gc.do
	@RequestMapping("map_gc.do")
	public String map_gc() {
		return "/apitest/map_gc";
	}
	
}

