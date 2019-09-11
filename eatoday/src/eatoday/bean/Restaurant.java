package eatoday.bean;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import eatoday.vo.recipeReviewNiceVO;
import eatoday.vo.recipeReviewVO;
import eatoday.vo.recipeVO;
import eatoday.vo.restaurantReviewNiceVO;
import eatoday.vo.restaurantReviewVO;
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
			
			//���� ī��Ʈ
			int recount = (Integer)sql.selectOne("restaurant.ReviewCount",cnum);

			// �ش� ������� ����
			restaurantVO rvo = sql.selectOne("restaurant.info",cnum);
			
			//������� ���� ��������
			List revo = sql.selectList("restaurant.reviewSelect",cnum);
			
			
			model.addAttribute("rvo",rvo);
			model.addAttribute("revo",revo);
			model.addAttribute("recount",recount);
			model.addAttribute("recount",recount);
			return "/homepage/restaurantDetail";
		}
		
		//���� ī��Ʈ
		@RequestMapping("restaurantReviewCount.eat")
		public String restaurantReviewCount(String cnum,Model model) {
			int recount = (Integer)sql.selectOne("restaurant.ReviewCount", cnum);
			model.addAttribute("recount",recount);
			return "/homepage/reviewCount";
		}
		
		//���� ����
		@RequestMapping("restaurantRePro.eat")
		public String restaurantRePro(MultipartHttpServletRequest request,Model model) throws Exception{
			request.setCharacterEncoding("UTF-8");
			MultipartFile mf = request.getFile("img");
			String orgName = mf.getOriginalFilename();
			recipeReviewVO vo = new recipeReviewVO();
			if(orgName != "") {
			//�̹��� ���ε�
			String path = request.getRealPath("//resource//RecipeReview");
			String ext = orgName.substring(orgName.lastIndexOf('.'));
			sql.insert("restaurant.ImgcountInsert");
			int num = sql.selectOne("restaurant.ImgCount");
				
			String newName = "image"+num+ext;
			File copyFile = new File(path +"//"+ newName);
			mf.transferTo(copyFile);
			
			vo.setImg(newName);
			}	else {
				vo.setImg("");
			}
			
			// ��� db ����
			String cnum = request.getParameter("cnum");
			String id = request.getParameter("id");
			String nick = request.getParameter("nick");
			String text = request.getParameter("text");
			if(nick.equals("")) {
				nick = "�͸�";
			}
			vo.setCnum(cnum);
			vo.setId(id);
			vo.setNick(nick);
			vo.setText(text);
			sql.insert("restaurant.ReviewInsert",vo);
			model.addAttribute("cnum",cnum);
				
				return "/homepage/restaurantRePro";
			}
		
		//���� ����
		@RequestMapping("restaurantReviewUpdate.eat")
		public String restaurantReviewUpdate(restaurantReviewVO vo,Model model) {
			sql.update("restaurant.reviewUpdate",vo);
			String text = sql.selectOne("restaurant.reviewText", vo.getNum());
			model.addAttribute("text",text);
			return "/homepage/reviewUpdate";
		}
		
		//���� ����
		@RequestMapping("restaurantReviewRemove.eat")
		public String restaurantReviewRemove(int num) {
			sql.delete("restaurant.reviewDelete",num);
			return "/homepage/reviewRemove";
		}
		
		// ������ ù ����ø� ��� ��� Ŭ�� ���� üũ
		@RequestMapping("restaurantNice.eat")
		public String restaurantNice(recipeReviewVO vo,Model model) {
			restaurantReviewNiceVO nivo = new restaurantReviewNiceVO();
			String likeImg;
			System.out.println(vo.getNum());
			nivo.setRenum(vo.getNum());
			nivo.setId(vo.getId());
			int result = sql.selectOne("restaurant.reviewCheck",nivo);
			System.out.println(result);
			if(result == 0) {
				likeImg = "/eatoday/resource/images/like.png";
			} else {
				likeImg = "/eatoday/resource/images/like2.png";
			}
			model.addAttribute("likeImg",likeImg);
			return "/homepage/nice";
		}
		
		// ��� ���ƿ� Ŭ�� �̺�Ʈ
		@RequestMapping("restaurantNiceClick.eat")
		public String restaurantNiceClick(recipeReviewVO vo,Model model) {
			restaurantReviewNiceVO nivo = new restaurantReviewNiceVO();
			String likeImg;
			nivo.setRenum(vo.getNum());
			nivo.setId(vo.getId());
			int result = sql.selectOne("restaurant.reviewCheck",nivo);
			if(result == 0) {
				sql.insert("restaurant.reviewNiceInsert",nivo);
				likeImg = "/eatoday/resource/images/like2.png";
			} else {
				sql.delete("restaurant.reviewNiceDelete",nivo);
				likeImg = "/eatoday/resource/images/like.png";
			}
			model.addAttribute("likeImg",likeImg);
			return "/homepage/niceClick";
		}
		
		// ���ƿ� ���� ī��Ʈ
		@RequestMapping("restaurantNiceCountCheck.eat")
		public String NiceCountCheck(int renum,Model model) {
			int niceCountCheck = (Integer)sql.selectOne("restaurant.niceCount",renum);
			model.addAttribute("niceCountCheck",niceCountCheck);
			return "/homepage/niceCountCheck";
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


