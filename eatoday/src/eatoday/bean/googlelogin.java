package eatoday.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/googlelogin/")
public class googlelogin {

	@RequestMapping("googlelogin.eat")
	public String googlelogin(String id_token, String gname, String gemail) {
		System.out.println(gname);
		System.out.println(gemail);
		//System.out.println(id_token);
		return "/googlelogin/googlelogin";
	}
	
	@RequestMapping("google.eat")
	public String google() {
		return "/googlelogin/google";
	}
	
}
