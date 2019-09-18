package eatoday.bean;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		public String restaurantList(HttpServletRequest request, Model model) throws Exception {
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

				model.addAttribute("areaList", areaList);
				model.addAttribute("areaCnt", areaCnt);
				model.addAttribute("area", area);
				model.addAttribute("cate", cate);
				//model.addAttribute("restList", restList);
				//model.addAttribute("count", count);
				model.addAttribute("raList", raList);
			return "/homepage/restaurantList";
		}
		
		@RequestMapping("restaurantDetail.eat")
		public String restaurantDetail(HttpServletRequest request, Model model,HttpSession session) {
			String cnum = request.getParameter("cnum");
			String cate = request.getParameter("cate");
			
			if(session.getAttribute("loginID")!=null  && cate!=null) {
				String id = (String)session.getAttribute("loginID");
				
			if(cate.equals("�ѽ�")) {
				sql.update("member.korCountUp",id); // �ѽ� ī��Ʈ ����
			} else if (cate.equals("�߽�")) {
				sql.update("member.chinaCountUp",id); // �߽� ī��Ʈ ����
			} else if (cate.equals("�Ͻ�")) {
				sql.update("member.japanCountUp",id); // �Ͻ� ī��Ʈ ����
			} else if (cate.equals("���")) {
				sql.update("member.europeanCountUp",id); // ��� ī��Ʈ ����
			} else if (cate.equals("�н�")) {
				sql.update("member.bunsigCountUp",id); // �н� ī��Ʈ ����
			} else if (cate.equals("ī��")) {
				sql.update("member.cafeCountUp",id); // ī�� ī��Ʈ ����
			} else if (cate.equals("��Ÿ")) {
				sql.update("member.etcCountUp",id); // ��Ÿ ī��Ʈ ����
			}
			}
			//���� ī��Ʈ
			int recount = (Integer)sql.selectOne("restaurantReview.count",cnum);
			
			// �ش� ������� ����
			restaurantVO rvo = sql.selectOne("restaurant.info",cnum);
			
			//������� ���� ��������
			int row = 10;
			String page = request.getParameter("page");
			
			if (page == null) {
				page ="1";
			}
			int currentPage = Integer.parseInt(page);
			int startRow = (currentPage-1) * row +1;
			int endRow = currentPage * row;
			Map pageList = new HashMap();
			
			pageList.put("cnum", cnum);
			pageList.put("startRow",startRow);
			pageList.put("endRow",endRow);
			
			List revo = sql.selectList("restaurantReview.select",pageList);
			
			// ������ ���
			int pageCount = recount / row + (recount % row == 0? 0:1);
			int startPage = (int)(currentPage/10)*10+1;
			int pageBlock=10;
			int endPage = startPage + pageBlock-1;
			if(endPage > pageCount) endPage = pageCount;
			
			
			model.addAttribute("rvo",rvo);
			model.addAttribute("revo",revo);
			model.addAttribute("recount",recount);
			model.addAttribute("startPage",startPage);
			model.addAttribute("endPage",endPage);
			model.addAttribute("pageCount",pageCount);
			return "/homepage/restaurantDetail";
		}
		
		//���� ī��Ʈ
		@RequestMapping("restaurantReviewCount.eat")
		public String restaurantReviewCount(String cnum,Model model) {
			int recount = (Integer)sql.selectOne("restaurantReview.count", cnum);
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
			sql.insert("restaurantReview.imgCountInsert");
			int num = sql.selectOne("restaurantReview.imgCount");
				
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
			sql.insert("restaurantReview.insert",vo);
				return "/homepage/restaurantRePro";
			}
		
		//���� ����
		@RequestMapping("restaurantReviewUpdate.eat")
		public String restaurantReviewUpdate(restaurantReviewVO vo,Model model) {
			sql.update("restaurantReview.update",vo);
			String text = sql.selectOne("restaurantReview.text", vo.getNum());
			model.addAttribute("text",text);
			return "/homepage/reviewUpdate";
		}
		
		//���� ����
		@RequestMapping("restaurantReviewRemove.eat")
		public String restaurantReviewRemove(int num) {
			sql.delete("restaurantReview.delete",num);
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
			int result = sql.selectOne("restaurantReview.check",nivo);
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
			int result = sql.selectOne("restaurantReview.check",nivo);
			if(result == 0) {
				sql.insert("restaurantReview.niceInsert",nivo);
				likeImg = "/eatoday/resource/images/like2.png";
			} else {
				sql.delete("restaurantReview.niceDelete",nivo);
				likeImg = "/eatoday/resource/images/like.png";
			}
			model.addAttribute("likeImg",likeImg);
			return "/homepage/niceClick";
		}
		
		// ���ƿ� ���� ī��Ʈ
		@RequestMapping("restaurantNiceCountCheck.eat")
		public String NiceCountCheck(int renum,Model model) {
			int niceCountCheck = (Integer)sql.selectOne("restaurantReview.niceCount",renum);
			model.addAttribute("niceCountCheck",niceCountCheck);
			return "/homepage/niceCountCheck";
		}
		
		// ���̵�޴�  ī�װ� ī��Ʈ
		@RequestMapping("restaurantCateCount.eat")
		public String restaurantCateCount(String cate,Model model) {
			int CateCount = sql.selectOne("restaurant.count",cate);
			model.addAttribute("CateCount", CateCount);
			return "/homepage/CateCount";
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


