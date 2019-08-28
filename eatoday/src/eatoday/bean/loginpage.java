package eatoday.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/loginpage/")

public class loginpage {
	
	@RequestMapping("login.eat")
	public String login() {
		return "/loginpage/login";
	}
}
