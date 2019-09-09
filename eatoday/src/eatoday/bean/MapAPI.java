package eatoday.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	
	// 검색어 지도에 표시 - index의 검색창에 입력한 결과
	@RequestMapping("map_kwd.eat")
	public String map_kwd(HttpServletRequest request, String search) {
		request.setAttribute("kwd", search);
		return "/map/map_kwd";
	}
	
	// 현위치 주변 카테고리별 지도에 표시 - restaurant 페이지
	@RequestMapping("map_gc.eat")
	public String map_gc() {
		return "/map/map_gc";
	}
	
	//접속위치 + DB에 등록된 식당위치 표시
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
	
	//접속위치+선호식당카테고리로 검색후 지도에 출력
	@RequestMapping("map_lf.eat")
	public String map_loc(String d1, String d2 , String d3, Model model, HttpServletRequest request) {
		return "/map/map_lf";
	}

	@RequestMapping("map_lf2.eat")
	public String map_loc2(String d1, String d2 , String d3, Model model, HttpServletRequest request) {
		String kwd ="";
		String cate = "";
		try {
			request.setCharacterEncoding("UTF-8");
			if (d1!=null) {
//				System.out.println("map_loc: "+d1);
//				System.out.println("map_loc: "+d2);
				System.out.println("map_loc: "+d3);

				String id = "testid"; //임시 아이디
				
				int gnum = sql.selectOne("restaurant.greatest", id);

				List cates = sql.selectList("restaurant.cate", gnum);
//				for (int i=0; i<cates.size(); i++) {
//					cate = (String)cates.get(i);
//					System.out.println(cate);
//					if (cate.equals("KOR")) {
//						cate="한식";
//					} else if (cate.equals("CHINA")) {
//						cate="중식";
//					} else if (cate.equals("JAPAN")) {
//						cate="일식";
//					} else if (cate.equals("EUROPEAN")) {
//						cate="양식";
//					} else if (cate.equals("BUNSIG")) {
//						cate="분식";
//					} else if (cate.equals("CAFE")) {
//						cate="카페";
//					} else if (cate.equals("ETC")) {
//						cate="식당";
//					}
//					System.out.println(cate);
//				}
				
				// 선호 식당종류가 중복일 경우 선호식당을 랜덤으로 검색				
				int rand = (int)(Math.random()*cates.size());
				cate = (String)cates.get(rand);
				if (cate.equals("KOR")) {
					cate="한식";
				} else if (cate.equals("CHINA")) {
					cate="중식";
				} else if (cate.equals("JAPAN")) {
					cate="일식";
				} else if (cate.equals("EUROPEAN")) {
					cate="양식";
				} else if (cate.equals("BUNSIG")) {
					cate="분식";
				} else if (cate.equals("CAFE")) {
					cate="카페";
				} else if (cate.equals("ETC")) {
					cate="식당";
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

}
