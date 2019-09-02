package eatoday.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/apitest/")
public class APITest {
	
	@Autowired
	private SqlSessionTemplate sql = null;

	@RequestMapping("mapapi3.eat")
	public String mapapi3(HttpServletRequest request) {
		String kwd = request.getParameter("kwd");
		
		request.setAttribute("kwd", kwd);
		return "/apitest/mapapi3";
	}
	
	//http://localhost:8080/eatoday/apitest/map.eat
	@RequestMapping("map.eat")
	public String map() {
		return "/apitest/map";
	}

	@RequestMapping("googleapi.eat")
	public String googletest(HttpServletRequest request) {
		return "/apitest/googletest";
	}
	
	//http://localhost:8080/eatoday/apitest/map_geo.eat
	@RequestMapping("map_geo.eat")
	public String map_geo() {
		return "/apitest/map_geo";

	}
	
	//http://localhost:8080/eatoday/apitest/map_cat.eat
	@RequestMapping("map_cat.eat")
	public String map_cat() {
		return "/apitest/map_cat";
	}
	
	//http://localhost:8080/eatoday/apitest/map_loc.eat
	//@RequestMapping(value="map_loc.eat", produces="text/json; charset=utf-8", method= RequestMethod.POST)
	@RequestMapping("map_loc.eat")
	public String map_loc(HttpServletRequest request) {
//		try {
//			request.setCharacterEncoding("UTF-8");
			//sql.selectOne("restaurant.search");
			String d1 = request.getParameter("1dt");
//			String d2 = request.getParameter("d2");
//			String d3 = request.getParameter("d3");
//			
			System.out.println(d1);
//			System.out.println(d2);
//			System.out.println(d3);
			
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
		return "/apitest/map_loc";
	}
	
	
	@RequestMapping("test.eat")
	public String test(HttpServletRequest request) {
		
		String a = request.getParameter("area1");
		System.out.println(a);
		
		
		return "/apitest/test";
	}
	
	@RequestMapping("date.eat")
	public String date() {
		return "/apitest/date";
	}
	@RequestMapping("time.eat")
	public String time() {
		return "/apitest/time";
	}
	
}

