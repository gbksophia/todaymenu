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
	
	// 리스트 보여주기
	@RequestMapping("supportList.eat")
	public String supportList(HttpServletRequest request,Model model) {
			//페이지 나누기
			int row = 20;
			String page = request.getParameter("page");
			
			//support 카운트
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
			
			// 리스트 가져오기
			List supportList = sql.selectList("support.List",pageList);
			
			// 페이지 계산
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

		
		// 글쓰기 폼
		@RequestMapping("supportWrite.eat")
		public String supportWrite() {
			return "/homepage/supportWrite";
		}
		
		
		
		// 글쓰기
		@RequestMapping("supportWritePro.eat")
		public String supportWritePro(MultipartHttpServletRequest request,HttpSession session) throws Exception {
			request.setCharacterEncoding("UTF-8");
			supportVO vo = new supportVO();
			
			String id = (String)session.getAttribute("loginID");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String nick = request.getParameter("nick");
			
			if(nick.equals("")) {
				nick = "익명"; //닉네임 값이 없을떄 익명 출력
			}
			
			if(id.equals("admin@eatoday.com")) {
				nick = "관리자";  // 어드민 아이디 일떈 관리자 고정
			}
			
			//이미지
			MultipartFile mf = request.getFile("img");
			String orgName = mf.getOriginalFilename();
			
			
			// 이미지 유무 체크
			if(orgName != "") {
				//이미지 업로드
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
			
			// 공지 / 문의 분류
			if (id.equals("admin@eatoday.com")) {
				vo.setNotice(1);   // 공지
			} else {
				vo.setNotice(0);  // 문의
			}
			vo.setContent(content);
			vo.setId(id);
			vo.setSubject(subject);
			vo.setNick(nick);
			sql.insert("support.insert",vo);
			return "/homepage/supportWritePro";
		}
		
		
		// 질문 / 공지 글 보기
		@RequestMapping("supportContent.eat")
		public String supportContent(int num,Model model) {
			supportVO vo = new supportVO();
			vo = sql.selectOne("support.select",num);
			
			model.addAttribute("supportVO",vo);
			return "/homepage/supportContent";
		}
		
		
		// 답변 쓰기
		@RequestMapping("commentPro.eat")
		public String commentPro(supportVO vo,HttpSession session,Model model) {
			String admin = (String)session.getAttribute("loginID");
			if(admin.equals("admin@eatoday.com")) {
				sql.update("support.update",vo);  // 어드민 일 때만 댓글 쓰기
			}
			model.addAttribute("num",vo.getNum());
			return "/homepage/commentPro";
		}
		
		// 답변 삭제
		@RequestMapping("supportCommentRemove.eat")
		public String supportCommentRemove(HttpSession session,int num,Model model) {
			String admin = (String)session.getAttribute("loginID");
			if(admin.equals("admin@eatoday.com")) { // 어드민 일 때만 댓글 삭제
				sql.update("support.commentRemove",num);
			}
			model.addAttribute("num",num);
			return "/homepage/supportCommentRemove";
		}
		
		// 답변 수정
		@RequestMapping("supportCommentUpdate.eat")
		public String supportCommentUpdate(supportVO vo,Model model,HttpSession session) {
			String admin = (String)session.getAttribute("loginID"); 
			if(admin.equals("admin@eatoday.com")) { // 어드민 일 때만 댓글 업데이트
				sql.update("support.commentUpdate",vo);
			}
			model.addAttribute("comment",vo.getComments());
			return "/homepage/supportCommentUpdate";
		}
		
		// 회원 글 리스트
		@RequestMapping("mySupportList.eat")
		public String mySupportList(HttpSession session,Model model,HttpServletRequest request) {
			String id = (String)session.getAttribute("loginID");    // 로그인 중 아이디 가져오기
			int result = 0;
			
			// 페이지 나누기
			int row = 20;
			String page = request.getParameter("page");
			
			//support 카운트
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
			
			if(id != null) {  // 로그인 중 일때 리스트 출력
				List supportList = sql.selectList("support.myList",pageList);
				result = 1;
				model.addAttribute("supportList",supportList);
				
			}
			
			// 페이지 계산
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
