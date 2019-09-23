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
import eatoday.vo.restaurantReviewVO;
import eatoday.vo.restaurantVO;

@Controller
@RequestMapping("/restaurant/")
public class Restaurant {
	
	@Autowired
	private SqlSessionTemplate sql = null;
	
	// 레스토랑 리스트 페이지
	@RequestMapping("restaurantList.eat")
	public String restaurantList(HttpServletRequest request, Model model) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String cate = request.getParameter("cate"); //카테고리명
		String area = request.getParameter("area"); //지역명
		List areaList = sql.selectList("restaurant.restArea", cate); //카테고리의 지역리스트 rvo
		int areaCnt = (Integer)sql.selectOne("restaurant.restAreaCnt", cate); //카테고리+지역 카운트 int
		  
		ArrayList ra = new ArrayList(); 
		ra.add(area);
		ra.add(cate);
		List raList = sql.selectList("restaurant.selectArea", ra); //카테고리+지역 검색결과 rvo
		System.out.println(cate+area);
		
		model.addAttribute("areaList", areaList);
		model.addAttribute("areaCnt", areaCnt);
		model.addAttribute("area", area);
		model.addAttribute("cate", cate);
		model.addAttribute("raList", raList);
		return "/restaurant/restaurantList";
	}
		
	// 레스토랑 가게 정보 페이지 
	@RequestMapping("restaurantDetail.eat")
	public String restaurantDetail(HttpServletRequest request, Model model,HttpSession session) {
		String cnum = request.getParameter("cnum");
		String cate = request.getParameter("cate");
		 
		// 로그인 중인 아이디가 존재 할떄 실행
		if(session.getAttribute("loginID")!=null  && cate!=null) {
		String id = (String)session.getAttribute("loginID");
			if(cate.equals("한식")) {
				sql.update("member.korCountUp",id); // 한식 카운트 증가
			} else if (cate.equals("중식")) {
				sql.update("member.chinaCountUp",id); // 중식 카운트 증가
			} else if (cate.equals("일식")) {
				sql.update("member.japanCountUp",id); // 일식 카운트 증가
			} else if (cate.equals("양식")) {
				sql.update("member.europeanCountUp",id); // 양식 카운트 증가
			} else if (cate.equals("분식")) {
				sql.update("member.bunsigCountUp",id); // 분식 카운트 증가
			} else if (cate.equals("카페")) {
				sql.update("member.cafeCountUp",id); // 카페 카운트 증가
			} else if (cate.equals("기타")) {
				sql.update("member.etcCountUp",id); // 기타 카운트 증가
			}
		}
		//리뷰 카운트
		int recount = (Integer)sql.selectOne("restaurantReview.count",cnum);
		 
		// 해당 레스토랑 정보
		restaurantVO rvo = sql.selectOne("restaurant.info",cnum);
		 
		//레스토랑 리뷰 가져오기
		int row = 10;  // 페이지에 보여줄 갯수
		String page = request.getParameter("page");
		 
		if (page == null) {
			page ="1";
		}
				 
		int currentPage = Integer.parseInt(page);   // 인트형으로 변환
		int startRow = (currentPage-1) * row +1;    // 각 페이지당 시작하는 번호 ex) row = 10일때 startRow = 1 , 11 , 21 ....
		int endRow = currentPage * row;    // 각 페이지당 끝나는 번호 ex) row = 10일때 startRow = 10 , 20, 30 ....
		Map pageList = new HashMap();     // sql 문에 보내주기 위해 생성
		 
		pageList.put("cnum", cnum);
		pageList.put("startRow",startRow);
		pageList.put("endRow",endRow);
		 
		// 레스토랑 리뷰 가져오기
		List revo = sql.selectList("restaurantReview.select",pageList);
		 
		// 페이지 계산
		int pageCount = recount / row + (recount % row == 0? 0:1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
		int endPage = startPage + pageBlock-1;
		if(endPage > pageCount) endPage = pageCount;
		 
		model.addAttribute("rvo",rvo);
		model.addAttribute("revo",revo);
		model.addAttribute("recount",recount);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("pageCount",pageCount);
		return "/restaurant/restaurantDetail";
	}
	
	//리뷰 카운트
	@RequestMapping("restaurantReviewCount.eat")
	public String restaurantReviewCount(String cnum,Model model) {
		int recount = (Integer)sql.selectOne("restaurantReview.count", cnum);
		model.addAttribute("recount",recount);
		return "/restaurant/reviewCount";
	}
	
	//리뷰 쓰기
	@RequestMapping("restaurantRePro.eat")
	public String restaurantRePro(MultipartHttpServletRequest request,Model model) throws Exception{
		request.setCharacterEncoding("UTF-8");
		MultipartFile mf = request.getFile("img");
		String orgName = mf.getOriginalFilename();
		restaurantReviewVO vo = new restaurantReviewVO();
		
		// 파일 유무 조건
		if(orgName != "") {   // 파일이 존재할 때 실행
			//이미지 업로드
			String path = request.getRealPath("//resource//RestaurantReview");
			String ext = orgName.substring(orgName.lastIndexOf('.'));
			sql.insert("restaurantReview.imgCountInsert");  // 이미지 숫자 증가
			int num = sql.selectOne("restaurantReview.imgCount"); // 이미지 숫자 가져오기
				
			String newName = "image"+num+ext;
			File copyFile = new File(path +"//"+ newName);
			mf.transferTo(copyFile);  // 이미지 저장
			
			vo.setImg(newName);
		} else {
			vo.setImg("");
		}
		
		// 댓글 db 정보
		String cnum = request.getParameter("cnum");
		String id = request.getParameter("id");
		String nick = request.getParameter("nick");
		String text = request.getParameter("text");
		String cate = request.getParameter("cate");
		
		if(nick.equals("")) {
			nick = "익명";
		}

		vo.setCnum(cnum);
		vo.setId(id);
		vo.setNick(nick);
		vo.setText(text);
		sql.insert("restaurantReview.insert",vo);
		
		return "/restaurant/restaurantDetail";
		}
	
	//리뷰 수정
	@RequestMapping("restaurantReviewUpdate.eat")
	public String reviewUpdate(restaurantReviewVO vo,Model model) {
		sql.update("restaurantReview.update",vo);
		String text = sql.selectOne("restaurantReview.text", vo.getNum()); // 변경된 내용 가져오기
		model.addAttribute("text",text);
		return "/restaurant/reviewUpdate";
	}
	
	//리뷰 삭제
	@RequestMapping("restaurantReviewRemove.eat")
	public String restaurantReviewRemove(int num) {
		sql.delete("restaurantReview.delete",num);
		return "/restaurant/reviewRemove";
	}
	
	// 페이지 첫 실행시만 사용 댓글 좋아요 클릭 여부 체크
	@RequestMapping("restaurantNice.eat")
	public String restaurantNice(restaurantReviewVO vo,Model model) {
		recipeReviewNiceVO nivo = new recipeReviewNiceVO();
		String likeImg;
		nivo.setRenum(vo.getNum());
		nivo.setId(vo.getId());
		int result = sql.selectOne("restaurantReview.check",nivo); // 좋아요 있으면 1 없으면 0 리턴
		if(result == 0) {  // 좋아요를 안눌렀을떄
			likeImg = "/eatoday/resource/images/like.png";
		} else { // 눌렀을떄
			likeImg = "/eatoday/resource/images/like2.png";
		}
		model.addAttribute("likeImg",likeImg);
		return "/restaurant/nice";
	}
	
	// 댓글 좋아요 클릭 이벤트
	@RequestMapping("restaurantNiceClick.eat")
	public String restaurantNiceClick(restaurantReviewVO vo,Model model) {
		recipeReviewNiceVO nivo = new recipeReviewNiceVO();
		String likeImg;
		nivo.setRenum(vo.getNum());
		nivo.setId(vo.getId());
		int result = sql.selectOne("restaurantReview.check",nivo); // 좋아요 있으면 1 없으면 0 리턴
		
		if(result == 0) {
			sql.insert("restaurantReview.niceInsert",nivo);  // 좋아요 DB에 저장
			likeImg = "/eatoday/resource/images/like2.png";  // 좋아요 했을 때 이미지
		} else {
			sql.delete("restaurantReview.niceDelete",nivo); // 좋아요 DB에서 삭제
			likeImg = "/eatoday/resource/images/like.png";  // 좋아요 안눌렀을때 이미지
		}
		model.addAttribute("likeImg",likeImg);
		return "/restaurant/niceClick";
	}
	
	// 좋아요 갯수 카운트
	@RequestMapping("restaurantNiceCountCheck.eat")
	public String restaurantNiceCountCheck(int renum,Model model) {
		int niceCountCheck = (Integer)sql.selectOne("restaurantReview.niceCount",renum);
		model.addAttribute("niceCountCheck",niceCountCheck);
		return "/restaurant/niceCountCheck";
	}
	
	// 사이드메뉴  카테고리 카운트
	@RequestMapping("restaurantCateCount.eat")
	public String restaurantCateCount(String cate,Model model) {
		int CateCount = sql.selectOne("restaurant.count",cate);
		model.addAttribute("CateCount", CateCount);
		return "/restaurant/CateCount";
	}
	
	//레스토랑 추가
	@RequestMapping("restaurantCreate.eat")
	public String restaurantCreate() {
		
		return "/restaurant/restaurantCreate";
	}
	
	
}