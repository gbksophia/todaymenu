package eatoday.bean;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/apitest/")
public class APITest {
	
	@Autowired
	private SqlSessionTemplate sql = null;

	@RequestMapping("mapapi3.eat")
	public String mapapi3(HttpServletRequest request) {
		String kwd = request.getParameter("kwd");
		
		request.setAttribute("kwd", kwd);
		return "/apitest/mapapi3";
	}
	
	//http://localhost:8080/eatoday/apitest/map.eat
	@RequestMapping("map.eat")
	public String map() {
		return "/apitest/map";
	}

	@RequestMapping("googleapi.eat")
	public String googletest(HttpServletRequest request) {
		return "/apitest/googletest";
	}
	
	//http://localhost:8080/eatoday/apitest/map_geo.eat
	@RequestMapping("map_geo.eat")
	public String map_geo() {
		return "/apitest/map_geo";

	}
	
	//http://localhost:8080/eatoday/apitest/map_cat.eat
	@RequestMapping("map_cat.eat")
	public String map_cat() {
		return "/apitest/map_cat";
	}
	
	//http://localhost:8080/eatoday/apitest/map_loc.eat
	@RequestMapping("map_lf.eat")
	public String map_lf() {
		return "/apitest/map_lf";
	}
	@RequestMapping("map_loc2.eat")
	public String map_loc2(String d1, String d2 , String d3, Model model, HttpServletRequest request) {
		String kwd ="";
		String cate = "";
		try {
			request.setCharacterEncoding("UTF-8");
			if (d1!=null) {
//				System.out.println("map_loc: "+d1);
//				System.out.println("map_loc: "+d2);
				System.out.println("map_loc: "+d3);

				String id = "testid"; //�ӽ� ���̵�
				
				int gnum = sql.selectOne("restaurant.greatest", id);
				//String cate = sql.selectOne("restaurant.cate", gnum); //�̰� ����Ʈ�� �迭�� �����ؾߵ�
				List cates = sql.selectList("restaurant.cate", gnum);
//				for (int i=0; i<cates.size(); i++) {
//					cate = (String)cates.get(i);
//					System.out.println(cate);
//					if (cate.equals("KOR")) {
//						cate="�ѽ�";
//					} else if (cate.equals("CHINA")) {
//						cate="�߽�";
//					} else if (cate.equals("JAPAN")) {
//						cate="�Ͻ�";
//					} else if (cate.equals("EUROPEAN")) {
//						cate="���";
//					} else if (cate.equals("BUNSIG")) {
//						cate="�н�";
//					} else if (cate.equals("CAFE")) {
//						cate="ī��";
//					} else if (cate.equals("ETC")) {
//						cate="�Ĵ�";
//					}
//					System.out.println(cate);
//				}
				
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
		return "/apitest/map_lf_t";
	}
		
	@RequestMapping("test.eat")
	public String test(Model model, HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
			String kwd = "���¿� ����";
			model.addAttribute("kwd", kwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/apitest/test";
	}
	
	@RequestMapping("map_kwd.eat")
	public String map_kwd(HttpServletRequest request) {
		
		return "/apitest/map_kwd";
	}
	
}

