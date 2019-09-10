package eatoday.bean;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import eatoday.vo.restaurantVO;
@Controller
@RequestMapping("/homepage/")
public class Restaurant {
	
	@Autowired
	private SqlSessionTemplate sql = null;
	
	//������ġ �߽� ��ȣ�Ĵ� ǥ��
		@RequestMapping("favoriteRestaurant.eat")
		public String favoriteRestaurant(HttpServletRequest request, Model model) {
			String sRec=request.getParameter("search");
			model.addAttribute("sRec", sRec);
			return "/homepage/favoriteRestaurant";
		}
		
		@RequestMapping("restaurantList.eat")
		public String restaurantList(HttpServletRequest request, Model model) {
			try {
				request.setCharacterEncoding("UTF-8");
				String cate = request.getParameter("cate"); //ī�װ���
				String area = request.getParameter("area"); //������
				//int count = (Integer)sql.selectOne("restaurant.count", cate); //ī�װ��� �Ĵ� ����
				//List restList = sql.selectList("restaurant.select", cate); //ī�װ��� �Ĵ� ����Ʈ
				List areaList = sql.selectList("restaurant.restArea", cate); //ī�װ��� ��������Ʈ rvo
				int areaCnt = (Integer)sql.selectOne("restaurant.restAreaCnt", cate); //ī�װ�+���� ī��Ʈ int
				
				ArrayList ra = new ArrayList(); 
				ra.add(area);
				ra.add(cate);
				List raList = sql.selectList("restaurant.selectArea", ra); //ī�װ�+���� �˻���� rvo

				System.out.println(cate);
				//System.out.println(count);
				System.out.println(area);
				System.out.println(areaCnt);
				
				model.addAttribute("areaList", areaList);
				model.addAttribute("areaCnt", areaCnt);
				model.addAttribute("area", area);
				model.addAttribute("cate", cate);
				//model.addAttribute("restList", restList);
				//model.addAttribute("count", count);
				model.addAttribute("raList", raList);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "/homepage/restaurantList";
		}
		
		@RequestMapping("restaurantDetail.eat")
		public String restaurantDetail(HttpServletRequest request, Model model) {
			String cnum = request.getParameter("cnum");
					
			// �ش� �Ĵ� ����
			restaurantVO rvo = sql.selectOne("restaurant.info", cnum);

			model.addAttribute("rvo", rvo);

			return "/homepage/restaurantDetail";
		}
}




/*
		@RequestMapping("restaurantList.eat")
		public String restaurantList(HttpServletRequest request, Model model) {
			try {
				request.setCharacterEncoding("UTF-8");
				String cate = request.getParameter("cate");
				int count = (Integer)sql.selectOne("restaurant.count", cate);
				
				List restList = sql.selectList("restaurant.select", cate);
				
				if (cate.equals("��Ÿ")) {
					restList = sql.selectList("restaurant.restEtc");
					count = (Integer)sql.selectOne("restaurant.countEtc");
				}
				System.out.println(cate+count);

//				sql.selectList("restaurant.restArea", cate); //ī�װ��� ��������Ʈ rvo
//				sql.selectList("restaurant.selectArea", list); //ī�װ�+���� �˻���� rvo
//				sql.selectList("restaurant.restAreaCnt", cate); //ī�װ�+���� ī��Ʈ int
//				
//				sql.selectList("restaurant.restAreaEtc"); //��Ÿ ��������Ʈ rvo
//				sql.selectList("restaurant.selectAreaEtc", area); //��Ÿ �����˻���� rvo
//				sql.selectList("restaurant.restAreaCntEtc"); //��Ÿ ���� ī��Ʈ int
				
				model.addAttribute("cate", cate);
				model.addAttribute("restList", restList);
				model.addAttribute("count", count);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "/homepage/restaurantList";
		}
 */


