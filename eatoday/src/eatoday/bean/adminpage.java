package eatoday.bean;

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

import eatoday.vo.memberVO;

@Controller
@RequestMapping("/adminpage/")
public class adminpage {
	
	@Autowired
	private SqlSessionTemplate sql = null;
	
	@RequestMapping("member.eat")
	public String member(HttpServletRequest request,Model model) {
		int row = 20;
		String page = request.getParameter("page");
		int count = sql.selectOne("member.count");
	
		if (page == null) {
			page ="1";
		}
		int currentPage = Integer.parseInt(page);
		int startRow = (currentPage-1) * row +1;
		int endRow = currentPage * row;
		Map pageList = new HashMap();
		pageList.put("startRow",startRow);
		pageList.put("endRow",endRow);
		List memVO = sql.selectList("member.List",pageList);
		
		// 페이지 계산
		int pageCount = count / row + (count % row == 0? 0:1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
		int endPage = startPage + pageBlock-1;
		if(endPage > pageCount) endPage = pageCount;
		model.addAttribute("memVO",memVO);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("pageCount",pageCount);
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
	public String recipeReview(HttpServletRequest request,Model model) {
				//레시피 리뷰 가져오기
				int row = 20;
				String page = request.getParameter("page");
				
				//리뷰 카운트
				int recount = sql.selectOne("recipe.ReviewCount");
				
				if (page == null) {
					page ="1";
				}
				int currentPage = Integer.parseInt(page);
				int startRow = (currentPage-1) * row +1;
				int endRow = currentPage * row;
				Map pageList = new HashMap();
	
				pageList.put("startRow",startRow);
				pageList.put("endRow",endRow);
	
				List recipeReviewVO = sql.selectList("recipe.reviewSelect",pageList);
				
				// 페이지 계산
				int pageCount = recount / row + (recount % row == 0? 0:1);
				int startPage = (int)(currentPage/10)*10+1;
				int pageBlock=10;
				int endPage = startPage + pageBlock-1;
				if(endPage > pageCount) endPage = pageCount;
		model.addAttribute("recipeReviewVO",recipeReviewVO);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("pageCount",pageCount);
		return "/admin/recipeReview";
	}
	
	@RequestMapping("restaurantReview.eat")
	public String restaurantReview(HttpServletRequest request,Model model) {
		//레시피 리뷰 가져오기
		int row = 20;
		String page = request.getParameter("page");
		
		//리뷰 카운트
		int recount = sql.selectOne("restaurant.ReviewCount");
		
		if (page == null) {
			page ="1";
		}
		int currentPage = Integer.parseInt(page);
		int startRow = (currentPage-1) * row +1;
		int endRow = currentPage * row;
		Map pageList = new HashMap();

		pageList.put("startRow",startRow);
		pageList.put("endRow",endRow);

		List restaurantReviewVO = sql.selectList("restaurant.reviewSelect",pageList);
		
		// 페이지 계산
		int pageCount = recount / row + (recount % row == 0? 0:1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
		int endPage = startPage + pageBlock-1;
		if(endPage > pageCount) endPage = pageCount;
		model.addAttribute("restaurantReviewVO",restaurantReviewVO);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("pageCount",pageCount);
		return "/admin/restaurantReview";
	}
	
	@RequestMapping("recipeReviewRemove.eat")
	public String recipeReviewRemove(int num,HttpSession session) {
		String admin = (String)session.getAttribute("loginID");
		if(admin.equals("admin@eatoday.com")) {
			sql.delete("recipe.reviewDelete",num);
		}
		return "/admin/reviewRemove";
	}
	
	@RequestMapping("restaurantReviewRemove.eat")
	public String restaurantReviewRemove(int num,HttpSession session) {
		String admin = (String)session.getAttribute("loginID");
		if(admin.equals("admin@eatoday.com")) {
			sql.delete("restaurant.reviewDelete",num);
		}
		return "/admin/reviewRemove";
	}
	
	@RequestMapping("supportRemove.eat")
	public String supportRemove(int num,HttpSession session) {
		String admin = (String)session.getAttribute("loginID");
		if(admin.equals("admin@eatoday.com")) {
			sql.delete("support.delete",num);
		}
		return "/admin/supportRemove";
	}
}

