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

import eatoday.vo.supportVO;

@Controller
@RequestMapping("/homepage/")
public class homepage {
	
	@Autowired
	private SqlSessionTemplate sql = null;
	
	//http://localhost:8080/eatoday/homepage/index.eat
	@RequestMapping("index.eat")
	public String index(Model model, HttpServletRequest request,HttpSession session) {
		String id = (String)session.getAttribute("loginID");
		
		//������, ������� ����
		int recCnt = sql.selectOne("recipe.count");
		int resCnt = sql.selectOne("restaurant.total");
		model.addAttribute("recCnt", recCnt);
		model.addAttribute("resCnt", resCnt);
		
		if (id != null) {
			try {
				request.setCharacterEncoding("UTF-8");
				
				int count = (Integer)sql.selectOne("recipe.count");			
				int greatest = sql.selectOne("recipe.greatest",id);
				//recipe.greatest=mem ���̺��� ���� ��ȣ�ϴ� ī�װ��� ��
				
				List rcp = sql.selectList("recipe.cate", greatest);
	
				//recipe.cate=mem ���̺��� ���� ��ȣ�ϴ� ī�װ��� �̸�
				System.out.println(rcp);
	
				// ��ȣ ������������ �ߺ��� ��� ��ȣ�����Ǹ� �������� �˻�							
				int rand = (int)(Math.random()*rcp.size());
				String like_cate = (String)rcp.get(rand);
				Map<String,String> like_parameter = new HashMap<String, String>();
				if(like_cate.equals("RICE")) {
					like_parameter.put("key1","1");
				} else if (like_cate.equals("SOUP") || like_cate.equals("JEONGOL")) { 
					like_parameter.put("key1","2");
					like_parameter.put("key2","3");
				}  else if (like_cate.equals("SIDE")  || like_cate.equals("SHAKE")  || like_cate.equals("GUI")
						 || like_cate.equals("JJIM")  || like_cate.equals("CHILDREN")  || like_cate.equals("KIMCHI")) 
				{
					like_parameter.put("key1","4");
					like_parameter.put("key2","5");
					like_parameter.put("key3","6");
					like_parameter.put("key4","7");
					like_parameter.put("key5","9");
					like_parameter.put("key6","10");
					
				}  else if (like_cate.equals("DOSI")) {
					like_parameter.put("key1","11");
					
				}  else if (like_cate.equals("NOODLE") || like_cate.equals("SPA") ) {
					like_parameter.put("key1","13");
					like_parameter.put("key2","16");
				}  else if (like_cate.equals("SALAD")) {
					like_parameter.put("key1","14");
					
				}  else if (like_cate.equals("SNACK")  || like_cate.equals("FRY")  || like_cate.equals("TOAST")
						 || like_cate.equals("BAKING")  || like_cate.equals("DESSERT")) {
					like_parameter.put("key1","12");
					like_parameter.put("key2","15");
					like_parameter.put("key3","17");
					like_parameter.put("key4","18");
					like_parameter.put("key5","19");
					like_parameter.put("key6","20");
				}  else if (like_cate.equals("JUICE") || like_cate.equals("COCKTAIL")) {
					like_parameter.put("key1","21");
					like_parameter.put("key2","22");
				}  else if (like_cate.equals("GUEST") || like_cate.equals("HOLIDAY")) {
					like_parameter.put("key1","8");
					like_parameter.put("key2","23");;
				}
				rcp = sql.selectList("recipe.randomSelectMain",like_parameter);
				
				model.addAttribute("gnum", greatest);
				model.addAttribute("recipeList", rcp);
				model.addAttribute("count", count);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "/homepage/index";
		} else {
			//��ȸ���� �� �������� ������ ���
			List rnd = sql.selectList("recipe.recipeRandomMain");
			
			model.addAttribute("rndReci", rnd);
			return "/homepage/index";
		}
		
	}

	// ����Ʈ �����ֱ�
	@RequestMapping("supportList.eat")
	public String supportList(HttpServletRequest request,Model model) {
		//������ ������
		int row = 20;
		String page = request.getParameter("page");
		
		//support ī��Ʈ
		int count = sql.selectOne("support.count");
		
		if (page == null) {
			page ="1";
		}
		int currentPage = Integer.parseInt(page);
		int startRow = (currentPage-1) * row +1;
		int endRow = currentPage * row;
		Map pageList = new HashMap();

		pageList.put("startRow",startRow);
		pageList.put("endRow",endRow);
		
		// ����Ʈ ��������
		List supportList = sql.selectList("support.List",pageList);
		
		// ������ ���
		int pageCount = count / row + (count % row == 0? 0:1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
		int endPage = startPage + pageBlock-1;
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("supportList",supportList);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("pageCount",pageCount);
		return "/homepage/supportList";
	}

	
	// �۾��� ��
	@RequestMapping("supportWrite.eat")
	public String supportWrite() {
		return "/homepage/supportWrite";
	}
	
	
	
	// �۾���
	@RequestMapping("supportWritePro.eat")
	public String supportWritePro(MultipartHttpServletRequest request,HttpSession session) throws Exception {
		request.setCharacterEncoding("UTF-8");
		supportVO vo = new supportVO();
		
		String id = (String)session.getAttribute("loginID");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String nick = request.getParameter("nick");
		
		if(nick.equals("")) {
			nick = "�͸�"; //�г��� ���� ������ �͸� ���
		}
		
		if(id.equals("admin@eatoday.com")) {
			nick = "������";  // ���� ���̵� �ϋ� ������ ����
		}
		
		//�̹���
		MultipartFile mf = request.getFile("img");
		String orgName = mf.getOriginalFilename();
		
		
		// �̹��� ���� üũ
		if(orgName != "") {
			//�̹��� ���ε�
			String path = request.getRealPath("//resource//support");
			String ext = orgName.substring(orgName.lastIndexOf('.'));
			sql.insert("recipe.ImgcountInsert");
			int num = sql.selectOne("recipe.ImgCount");
				
			String newName = "image"+num+ext;
			File copyFile = new File(path +"//"+ newName);
			mf.transferTo(copyFile);
			vo.setImg(newName);
			}	else {
				vo.setImg("");
			}
		
		// ���� / ���� �з�
		if (id.equals("admin@eatoday.com")) {
			vo.setNotice(1);   // ����
		} else {
			vo.setNotice(0);  // ����
		}
		vo.setContent(content);
		vo.setId(id);
		vo.setSubject(subject);
		vo.setNick(nick);
		sql.insert("support.insert",vo);
		return "/homepage/supportWritePro";
	}
	
	
	// ���� / ���� �� ����
	@RequestMapping("supportContent.eat")
	public String supportContent(int num,Model model) {
		supportVO vo = new supportVO();
		vo = sql.selectOne("support.select",num);
		
		model.addAttribute("supportVO",vo);
		return "/homepage/supportContent";
	}
	
	
	// �亯 ����
	@RequestMapping("commentPro.eat")
	public String commentPro(supportVO vo,HttpSession session,Model model) {
		String admin = (String)session.getAttribute("loginID");
		if(admin.equals("admin@eatoday.com")) {
			sql.update("support.update",vo);  // ���� �� ���� ��� ����
		}
		model.addAttribute("num",vo.getNum());
		return "/homepage/commentPro";
	}
	
	// �亯 ����
	@RequestMapping("supportCommentRemove.eat")
	public String supportCommentRemove(HttpSession session,int num,Model model) {
		String admin = (String)session.getAttribute("loginID");
		if(admin.equals("admin@eatoday.com")) { // ���� �� ���� ��� ����
			sql.update("support.commentRemove",num);
		}
		model.addAttribute("num",num);
		return "/homepage/supportCommentRemove";
	}
	
	// �亯 ����
	@RequestMapping("supportCommentUpdate.eat")
	public String supportCommentUpdate(supportVO vo,Model model,HttpSession session) {
		String admin = (String)session.getAttribute("loginID"); 
		if(admin.equals("admin@eatoday.com")) { // ���� �� ���� ��� ������Ʈ
			sql.update("support.commentUpdate",vo);
		}
		model.addAttribute("comment",vo.getComments());
		return "/homepage/supportCommentUpdate";
	}
	
	// ȸ�� �� ����Ʈ
	@RequestMapping("mySupportList.eat")
	public String mySupportList(HttpSession session,Model model,HttpServletRequest request) {
		String id = (String)session.getAttribute("loginID");    // �α��� �� ���̵� ��������
		int result = 0;
		
		// ������ ������
		int row = 20;
		String page = request.getParameter("page");
		
		//support ī��Ʈ
		int count = sql.selectOne("support.count");
		
		if (page == null) {
			page ="1";
		}
		int currentPage = Integer.parseInt(page);
		int startRow = (currentPage-1) * row +1;
		int endRow = currentPage * row;
		Map pageList = new HashMap();
		pageList.put("id",id);
		pageList.put("startRow",startRow);
		pageList.put("endRow",endRow);
		
		if(id != null) {  // �α��� �� �϶� ����Ʈ ���
			List supportList = sql.selectList("support.myList",pageList);
			result = 1;
			model.addAttribute("supportList",supportList);
			
		}
		
		// ������ ���
		int pageCount = count / row + (count % row == 0? 0:1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
		int endPage = startPage + pageBlock-1;
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("result",result);	
		return "/homepage/mySupportList";
	}
}