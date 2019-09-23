package eatoday.bean;

import java.io.File;
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
@RequestMapping("/support/")
public class supportpage {
	
	@Autowired
	private SqlSessionTemplate sql = null;
	
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
