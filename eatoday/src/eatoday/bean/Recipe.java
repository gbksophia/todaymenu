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
		
		
		String cate = request.getParameter("cate");  // 카테고리 값 가져오기
		String cateImg = sql.selectOne("recipe.cateImg",cate); // 카테고리에 해당하는 랜덤 이미지 가져오기
		
		int count = sql.selectOne("recipe.cateCount",cate); // 레시피 갯수 (페이지 기능)
			
		
		//레시피 페이지 나누기
		int row = 28;   // 한페이지당 보여줄 갯수
		String page = request.getParameter("page");  //현재 페이지
			
			if (page == null) {
				page ="1";
			}
			
		int currentPage = Integer.parseInt(page);   // 인트형으로 변환
		int startRow = (currentPage-1) * row +1;    // 각 페이지당 시작하는 번호 ex) row = 10일때 startRow = 1 , 11 , 21 ....
		int endRow = currentPage * row;    // 각 페이지당 끝나는 번호 ex) row = 10일때 startRow = 10 , 20, 30 ....
		Map pageList = new HashMap();     // sql 문에 보내주기 위해 생성
		
		// sql 문에 필요한 값 
		pageList.put("cate", cate);
		pageList.put("startRow",startRow);
		pageList.put("endRow",endRow);
		
		
		// 레시피 리스트 가져오기
		List rcpList = sql.selectList("recipe.select",pageList);
				
		// 페이지 계산
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
		
		// 카테고리 값과 레시피 번호 설정
		String cate = vo.getCate();
		String cnum = vo.getCnum();
		
		
		// 로그인 중 일때만 실행
		if (session.getAttribute("loginID") != null && cate!=null) {
		String id = (String)session.getAttribute("loginID");
		
		// 카테고리 카운트 증가
		if(cate.equals("1") ) {
			sql.update("member.riceCountUp",id); // 밥 레시피 카운트값 증가
			
		} else if (cate.equals("2") ||cate.equals("3")) {
			sql.update("member.soupCountUp",id); // 국 & 찌개 관련 레시피 카운트값 증가
			
		}  else if (cate.equals("4") ||cate.equals("5") ||cate.equals("6") 
			||cate.equals("7") ||cate.equals("9") ||cate.equals("10")) {
			sql.update("member.sideCountUp",id); // 반찬 관련 레시피 카운트값 증가
			
		}  else if (cate.equals("11")) {
			sql.update("member.dosiCountUp",id); //  도시락 레시피 카운트값 증가
			
		}  else if (cate.equals("13") ||cate.equals("16")) {
			sql.update("member.noodleCountUp",id); // 면 관련 레시피 카운트값 증가
			
		}  else if (cate.equals("14")) {
			sql.update("member.saladCountUp",id);  // 샐러드 레시피 카운트 값 증가
			
		}  else if (cate.equals("12") ||cate.equals("15") || cate.equals("17") 
				||cate.equals("18") || cate.equals("19") ||cate.equals("20")) {
			sql.update("member.dessertCountUp",id); // 간식 관련 레시피 카운트 값 증가
			
		}  else if (cate.equals("21") ||cate.equals("22")) {
			sql.update("member.drinkCountUp",id);  // 마실것 관련 레시피 카운트값 증가
		
		}  else if (cate.equals("8") ||cate.equals("23")) {
			sql.update("member.holiCountUp",id); // 명절/손님상 관련 레시피 카운트값증가
		}
		
		//관심 있는 레시피 보여주기
		int like = sql.selectOne("recipe.greatest",id); // 카테고리중  컬럼의 값이 높은것 찾기
		List recipeList = sql.selectList("recipe.cate",like); //  위 값에 일치하는 카테고리값 찾기
		
		
		// 선호 레시피종류가 중복일 경우 선호레시피를 랜덤으로 검색				
		int rand = (int)(Math.random()*recipeList.size());
		String like_cate = (String)recipeList.get(rand);
		Map<String,String> like_parameter = new HashMap<String, String>();
		
		if(like_cate.equals("RICE")) {    // 선택된것이 밥일때 밥과 관련있는 번호 선택
			like_parameter.put("key1","1");
		} else if (like_cate.equals("SOUP") || like_cate.equals("JEONGOL")) { // 선택된것이 국일때 국과 관련있는 번호 선택
			like_parameter.put("key1","2");
			like_parameter.put("key2","3");
		}  else if (like_cate.equals("SIDE")  || like_cate.equals("SHAKE")  || like_cate.equals("GUI")
				 || like_cate.equals("JJIM")  || like_cate.equals("CHILDREN")  || like_cate.equals("KIMCHI"))  // 선택된것이 반찬일때 반찬과 관련있는 번호 선택
		{
			like_parameter.put("key1","4");
			like_parameter.put("key2","5");
			like_parameter.put("key3","6");
			like_parameter.put("key4","7");
			like_parameter.put("key5","9");
			like_parameter.put("key6","10");
			
		}  else if (like_cate.equals("DOSI")) { // 선택된것이 도시락일때 도시락과 관련있는 번호 선택
			like_parameter.put("key1","11");
			
		}  else if (like_cate.equals("NOODLE") || like_cate.equals("SPA") ) { // // 선택된것이 면일때 면과 관련있는 번호 선택
			like_parameter.put("key1","13");
			like_parameter.put("key2","16");
		}  else if (like_cate.equals("SALAD")) {  // 선택된것이 샐러드일때 샐러드와 관련있는 번호 선택
			like_parameter.put("key1","14");
			
		}  else if (like_cate.equals("SNACK")  || like_cate.equals("FRY")  || like_cate.equals("TOAST")
				 || like_cate.equals("BAKING")  || like_cate.equals("DESSERT")) { // 선택된것이 간식일때 간식과 관련있는 번호 선택
			like_parameter.put("key1","12");
			like_parameter.put("key2","15");
			like_parameter.put("key3","17");
			like_parameter.put("key4","18");
			like_parameter.put("key5","19");
			like_parameter.put("key6","20");
		}  else if (like_cate.equals("JUICE") || like_cate.equals("COCKTAIL")) { // 선택된것이 음료일때 음료와 관련있는 번호 선택
			like_parameter.put("key1","21");
			like_parameter.put("key2","22");
		}  else if (like_cate.equals("GUEST") || like_cate.equals("HOLIDAY")) { // 선택된것이 명절상일때 명절상과 관련있는 번호 선택
			like_parameter.put("key1","8");
			like_parameter.put("key2","23");;
		}
		
		recipeList = sql.selectList("recipe.memRandomSelect",like_parameter);
		model.addAttribute("recipeList",recipeList);
	}
		// 페이지 관련 레시피 보여주기 
		List randomList = sql.selectList("recipe.randomSelect",vo);
		
		//리뷰 카운트
		int recount = sql.selectOne("recipeReview.count",cnum);

		// 해당 레시피 정보
	    vo = sql.selectOne("recipe.info",cnum);
		String [] pro = vo.getPro().split("next"); // 조리법 분리
		int proCount = pro.length; // for문 돌릴값
		// 레시피 해당 이미지 set
		List ivo = sql.selectList("recipe.imgselect", cnum);
		
		//레시피 리뷰 페이지 나누기
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
		
		// 페이지 계산
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
	
	//리뷰 카운트
	@RequestMapping("reviewCount.eat")
	public String reviewCount(String cnum,Model model) {
		int recount = (Integer)sql.selectOne("recipeReview.count", cnum);
		model.addAttribute("recount",recount);
		return "/homepage/reviewCount";
	}
	
	//리뷰 쓰기
	@RequestMapping("recipeRePro.eat")
	public String recipeRePro(MultipartHttpServletRequest request,Model model) throws Exception{
		request.setCharacterEncoding("UTF-8");
		MultipartFile mf = request.getFile("img");
		String orgName = mf.getOriginalFilename();
		recipeReviewVO vo = new recipeReviewVO();
		
		// 이미지 유무 조건
		if(orgName != "") {
		//이미지 업로드
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
		
		// 댓글 db 정보
		String cnum = request.getParameter("cnum");
		String id = request.getParameter("id");
		String nick = request.getParameter("nick");
		String text = request.getParameter("text");
		String cate = request.getParameter("cate");
		
		// 닉이 빈칸일 때 익명 으로 설정
		if(nick.equals("")) {
			nick = "익명";
		}
		
		vo.setCnum(cnum);
		vo.setId(id);
		vo.setNick(nick);
		vo.setText(text);
		
		sql.insert("recipeReview.insert",vo);
			return "/homepage/recipeRePro";
		}
	
	//리뷰 수정
	@RequestMapping("reviewUpdate.eat")
	public String reviewUpdate(recipeReviewVO vo,Model model) {
		sql.update("recipeReview.update",vo);
		String text = sql.selectOne("recipeReview.text", vo.getNum());
		model.addAttribute("text",text);
		return "/homepage/reviewUpdate";
	}
	
	//리뷰 삭제
	@RequestMapping("reviewRemove.eat")
	public String reviewRemove(int num) {
		sql.delete("recipeReview.delete",num);
		return "/homepage/reviewRemove";
	}
	
	// 페이지 첫 실행시만 사용 댓글 좋아요 클릭 여부 체크
	@RequestMapping("nice.eat")
	public String nice(recipeReviewVO vo,Model model) {
		recipeReviewNiceVO nivo = new recipeReviewNiceVO();
		String likeImg;   // 이미지 이름 넣을 값
		nivo.setRenum(vo.getNum());
		nivo.setId(vo.getId());
		int result = sql.selectOne("recipeReview.check",nivo);
		if(result == 0) {
			likeImg = "/eatoday/resource/images/like.png"; // 좋아요를 안눌렀을때 이미지
		} else {
			likeImg = "/eatoday/resource/images/like2.png"; // 좋아요를 눌렀을때 이미지
		}
		model.addAttribute("likeImg",likeImg);
		return "/homepage/nice";
	}
	
	// 댓글 좋아요 클릭 이벤트
	@RequestMapping("niceClick.eat")
	public String niceClick(recipeReviewVO vo,Model model) {
		recipeReviewNiceVO nivo = new recipeReviewNiceVO();
		String likeImg;
		nivo.setRenum(vo.getNum());
		nivo.setId(vo.getId());
		int result = sql.selectOne("recipeReview.check",nivo);
		if(result == 0) { //값이 없을떄
			sql.insert("recipeReview.niceInsert",nivo);   // 좋아요 추가
			likeImg = "/eatoday/resource/images/like2.png"; // 좋아요를 눌렀을때 이미지
		} else {
			sql.delete("recipeReview.niceDelete",nivo); //좋아요 삭제
			likeImg = "/eatoday/resource/images/like.png"; // 좋아요를 안눌렀을때 이미지
		}
		model.addAttribute("likeImg",likeImg);
		return "/homepage/niceClick";
	}
	
	// 좋아요 갯수 카운트
	@RequestMapping("niceCountCheck.eat")
	public String niceCount(int renum,Model model) {
		int niceCountCheck = (Integer)sql.selectOne("recipeReview.niceCount",renum);
		model.addAttribute("niceCountCheck",niceCountCheck);
		return "/homepage/niceCountCheck";
	}
	
	// index.jsp에서 검색한 결과 표시 - map_kwd.jsp included
	@RequestMapping("searchResult.eat")
	public String searchResult(HttpServletRequest request, Model model) {
		return "/homepage/searchResult";
	}
	
	
	
	//레시피 검색
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
	
	//레시피 카테고리 갯수 카운트
	@RequestMapping("recipeCateCount.eat")
	public String recipeCateCount(String cate,Model model) {
		int CateCount =(Integer)sql.selectOne("recipe.cateCount",cate);
		model.addAttribute("CateCount",CateCount);
		return "/homepage/CateCount";
	}
	
	//레시피 등록
	@RequestMapping("recipeCreate.eat")
	public String recipeCreate(Model model) {
		int recipeCnum = sql.selectOne("recipe.recipeCnum");
		
		model.addAttribute("recipeCnum", recipeCnum);
		return "/homepage/recipeCreate";
	}
	
	//레시피 등록 pro 페이지
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
		
		//이미지
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