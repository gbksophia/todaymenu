package eatoday.bean;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/errorpage/")
public class errorpage {

	@Autowired
	private SqlSessionTemplate sql = null;
	
	@RequestMapping("errorpage404.eat")
	public String errorpage404() {
		
		return "/errorpage/errorpage404";
	}
	
	@RequestMapping("errorpage500.eat")
	public String errorpage500() {
		
		return "/errorpage/errorpage500";
	}
}
