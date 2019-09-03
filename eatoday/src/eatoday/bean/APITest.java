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
	@RequestMapping("map_loc.eat")
	public String map_loc(String d1, String d2 , String d3, Model model) {
		if (d1!=null) {
			System.out.println("==d1=="+d1);
			System.out.println("==d2=="+d2);
			System.out.println("==d3=="+d3);
			
//			ArrayList addr = new ArrayList();
//			addr.add(d1);
//			addr.add(d2);
//			List resList = sql.selectList("restaurant.search", addr);
//			System.out.println(resList);
//			model.addAttribute("res", resList);
			
			restaurantVO restVO = new restaurantVO();
			restVO.setAddr(d1);
			restVO.setArea2(d2);
			List resList = sql.selectList("restaurant.search", restVO);
			System.out.println(resList);
			model.addAttribute("res", resList);
		}

		return "/apitest/map_loc";
	}
	
	
	@RequestMapping("test.eat")
	public String test(HttpServletRequest request) {
		
		
		
		
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

