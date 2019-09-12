package eatoday.bean;

import java.util.List;

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
	public String jjimList(String id,Model model){
		List jjimList = sql.selectList("recipe.jjimList",id);
		
		model.addAttribute("jjimList",jjimList);
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
}