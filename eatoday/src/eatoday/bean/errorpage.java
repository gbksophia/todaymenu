package eatoday.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/errorpage/")
public class errorpage {
	
	@RequestMapping("errorpage404.eat")
	public String errorpage404() {
		return "/errorpage/errorpage404";
	}
	
	@RequestMapping("errorpage500.eat")
	public String errorpage500() {
		return "/errorpage/errorpage500";
	}
}
