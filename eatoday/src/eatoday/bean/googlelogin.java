package eatoday.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/googlelogin/")
public class googlelogin {

	@RequestMapping("googlelogin.eat")
	public String googlelogin() {
		return "/googlelogin/googlelogin";
	}
	
	@RequestMapping("google.eat")
	public String google() {
		return "/googlelogin/google";
	}
	
}
