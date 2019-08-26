package eatoday.bean;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/kakaologin/")
public class kakaologin {
	
	@RequestMapping("kakaologin.do")
	public String kakaologin(HttpServletRequest request) {
		String kwd = request.getParameter("kwd");
		
		request.setAttribute("kwd", kwd);
		return "/kakaologin/kakaologin";
	}
	
}
