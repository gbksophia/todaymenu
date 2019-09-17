package eatoday.bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import eatoday.vo.memberVO;
import eatoday.vo.recipeJjimVO;

@Controller
@RequestMapping("/memberpage/")
public class memberpage {
	@Autowired
	private SqlSessionTemplate sql = null;
	
	@RequestMapping("information.eat")
	public String information(HttpSession session,Model model) {
		String id = (String)session.getAttribute("loginID");
		String code = sql.selectOne("member.codeSelect", id);
		memberVO vo = sql.selectOne("member.info",id);
	
		model.addAttribute("vo",vo);
		model.addAttribute("code",code);
		return "/member/information";
	}
	
	@RequestMapping("logout.eat")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/member/logout";
	}
	
	@RequestMapping("remove.eat")
	public String remove(memberVO vo, Model model,HttpSession session) {
		int result = sql.selectOne("member.loginCheck",vo);
		if (result==1) {
			sql.delete("member.delete",vo.getId());
			session.invalidate();
		}
		
		model.addAttribute("result",result);
		return "/member/remove";
	}
	
	@RequestMapping("change.eat")
	public String change(memberVO vo,Model model) {
		int result = sql.selectOne("member.loginCheck",vo);
		
		model.addAttribute("result",result);
		return "/member/change";
	}

	@RequestMapping("changePro.eat")
	public String changePro(String pw, String pw2, Model model,HttpSession session) {
		int result = 1;
		String id = (String)session.getAttribute("loginID");
		memberVO vo = new memberVO();
		if (pw.equals(pw2)) {
			vo.setId(id);
			vo.setPw(pw);
			sql.update("member.update",vo);
			result = 0;
		} 
		
		model.addAttribute("result",result);
		return "/member/changePro";
	}
	@RequestMapping("recipeJjim.eat")
	public String recipeJjim(recipeJjimVO vo,Model model) {
		int result = sql.selectOne("recipe.jjimCheck",vo);
		
		String img;
		if(result==0) {
			img = "/eatoday/resource/images/jjim1.png";
		} else {
			img = "/eatoday/resource/images/jjim2.png";
		}
		model.addAttribute("img",img);
		return "/member/recipeJjim";
	}
	
	@RequestMapping("recipeJjimClick.eat")
	public String recipeJjimClick(recipeJjimVO vo,Model model) {
		int result = sql.selectOne("recipe.jjimCheck",vo);
		String img;
		if(result==1) {
			img ="/eatoday/resource/images/jjim1.png";
			sql.delete("recipe.jjimDelete",vo);
		} else {
			img = "/eatoday/resource/images/jjim2.png";
			sql.insert("recipe.jjimInsert",vo);
		}
		model.addAttribute("img",img);
		return "/member/recipeJjimClick";
	}
	
	@RequestMapping("jjimList.eat")
	public String jjimList(HttpServletRequest request,Model model,HttpSession session){
		String id = (String)session.getAttribute("loginID");
		int count = sql.selectOne("recipe.jjimCount",id);
		int row = 10;
		String page = request.getParameter("page");
			
			if (page == null) {
				page ="1";
			}
		int currentPage = Integer.parseInt(page);
		int startRow = (currentPage-1) * row +1;
		int endRow = currentPage * row;
		Map pageList = new HashMap();
				
		pageList.put("id", id);
		pageList.put("startRow",startRow);
		pageList.put("endRow",endRow);
				
		List jjimList = sql.selectList("recipe.jjimList",pageList);
				
		// 페이지 계산
		int pageCount = count / row + (count % row == 0? 0:1);
		int startPage = (int)(currentPage/5)*5+1;
		int pageBlock= 10;
		int endPage = startPage + pageBlock-1;
		if(endPage > pageCount) endPage = pageCount;

		model.addAttribute("jjimList",jjimList);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("pageCount",pageCount);
		return "/member/jjimList";
	}
	
	// 아이디 찾기 폼
	@RequestMapping("idSearch.eat")
	public String idSearch() {
		return "/member/idSearch";
	}
	
	// 아이디 찾기 프로
		@RequestMapping("idSearchPro.eat")
		public String idSearchPro(String code,Model model) {
			int result = (Integer)sql.selectOne("member.idSearchCheck",code);
			
			if(result ==1) {
				String id = sql.selectOne("member.idSearch", code);	
				model.addAttribute("id", id);
			}
			model.addAttribute("result", result);
			return "/member/idSearchPro";
		}
		
		// 비밀번호 찾기 폼
		@RequestMapping("pwSearch.eat")
		public String pwSearh() {
			return "/member/pwSearh";
		}
		
		// 비밀번호 찾기 Pro
		@RequestMapping("pwSearchPro.eat")
		public String pwSearhPro(String id,Model model) throws MessagingException {
			int result = sql.selectOne("member.idCheck",id);
			int port = 465;
			String host = "smtp.gmail.com";

			if(result ==1) {
				sql.update("member.pwReUpdate",id);
				String pw = sql.selectOne("member.pwSearch",id);
				String member = id; // 수신인 주소
				String admin = "eatoday@eatoday.com"; // 발신인 주소
				Properties props = new Properties();
				props.put("mail.smtp.host", host);
				props.put("mail.smtp.port", port);
				props.put("mail.smtp.auth", "true"); 
				props.put("mail.smtp.ssl.enable", "true"); 
				props.put("mail.smtp.ssl.trust", host);

				
				//Session 생성
				Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
					protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
						return new javax.mail.PasswordAuthentication("eatoday110", "dhsmfanjajr1!");
						} 
					});
				session.setDebug(true); //for debug

				MimeMessage msg = new MimeMessage(session); // 메세지 내용 담당 클래스
				msg.setFrom(new InternetAddress(admin)); //발신자의 IP
				msg.setRecipient(Message.RecipientType.TO, new InternetAddress(member));
				msg.setSubject("eatoday 임시 비밀번호");
				msg.setText(id+"님에게 임시 비밀번호\n" + pw + "를 발급하였습니다.\n http://localhost:8080/eatoday/loginpage/login.eat 에 로그인 하시면 됩니다. 감사합니다.");
				Transport.send(msg);
			}
			model.addAttribute("result",result);
			return "/member/pwSearhPro";
		}
		
		// 레시피 리뷰 리스트
		@RequestMapping("recipeReview.eat")
		public String recipeReview(HttpSession session,Model model,HttpServletRequest request) {
			String id = (String)session.getAttribute("loginID");
			int count = sql.selectOne("recipe.memReviewCount",id);
			
			//레시피 리뷰 가져오기
			int row = 10;
			String page = request.getParameter("page");
			
			if (page == null) {
				page ="1";
			}
			int currentPage = Integer.parseInt(page);
			int startRow = (currentPage-1) * row +1;
			int endRow = currentPage * row;
			Map pageList = new HashMap();
			
			pageList.put("id", id);
			pageList.put("startRow",startRow);
			pageList.put("endRow",endRow);

			List recipeList = sql.selectList("recipe.reviewSelect",pageList);
			
			// 페이지 계산
			int pageCount = count / row + (count % row == 0? 0:1);
			int startPage = (int)(currentPage/10)*10+1;
			int pageBlock=10;
			int endPage = startPage + pageBlock-1;
			if(endPage > pageCount) endPage = pageCount;

			model.addAttribute("recipeList",recipeList);
			model.addAttribute("startPage",startPage);
			model.addAttribute("endPage",endPage);
			model.addAttribute("pageCount",pageCount);
			return "/member/recipeReview";
		}
		
		//레스토랑 리뷰 리스트
		@RequestMapping("restaurantReview.eat")
		public String restaurantReview(HttpServletRequest request,HttpSession session, Model model) {
			String id = (String)session.getAttribute("loginID");
			int count = sql.selectOne("restaurant.memReviewCount",id);
			int row = 10;
			String page = request.getParameter("page");
				
				if (page == null) {
					page ="1";
				}
			int currentPage = Integer.parseInt(page);
			int startRow = (currentPage-1) * row +1;
			int endRow = currentPage * row;
			Map pageList = new HashMap();
			pageList.put("id", id);
			pageList.put("startRow",startRow);
			pageList.put("endRow",endRow);
					
			List restaurantList = sql.selectList("restaurant.reviewSelect",pageList);
					
			// 페이지 계산
			int pageCount = count / row + (count % row == 0? 0:1);
			int startPage = (int)(currentPage/10)*10+1;
			int pageBlock= 10;
			int endPage = startPage + pageBlock-1;
			if(endPage > pageCount) endPage = pageCount;

			model.addAttribute("restaurantList",restaurantList);
			model.addAttribute("startPage",startPage);
			model.addAttribute("endPage",endPage);
			model.addAttribute("pageCount",pageCount);
			return "/member/restaurantReview";
		}
		
		// 레시피 리뷰 삭제
		@RequestMapping("recipeReviewRemove.eat")
		public String recipeReviewRemove(int num,HttpSession session) {
			String reviewId = sql.selectOne("recipe.idSelect",num);
			String sessionId = (String)session.getAttribute("loginID");
			
			if(reviewId.equals(sessionId)) {
			sql.delete("recipe.reviewDelete",num);
			}
			
			return "/member/reviewRemove";
		}
		
		// 레스토랑 리뷰 삭제
		@RequestMapping("restaurantReviewRemove.eat")
		public String restaurantReviewRemove(int num,HttpSession session) {
			String reviewId = sql.selectOne("restaurant.idSelect",num);
			String sessionId = (String)session.getAttribute("loginID");
					
			if(reviewId.equals(sessionId)) {
			sql.delete("restaurant.reviewDelete",num);
			}
					
			return "/member/reviewRemove";
		}	
}