package eatoday.bean;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

@Controller
@RequestMapping("/homepage/")
public class Recipe {
	
	@Autowired
	private SqlSessionTemplate sql = null;
	
	@RequestMapping("recipeListView.eat")
	public String recipeKorView(Model model, HttpServletRequest request) throws Exception {
		String cate = request.getParameter("cate");
		int count = (Integer)sql.selectOne("recipe.count");
		ArrayList rcp = new ArrayList();
		List rcpList = sql.selectList("recipe.select",cate);
		
		if (cate != null) {
			
		}
		//System.out.println(rcpList);

		model.addAttribute("recipeList", rcpList);
		model.addAttribute("count", count);
		model.addAttribute("cate",cate);
		 
		return "/homepage/recipeListView";
	}
	
	@RequestMapping("recipeDetail.eat")
	public String recipeDetail(Model model, HttpServletRequest request) throws Exception {
		String cnum = request.getParameter("cnum");
		int recount = sql.selectOne("recipe.ReviewCount",cnum);

		// �ش� ������ ����
		recipeVO vo = sql.selectOne("recipe.info",cnum);
		String [] pro = vo.getPro().split("next"); // ������ �и�
		int proCount = pro.length; // for�� ������
		// ������ �ش� �̹��� set
		List ivo = sql.selectList("recipe.imgselect", cnum);
		
		//������ ���� ��������
		List revo = sql.selectList("recipe.reviewSelect",cnum);
		
		
		
		model.addAttribute("pro",pro);
		model.addAttribute("ivo",ivo);
		model.addAttribute("rvo",vo);
		model.addAttribute("revo",revo);
		model.addAttribute("recount",recount);
		model.addAttribute("proCount",proCount);
		model.addAttribute("recount",recount);
		return "/homepage/recipeDetail";
	}
	
//	@RequestMapping("recipeWst.eat")
//	public String recipeWst() {
//		return "/homepage/recipeWst";
//	}
	
	//��� ����
	@RequestMapping("recipeRePro.eat")
	public String recipeRePro(MultipartHttpServletRequest request,Model model) throws Exception{
		request.setCharacterEncoding("UTF-8");
		MultipartFile mf = request.getFile("img");
		String orgName = mf.getOriginalFilename();
		recipeReviewVO vo = new recipeReviewVO();
		if(orgName != "") {
		//�̹��� ���ε�
		String path = request.getRealPath("//resource//RecipeReview");
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
		vo.setNice(0);
		sql.insert("recipe.recipeReview",vo);
		model.addAttribute("cnum",cnum);
			
			return "/homepage/recipeRePro";
		}
	
	
	// ������ ù ����ø� ��� ��� Ŭ�� ���� üũ
	@RequestMapping("nice.eat")
	public String nice(recipeReviewVO vo,Model model) {
		recipeReviewNiceVO nivo = new recipeReviewNiceVO();
		String likeImg;
		nivo.setRenum(vo.getNum());
		nivo.setId(vo.getId());
		int result = sql.selectOne("recipe.reviewCheck",nivo);
		if(result == 0) {
			likeImg = "/eatoday/resource/images/like.png";
		} else {
			likeImg = "/eatoday/resource/images/like2.png";
		}
		model.addAttribute("likeImg",likeImg);
		return "/homepage/nice";
	}
	
	// ��� ���ƿ� Ŭ�� �̺�Ʈ
	@RequestMapping("niceClick.eat")
	public String niceClick(recipeReviewVO vo,Model model) {
		recipeReviewNiceVO nivo = new recipeReviewNiceVO();
		String likeImg;
		nivo.setRenum(vo.getNum());
		nivo.setId(vo.getId());
		int result = sql.selectOne("recipe.reviewCheck",nivo);
		if(result == 0) {
			sql.insert("recipe.reviewNiceInsert",nivo);
			likeImg = "/eatoday/resource/images/like2.png";
		} else {
			sql.delete("recipe.reviewNiceDelete",nivo);
			likeImg = "/eatoday/resource/images/like.png";
		}
		model.addAttribute("likeImg",likeImg);
		return "/homepage/niceClick";
	}
	
	// ���ƿ� ���� ī��Ʈ
	@RequestMapping("niceCountCheck.eat")
	public String niceCount(int renum,Model model) {
		int niceCountCheck = (Integer)sql.selectOne("recipe.niceCount",renum);
		model.addAttribute("niceCountCheck",niceCountCheck);
		return "/homepage/niceCountCheck";
	}
	
	// index.jsp���� �˻��� ��� ǥ�� - map_kwd.jsp included
	@RequestMapping("searchResult.eat")
	public String searchResult(HttpServletRequest request, Model model) {
		return "/homepage/searchResult";
	}
	
	
	
	//������ �˻�
	@RequestMapping("SearchRecipe.eat")
	public String SearchRecipe(HttpServletRequest request, Model model ) {
		String srch=request.getParameter("search");
		
		System.out.println("Srch(search)="+srch);

		List rcpTit = sql.selectList("recipe.searchRecTitle",srch);
		List rcpMat = sql.selectList("recipe.searchRecMate",srch);
		
		model.addAttribute("srch", srch);
		model.addAttribute("rcpTit", rcpTit);
		model.addAttribute("rcpMat", rcpMat);
		
		return "/homepage/SearchRecipe";
	}
	@RequestMapping("recipeCateCount.eat")
	public String recipeCateCount(String cate,Model model) {
		int CateCount =(Integer)sql.selectOne("recipe.cateCount",cate);
		model.addAttribute("CateCount",CateCount);
		return "/homepage/recipeCateCount";
	}
}
