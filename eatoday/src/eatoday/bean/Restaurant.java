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
import eatoday.vo.restaurantReviewVO;
import eatoday.vo.restaurantVO;

@Controller
@RequestMapping("/restaurant/")
public class Restaurant {
	
	@Autowired
	private SqlSessionTemplate sql = null;
	
	// ������� ����Ʈ ������
	@RequestMapping("restaurantList.eat")
	public String restaurantList(HttpServletRequest request, Model model) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String cate = request.getParameter("cate"); //ī�װ���
		String area = request.getParameter("area"); //������
		List areaList = sql.selectList("restaurant.restArea", cate); //ī�װ��� ��������Ʈ rvo
		int areaCnt = (Integer)sql.selectOne("restaurant.restAreaCnt", cate); //ī�װ�+���� ī��Ʈ int
		  
		ArrayList ra = new ArrayList(); 
		ra.add(area);
		ra.add(cate);
		List raList = sql.selectList("restaurant.selectArea", ra); //ī�װ�+���� �˻���� rvo
		System.out.println(cate+area);
		
		model.addAttribute("areaList", areaList);
		model.addAttribute("areaCnt", areaCnt);
		model.addAttribute("area", area);
		model.addAttribute("cate", cate);
		model.addAttribute("raList", raList);
		return "/restaurant/restaurantList";
	}
		
	// ������� ���� ���� ������ 
	@RequestMapping("restaurantDetail.eat")
	public String restaurantDetail(HttpServletRequest request, Model model,HttpSession session) {
		String cnum = request.getParameter("cnum");
		String cate = request.getParameter("cate");
		 
		// �α��� ���� ���̵� ���� �ҋ� ����
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
		int row = 10;  // �������� ������ ����
		String page = request.getParameter("page");
		 
		if (page == null) {
			page ="1";
		}
				 
		int currentPage = Integer.parseInt(page);   // ��Ʈ������ ��ȯ
		int startRow = (currentPage-1) * row +1;    // �� �������� �����ϴ� ��ȣ ex) row = 10�϶� startRow = 1 , 11 , 21 ....
		int endRow = currentPage * row;    // �� �������� ������ ��ȣ ex) row = 10�϶� startRow = 10 , 20, 30 ....
		Map pageList = new HashMap();     // sql ���� �����ֱ� ���� ����
		 
		pageList.put("cnum", cnum);
		pageList.put("startRow",startRow);
		pageList.put("endRow",endRow);
		 
		// ������� ���� ��������
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
		return "/restaurant/restaurantDetail";
	}
	
	//���� ī��Ʈ
	@RequestMapping("restaurantReviewCount.eat")
	public String restaurantReviewCount(String cnum,Model model) {
		int recount = (Integer)sql.selectOne("restaurantReview.count", cnum);
		model.addAttribute("recount",recount);
		return "/restaurant/reviewCount";
	}
	
	//���� ����
	@RequestMapping("restaurantRePro.eat")
	public String restaurantRePro(MultipartHttpServletRequest request,Model model) throws Exception{
		request.setCharacterEncoding("UTF-8");
		MultipartFile mf = request.getFile("img");
		String orgName = mf.getOriginalFilename();
		restaurantReviewVO vo = new restaurantReviewVO();
		
		// ���� ���� ����
		if(orgName != "") {   // ������ ������ �� ����
			//�̹��� ���ε�
			String path = request.getRealPath("//resource//RestaurantReview");
			String ext = orgName.substring(orgName.lastIndexOf('.'));
			sql.insert("restaurantReview.imgCountInsert");  // �̹��� ���� ����
			int num = sql.selectOne("restaurantReview.imgCount"); // �̹��� ���� ��������
				
			String newName = "image"+num+ext;
			File copyFile = new File(path +"//"+ newName);
			mf.transferTo(copyFile);  // �̹��� ����
			
			vo.setImg(newName);
		} else {
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
		
		return "/restaurant/restaurantDetail";
		}
	
	//���� ����
	@RequestMapping("restaurantReviewUpdate.eat")
	public String reviewUpdate(restaurantReviewVO vo,Model model) {
		sql.update("restaurantReview.update",vo);
		String text = sql.selectOne("restaurantReview.text", vo.getNum()); // ����� ���� ��������
		model.addAttribute("text",text);
		return "/restaurant/reviewUpdate";
	}
	
	//���� ����
	@RequestMapping("restaurantReviewRemove.eat")
	public String restaurantReviewRemove(int num) {
		sql.delete("restaurantReview.delete",num);
		return "/restaurant/reviewRemove";
	}
	
	// ������ ù ����ø� ��� ��� ���ƿ� Ŭ�� ���� üũ
	@RequestMapping("restaurantNice.eat")
	public String restaurantNice(restaurantReviewVO vo,Model model) {
		recipeReviewNiceVO nivo = new recipeReviewNiceVO();
		String likeImg;
		nivo.setRenum(vo.getNum());
		nivo.setId(vo.getId());
		int result = sql.selectOne("restaurantReview.check",nivo); // ���ƿ� ������ 1 ������ 0 ����
		if(result == 0) {  // ���ƿ並 �ȴ�������
			likeImg = "/eatoday/resource/images/like.png";
		} else { // ��������
			likeImg = "/eatoday/resource/images/like2.png";
		}
		model.addAttribute("likeImg",likeImg);
		return "/restaurant/nice";
	}
	
	// ��� ���ƿ� Ŭ�� �̺�Ʈ
	@RequestMapping("restaurantNiceClick.eat")
	public String restaurantNiceClick(restaurantReviewVO vo,Model model) {
		recipeReviewNiceVO nivo = new recipeReviewNiceVO();
		String likeImg;
		nivo.setRenum(vo.getNum());
		nivo.setId(vo.getId());
		int result = sql.selectOne("restaurantReview.check",nivo); // ���ƿ� ������ 1 ������ 0 ����
		
		if(result == 0) {
			sql.insert("restaurantReview.niceInsert",nivo);  // ���ƿ� DB�� ����
			likeImg = "/eatoday/resource/images/like2.png";  // ���ƿ� ���� �� �̹���
		} else {
			sql.delete("restaurantReview.niceDelete",nivo); // ���ƿ� DB���� ����
			likeImg = "/eatoday/resource/images/like.png";  // ���ƿ� �ȴ������� �̹���
		}
		model.addAttribute("likeImg",likeImg);
		return "/restaurant/niceClick";
	}
	
	// ���ƿ� ���� ī��Ʈ
	@RequestMapping("restaurantNiceCountCheck.eat")
	public String restaurantNiceCountCheck(int renum,Model model) {
		int niceCountCheck = (Integer)sql.selectOne("restaurantReview.niceCount",renum);
		model.addAttribute("niceCountCheck",niceCountCheck);
		return "/restaurant/niceCountCheck";
	}
	
	// ���̵�޴�  ī�װ� ī��Ʈ
	@RequestMapping("restaurantCateCount.eat")
	public String restaurantCateCount(String cate,Model model) {
		int CateCount = sql.selectOne("restaurant.count",cate);
		model.addAttribute("CateCount", CateCount);
		return "/restaurant/CateCount";
	}
	
	//������� �߰�
	@RequestMapping("restaurantCreate.eat")
	public String restaurantCreate() {
		
		return "/restaurant/restaurantCreate";
	}
	
	
}