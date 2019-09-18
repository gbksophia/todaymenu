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

@Controller
@RequestMapping("/homepage/")
public class Recipe {
	
	@Autowired
	private SqlSessionTemplate sql = null;
	
	@RequestMapping("recipeListView.eat")
	public String recipeKorView(Model model, HttpServletRequest request) throws Exception {
		
		
		String cate = request.getParameter("cate");  // ī�װ� �� ��������
		String cateImg = sql.selectOne("recipe.cateImg",cate); // ī�װ��� �ش��ϴ� ���� �̹��� ��������
		
		int count = sql.selectOne("recipe.cateCount",cate); // ������ ���� (������ ���)
			
		
		//������ ������ ������
		int row = 28;   // ���������� ������ ����
		String page = request.getParameter("page");  //���� ������
			
			if (page == null) {
				page ="1";
			}
			
		int currentPage = Integer.parseInt(page);   // ��Ʈ������ ��ȯ
		int startRow = (currentPage-1) * row +1;    // �� �������� �����ϴ� ��ȣ ex) row = 10�϶� startRow = 1 , 11 , 21 ....
		int endRow = currentPage * row;    // �� �������� ������ ��ȣ ex) row = 10�϶� startRow = 10 , 20, 30 ....
		Map pageList = new HashMap();     // sql ���� �����ֱ� ���� ����
		
		// sql ���� �ʿ��� �� 
		pageList.put("cate", cate);
		pageList.put("startRow",startRow);
		pageList.put("endRow",endRow);
		
		
		// ������ ����Ʈ ��������
		List rcpList = sql.selectList("recipe.select",pageList);
				
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
	
	@RequestMapping("recipeDetail.eat")
	public String recipeDetail(Model model,recipeVO vo,HttpSession session,HttpServletRequest request) throws Exception {
		
		// ī�װ� ���� ������ ��ȣ ����
		String cate = vo.getCate();
		String cnum = vo.getCnum();
		
		
		// �α��� �� �϶��� ����
		if (session.getAttribute("loginID") != null && cate!=null) {
		String id = (String)session.getAttribute("loginID");
		
		// ī�װ� ī��Ʈ ����
		if(cate.equals("1") ) {
			sql.update("member.riceCountUp",id); // �� ������ ī��Ʈ�� ����
			
		} else if (cate.equals("2") ||cate.equals("3")) {
			sql.update("member.soupCountUp",id); // �� & � ���� ������ ī��Ʈ�� ����
			
		}  else if (cate.equals("4") ||cate.equals("5") ||cate.equals("6") 
			||cate.equals("7") ||cate.equals("9") ||cate.equals("10")) {
			sql.update("member.sideCountUp",id); // ���� ���� ������ ī��Ʈ�� ����
			
		}  else if (cate.equals("11")) {
			sql.update("member.dosiCountUp",id); //  ���ö� ������ ī��Ʈ�� ����
			
		}  else if (cate.equals("13") ||cate.equals("16")) {
			sql.update("member.noodleCountUp",id); // �� ���� ������ ī��Ʈ�� ����
			
		}  else if (cate.equals("14")) {
			sql.update("member.saladCountUp",id);  // ������ ������ ī��Ʈ �� ����
			
		}  else if (cate.equals("12") ||cate.equals("15") || cate.equals("17") 
				||cate.equals("18") || cate.equals("19") ||cate.equals("20")) {
			sql.update("member.dessertCountUp",id); // ���� ���� ������ ī��Ʈ �� ����
			
		}  else if (cate.equals("21") ||cate.equals("22")) {
			sql.update("member.drinkCountUp",id);  // ���ǰ� ���� ������ ī��Ʈ�� ����
		
		}  else if (cate.equals("8") ||cate.equals("23")) {
			sql.update("member.holiCountUp",id); // ����/�մԻ� ���� ������ ī��Ʈ������
		}
		
		//���� �ִ� ������ �����ֱ�
		int like = sql.selectOne("recipe.greatest",id); // ī�װ���  �÷��� ���� ������ ã��
		List recipeList = sql.selectList("recipe.cate",like); //  �� ���� ��ġ�ϴ� ī�װ��� ã��
		
		
		// ��ȣ ������������ �ߺ��� ��� ��ȣ�����Ǹ� �������� �˻�				
		int rand = (int)(Math.random()*recipeList.size());
		String like_cate = (String)recipeList.get(rand);
		Map<String,String> like_parameter = new HashMap<String, String>();
		
		if(like_cate.equals("RICE")) {    // ���õȰ��� ���϶� ��� �����ִ� ��ȣ ����
			like_parameter.put("key1","1");
		} else if (like_cate.equals("SOUP") || like_cate.equals("JEONGOL")) { // ���õȰ��� ���϶� ���� �����ִ� ��ȣ ����
			like_parameter.put("key1","2");
			like_parameter.put("key2","3");
		}  else if (like_cate.equals("SIDE")  || like_cate.equals("SHAKE")  || like_cate.equals("GUI")
				 || like_cate.equals("JJIM")  || like_cate.equals("CHILDREN")  || like_cate.equals("KIMCHI"))  // ���õȰ��� �����϶� ������ �����ִ� ��ȣ ����
		{
			like_parameter.put("key1","4");
			like_parameter.put("key2","5");
			like_parameter.put("key3","6");
			like_parameter.put("key4","7");
			like_parameter.put("key5","9");
			like_parameter.put("key6","10");
			
		}  else if (like_cate.equals("DOSI")) { // ���õȰ��� ���ö��϶� ���ö��� �����ִ� ��ȣ ����
			like_parameter.put("key1","11");
			
		}  else if (like_cate.equals("NOODLE") || like_cate.equals("SPA") ) { // // ���õȰ��� ���϶� ��� �����ִ� ��ȣ ����
			like_parameter.put("key1","13");
			like_parameter.put("key2","16");
		}  else if (like_cate.equals("SALAD")) {  // ���õȰ��� �������϶� ������� �����ִ� ��ȣ ����
			like_parameter.put("key1","14");
			
		}  else if (like_cate.equals("SNACK")  || like_cate.equals("FRY")  || like_cate.equals("TOAST")
				 || like_cate.equals("BAKING")  || like_cate.equals("DESSERT")) { // ���õȰ��� �����϶� ���İ� �����ִ� ��ȣ ����
			like_parameter.put("key1","12");
			like_parameter.put("key2","15");
			like_parameter.put("key3","17");
			like_parameter.put("key4","18");
			like_parameter.put("key5","19");
			like_parameter.put("key6","20");
		}  else if (like_cate.equals("JUICE") || like_cate.equals("COCKTAIL")) { // ���õȰ��� �����϶� ����� �����ִ� ��ȣ ����
			like_parameter.put("key1","21");
			like_parameter.put("key2","22");
		}  else if (like_cate.equals("GUEST") || like_cate.equals("HOLIDAY")) { // ���õȰ��� �������϶� ������� �����ִ� ��ȣ ����
			like_parameter.put("key1","8");
			like_parameter.put("key2","23");;
		}
		
		recipeList = sql.selectList("recipe.memRandomSelect",like_parameter);
		model.addAttribute("recipeList",recipeList);
	}
		// ������ ���� ������ �����ֱ� 
		List randomList = sql.selectList("recipe.randomSelect",vo);
		
		//���� ī��Ʈ
		int recount = sql.selectOne("recipeReview.count",cnum);

		// �ش� ������ ����
	    vo = sql.selectOne("recipe.info",cnum);
		String [] pro = vo.getPro().split("next"); // ������ �и�
		int proCount = pro.length; // for�� ������
		// ������ �ش� �̹��� set
		List ivo = sql.selectList("recipe.imgselect", cnum);
		
		//������ ���� ������ ������
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

		List revo = sql.selectList("recipeReview.select",pageList);
		
		// ������ ���
		int pageCount = recount / row + (recount % row == 0? 0:1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
		int endPage = startPage + pageBlock-1;
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("pro",pro);
		model.addAttribute("ivo",ivo);
		model.addAttribute("rvo",vo);
		model.addAttribute("revo",revo);
		model.addAttribute("recount",recount);
		model.addAttribute("proCount",proCount);
		model.addAttribute("recount",recount);
		model.addAttribute("randomList", randomList);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("pageCount",pageCount);
		return "/homepage/recipeDetail";
	}
	
	//���� ī��Ʈ
	@RequestMapping("reviewCount.eat")
	public String reviewCount(String cnum,Model model) {
		int recount = (Integer)sql.selectOne("recipeReview.count", cnum);
		model.addAttribute("recount",recount);
		return "/homepage/reviewCount";
	}
	
	//���� ����
	@RequestMapping("recipeRePro.eat")
	public String recipeRePro(MultipartHttpServletRequest request,Model model) throws Exception{
		request.setCharacterEncoding("UTF-8");
		MultipartFile mf = request.getFile("img");
		String orgName = mf.getOriginalFilename();
		recipeReviewVO vo = new recipeReviewVO();
		
		// �̹��� ���� ����
		if(orgName != "") {
		//�̹��� ���ε�
		String path = request.getRealPath("//resource//RecipeReview");
		String ext = orgName.substring(orgName.lastIndexOf('.'));
		sql.insert("recipeReview.imgCountInsert");
		int num = sql.selectOne("recipeReview.imgCount");
			
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
		
		// ���� ��ĭ�� �� �͸� ���� ����
		if(nick.equals("")) {
			nick = "�͸�";
		}
		
		vo.setCnum(cnum);
		vo.setId(id);
		vo.setNick(nick);
		vo.setText(text);
		
		sql.insert("recipeReview.insert",vo);
			return "/homepage/recipeRePro";
		}
	
	//���� ����
	@RequestMapping("reviewUpdate.eat")
	public String reviewUpdate(recipeReviewVO vo,Model model) {
		sql.update("recipeReview.update",vo);
		String text = sql.selectOne("recipeReview.text", vo.getNum());
		model.addAttribute("text",text);
		return "/homepage/reviewUpdate";
	}
	
	//���� ����
	@RequestMapping("reviewRemove.eat")
	public String reviewRemove(int num) {
		sql.delete("recipeReview.delete",num);
		return "/homepage/reviewRemove";
	}
	
	// ������ ù ����ø� ��� ��� ���ƿ� Ŭ�� ���� üũ
	@RequestMapping("nice.eat")
	public String nice(recipeReviewVO vo,Model model) {
		recipeReviewNiceVO nivo = new recipeReviewNiceVO();
		String likeImg;   // �̹��� �̸� ���� ��
		nivo.setRenum(vo.getNum());
		nivo.setId(vo.getId());
		int result = sql.selectOne("recipeReview.check",nivo);
		if(result == 0) {
			likeImg = "/eatoday/resource/images/like.png"; // ���ƿ並 �ȴ������� �̹���
		} else {
			likeImg = "/eatoday/resource/images/like2.png"; // ���ƿ並 �������� �̹���
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
		int result = sql.selectOne("recipeReview.check",nivo);
		if(result == 0) { //���� ������
			sql.insert("recipeReview.niceInsert",nivo);   // ���ƿ� �߰�
			likeImg = "/eatoday/resource/images/like2.png"; // ���ƿ並 �������� �̹���
		} else {
			sql.delete("recipeReview.niceDelete",nivo); //���ƿ� ����
			likeImg = "/eatoday/resource/images/like.png"; // ���ƿ並 �ȴ������� �̹���
		}
		model.addAttribute("likeImg",likeImg);
		return "/homepage/niceClick";
	}
	
	// ���ƿ� ���� ī��Ʈ
	@RequestMapping("niceCountCheck.eat")
	public String niceCount(int renum,Model model) {
		int niceCountCheck = (Integer)sql.selectOne("recipeReview.niceCount",renum);
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
		
		int countT=sql.selectOne("recipe.countSrTitle",srch);
		int countM=sql.selectOne("recipe.countSrMate",srch);
		
		System.out.println("countT="+countT);
		System.out.println("countM="+countM);
		
		List rcpTit = sql.selectList("recipe.searchRecTitle",srch);
		List rcpMat = sql.selectList("recipe.searchRecMate",srch);
		
		model.addAttribute("srch", srch);

		model.addAttribute("countT", countT);
		model.addAttribute("countM", countM);
		
		model.addAttribute("rcpTit", rcpTit);
		model.addAttribute("rcpMat", rcpMat);
		
		return "/homepage/SearchRecipe";
	}
	
	//������ ī�װ� ���� ī��Ʈ
	@RequestMapping("recipeCateCount.eat")
	public String recipeCateCount(String cate,Model model) {
		int CateCount =(Integer)sql.selectOne("recipe.cateCount",cate);
		model.addAttribute("CateCount",CateCount);
		return "/homepage/CateCount";
	}
	
	//������ ���
	@RequestMapping("recipeCreate.eat")
	public String recipeCreate(Model model) {
		int recipeCnum = sql.selectOne("recipe.recipeCnum");
		
		model.addAttribute("recipeCnum", recipeCnum);
		return "/homepage/recipeCreate";
	}
	
	//������ ��� pro ������
	@RequestMapping("recipeCreatePro.eat")
	public String recipeCreatePro(MultipartHttpServletRequest request, Model model, HttpSession session) throws Exception {
		request.setCharacterEncoding("UTF-8");
		recipeVO vo = new recipeVO();
		
		String admin = (String)session.getAttribute("loginID");
		String cate = request.getParameter("cate");
		String cnum = request.getParameter("cnum");
		String title = request.getParameter("title");
		String mate = request.getParameter("mate");
		String pro = request.getParameter("pro");
		
		vo.setCate(cate);
		vo.setCnum(cnum);
		vo.setTitle(title);
		vo.setMate(mate);
		vo.setPro(pro);

		//System.out.println(cate);
		//System.out.println(cnum);
		//System.out.println(title);
		//System.out.println(mate);
		//System.out.println(pro);
		
		//�̹���
		MultipartFile mf = request.getFile("main_name");
		String orgName = mf.getOriginalFilename();
	
		if(orgName != "") {
			String path = request.getRealPath("//resource//RecipeImages");
			String ext = orgName.substring(orgName.lastIndexOf('.'));
			sql.insert("recipeReview.imgCountInsert");
			int num = sql.selectOne("recipeReview.imgCount");
		
			
			String newName = "image"+num+ext;
			File copyFile = new File(path +"//"+ newName);
			mf.transferTo(copyFile);
			vo.setMain_name(newName);
		} else {
			vo.setMain_name("");
		}
		
		sql.insert("recipe.insert", vo);
		
		return "/homepage/recipeCreatePro";
	}
}