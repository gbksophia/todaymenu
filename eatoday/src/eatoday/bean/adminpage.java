package eatoday.bean;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import eatoday.vo.memberVO;

@Controller
@RequestMapping("/adminpage/")
public class adminpage {
	
	@Autowired
	private SqlSessionTemplate sql = null;
	
	@RequestMapping("member.eat")
	public String member(Model model) {
		List memVO = sql.selectList("member.List");
		
		model.addAttribute("memVO",memVO);
		return "/admin/member";
	}
	@RequestMapping("memberRemove.eat")
	public String remove(String id,HttpSession session) {
		String admin = (String)session.getAttribute("loginID");
		if(admin.equals("admin@eatoday.com")) {
			sql.delete("member.delete",id);
		}
		return "/admin/memberRemove";
	}
	
	@RequestMapping("recipeReview.eat")
	public String recipeReview(Model model) {
		List recipeReviewVO = sql.selectList("recipe.reviewSelect");
		model.addAttribute("recipeReviewVO",recipeReviewVO);
		return "/admin/recipeReview";
	}
	
	@RequestMapping("reviewRemove.eat")
	public String reviewRemove(int num,HttpSession session) {
		String admin = (String)session.getAttribute("loginID");
		if(admin.equals("admin@eatoday.com")) {
			sql.delete("recipe.reviewDelete",num);
		}
		return "/admin/reviewRemove";
	}
}

