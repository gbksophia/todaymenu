package eatoday.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import eatoday.vo.restaurantVO;

@Controller
@RequestMapping("/map/")
public class MapAPI {
	
	@Autowired
	private SqlSessionTemplate sql = null;
	
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
	
	//������ġ+��ȣ�Ĵ�ī�װ��� �˻��� ������ ���
	@RequestMapping("map_lf.eat")
	public String map_loc(String d1, String d2 , String d3, Model model, HttpServletRequest request) {
		return "/map/map_lf";
	}

	@RequestMapping("map_lf2.eat")
	public String map_loc2(String d1, String d2 , String d3, Model model, HttpServletRequest request, HttpSession session) {
		String kwd ="";
		String cate = "";
		try {
			request.setCharacterEncoding("UTF-8");
			if (d1!=null) {
//				System.out.println("map_loc: "+d1); //����Ư����
//				System.out.println("map_loc: "+d2); //���Ǳ�
				System.out.println("map_loc: "+d3); //��õ��

				String id = (String)session.getAttribute("loginID");
				
				int gnum = sql.selectOne("restaurant.greatest", id);

				List cates = sql.selectList("restaurant.cate", gnum);
				
				// ��ȣ �Ĵ������� �ߺ��� ��� ��ȣ�Ĵ��� �������� �˻�				
				int rand = (int)(Math.random()*cates.size());
				cate = (String)cates.get(rand);
				if (cate.equals("KOR")) {
					cate="�ѽ�";
				} else if (cate.equals("CHINA")) {
					cate="�߽�";
				} else if (cate.equals("JAPAN")) {
					cate="�Ͻ�";
				} else if (cate.equals("EUROPEAN")) {
					cate="���";
				} else if (cate.equals("BUNSIG")) {
					cate="�н�";
				} else if (cate.equals("CAFE")) {
					cate="ī��";
				} else if (cate.equals("ETC")) {
					cate="�Ĵ�";
				}
					
				kwd = d3+cate;
				System.out.println(kwd);
				model.addAttribute("kwd", kwd);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/map/map_lf_t";
	}
	
	// �Ĵ� ��ġ ����
	@RequestMapping("map_kwd_rest.eat")
	public String map_kwd_rest(HttpServletRequest request, Model model) {
		//area1+area2+store //select area1, area2, addr, store from restaurant where cnum=2396;
		//addr+store //select addr, store from restaurant where cnum=2443;
		
		//model.addAttribute("addr", addr);
		return "/map/map_kwd_rest";
	}

}
