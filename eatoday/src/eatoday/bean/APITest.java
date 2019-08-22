package eatoday.bean;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/apitest/")
public class APITest {

	//http://localhost:8080/eatoday/apitest/mapapi2.do
	@RequestMapping("mapapi2.do")
	public String mapapi2(HttpServletRequest request) {
		String kwd = request.getParameter("kwd");
		
		request.setAttribute("kwd", kwd);
		return "/apitest/mapapi2";
	}
	
	@RequestMapping("googleapi.do")
	public String googletest(HttpServletRequest request) {

		return "/apitest/googletest";
	}
	
	
}

