package eatoday.bean;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/naverlogin/")
public class naverlogin {
	
	@RequestMapping("naverlogin.do")
	public String kakaologin(HttpServletRequest request) {
		
		return "/naverlogin/naverlogin";
	}
	
}
