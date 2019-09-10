package eatoday.bean;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/SideMenu/")
public class SideMenu {
	@Autowired
	private SqlSessionTemplate sql = null;
	
	@RequestMapping("layerPopup.eat")
	public String layerPopup() {
		return "/SideMenu/layerPopup";
	}
	
	@RequestMapping("sideMenu.eat")
	public String sideMenu() {
		return "/SideMenu/sideMenu";
	}
}
