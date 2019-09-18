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
import eatoday.vo.restaurantVO;

@Controller
@RequestMapping("/homepage/")
public class Restaurant {
	
	@Autowired
	private SqlSessionTemplate sql = null;
	
	@RequestMapping("restaurantList.eat")
	public String restaurantList(Model model, HttpServletRequest request) throws Exception {
		
		String cate = request.getParameter("cate");
		System.out.println(cate);
		String cateImg = sql.selectOne("restaurant.cateImg",cate);
		//������ ī��Ʈ
		int count = sql.selectOne("restaurant.cateCount",cate);
			
		//������ ���� ��������
		int row = 28;
		String page = request.getParameter("page");
			
			if (page == null) {
				page ="1";
			}
		int currentPage = Integer.parseInt(page);
		int startRow = (currentPage-1) * row +1;
		int endRow = currentPage * row;
		Map pageList = new HashMap();
				
		pageList.put("cate", cate);
		pageList.put("startRow",startRow);
		pageList.put("endRow",endRow);
				
		List rcpList = sql.selectList("restaurant.select",pageList);
				
		// ������ ���
		int pageCount = count / row + (count % row == 0? 0:1);
		int startPage = (int)(currentPage/28)*28+1;
		int pageBlock= 10;
		int endPage = startPage + pageBlock-1;
		if(endPage > pageCount) endPage = pageCount;


		model.addAttribute("recipeList", rcpList);
		model.addAttribute("count", count);
		model.addAttribute("cate",cate);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage); 
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("cateImg",cateImg);
		return "/homepage/recipeListView";
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
	
//	@RequestMapping("recipeWst.eat")
//	public String recipeWst() {
//		return "/homepage/recipeWst";
//	}
	
	
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
		String cate = request.getParameter("cate");
		if(nick.equals("")) {
			nick = "�͸�";
		}
		vo.setCnum(cnum);
		vo.setId(id);
		vo.setNick(nick);
		vo.setText(text);
		sql.insert("restaurantReview.insert",vo);
			return "/homepage/recipeRePro";
		}
	
	//���� ����
	@RequestMapping("restaurantReviewUpdate.eat")
	public String restaurantReviewUpdate(recipeReviewVO vo,Model model) {
		System.out.println(vo.getNum());
		System.out.println(vo.getText());
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
		recipeReviewNiceVO nivo = new recipeReviewNiceVO();
		String likeImg;
		nivo.setRenum(vo.getNum());
		nivo.setId(vo.getId());
		int result = sql.selectOne("restaurantReview.check",nivo);
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
		recipeReviewNiceVO nivo = new recipeReviewNiceVO();
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
	      int niceCountCheck = (Integer)sql.selectOne("restaurant.niceCount",renum);
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