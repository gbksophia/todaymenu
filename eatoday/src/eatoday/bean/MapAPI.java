package eatoday.bean;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/map/")
public class MapAPI {
	
	// �˻��� ������ ǥ��
	@RequestMapping("map_kwd.eat")
	public String map_kwd(HttpServletRequest request, String search) {
		//index.jsp, searchResult.jsp ���� �Է��� ��
		request.setAttribute("kwd", search);
		return "/map/map_kwd";
	}
	
	// ����ġ �ֺ� ī�װ��� ������ ǥ��
	@RequestMapping("map_gc.eat")
	public String map_gc() {
		return "/map/map_gc";
	}

}
