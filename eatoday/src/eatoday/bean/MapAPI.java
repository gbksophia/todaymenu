package eatoday.bean;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import eatoday.vo.restaurantVO;

@Controller
@RequestMapping("/map/")
public class MapAPI {
	
	// �˻��� ������ ǥ�� - index�� �˻�â�� �Է��� ���
	@RequestMapping("map_kwd.eat")
	public String map_kwd(HttpServletRequest request, String search) {
		request.setAttribute("kwd", search);
		return "/map/map_kwd";
	}
	
	// ����ġ �ֺ� ī�װ��� ������ ǥ�� - restaurant ������
	@RequestMapping("map_gc.eat")
	public String map_gc() {
		return "/map/map_gc";
	}
	
	//������ġ + DB�� ��ϵ� �Ĵ���ġ ǥ��
	@RequestMapping("map_gn")
	public String map_gn(HttpServletRequest request, Model model) {
		try {
			request.setCharacterEncoding("UTF-8");
			restaurantVO restVO = new restaurantVO();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/map/map_gn";
	}

}
