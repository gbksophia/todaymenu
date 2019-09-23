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

import eatoday.vo.recipeImgVO;
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
		String cateImg = sql.selectOne("recipe.cateImg",cate ); // ī�װ��� �ش��ϴ� ���� �̹��� ��������

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
			return "/homepage/recipeDetail";
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
		return "/homepage/recipeDetail";
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
		return "/homepage/nice";
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
		pro = pro.replace("\r\n", "next");
		mate = mate.replace("\r\n", "next");
		
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
	
	@RequestMapping("recipeCreateDetail.eat")
	public String recipeCreateDetail(Model model) {
		int recipeCnum = sql.selectOne("recipe.recipeCnum");
		
		model.addAttribute("recipeCnum", recipeCnum);
		return "/homepage/recipeCreateDetail";
	}
	
	@RequestMapping("recipeCreateDetailPro.eat")
	public String recipeCreateDetailPro(MultipartHttpServletRequest request, Model model, HttpSession session) throws Exception {
		request.setCharacterEncoding("UTF-8");
		recipeImgVO vo = new recipeImgVO();
		
		String cnum = request.getParameter("cnum");
		vo.setCnum(cnum);
		//�̹���
		MultipartFile mf = request.getFile("img1");
		String orgName = mf.getOriginalFilename();
		
		MultipartFile mf2 = request.getFile("img2");
		String orgName1 = mf2.getOriginalFilename();

		if(orgName != "") {
			String path = request.getRealPath("//resource/RecipePro");
			String ext = orgName.substring(orgName.lastIndexOf('.'));
			sql.insert("recipeReview.imgCountInsert");
			int num = sql.selectOne("recipeReview.imgCount");
			
			String newName = "image"+num+ext;
			File copyFile = new File(path + "//" + newName);
			mf.transferTo(copyFile);
			vo.setImg1(newName);
		}
		
		if(orgName1 != "") {
			String path = request.getRealPath("//resource/RecipePro");
			String ext = orgName1.substring(orgName1.lastIndexOf('.'));
			sql.insert("recipeReview.imgCountInsert");
			int num = sql.selectOne("recipeReview.imgCount");
			
			String newName1 = "image"+num+ext;
			File copyFile = new File(path + "//" + newName1);
			mf2.transferTo(copyFile);;
			vo.setImg2(newName1);
		}
		
		else if (orgName1 == ""){
			vo.setImg2("noimage");
		}
		sql.insert("recipe.insertImg", vo);
		

		
		//�̹���
		MultipartFile mf3 = request.getFile("img3");
		String orgName2 = mf3.getOriginalFilename();
		
		MultipartFile mf4 = request.getFile("img4");
		String orgName3 = mf4.getOriginalFilename();

		recipeImgVO vo1 = new recipeImgVO();
		String cnum1 = request.getParameter("cnum");
		
			if(orgName2 != "") {

				
				vo1.setCnum(cnum1);
				String path = request.getRealPath("//resource/RecipePro");
				String ext = orgName2.substring(orgName2.lastIndexOf('.'));
				sql.insert("recipeReview.imgCountInsert");
				int num = sql.selectOne("recipeReview.imgCount");
				
				String newName2 = "image"+num+ext;
				File copyFile = new File(path + "//" + newName2);
				mf3.transferTo(copyFile);
				vo1.setImg1(newName2);
				if(orgName3 == "") {
				vo1.setImg2("noimage");
				sql.insert("recipe.insertImg1", vo1);
				}
				
			}
			
			else if(orgName2 == "") {
				System.out.println("����");
			}
			
			if(orgName3 != "") {

				vo1.setCnum(cnum1);
				String path = request.getRealPath("//resource/RecipePro");
				String ext = orgName3.substring(orgName3.lastIndexOf('.'));
				sql.insert("recipeReview.imgCountInsert");
				int num = sql.selectOne("recipeReview.imgCount");
				
				String newName3 = "image"+num+ext;
				File copyFile = new File(path + "//" + newName3);
				mf4.transferTo(copyFile);;
				vo1.setImg2(newName3);
				sql.insert("recipe.insertImg1", vo1);
			}
			else if(orgName3 == "") {
				System.out.println("����");
			}
			
			
			
			
			//�̹���
			MultipartFile mf5 = request.getFile("img5");
			String orgName4 = mf5.getOriginalFilename();
			
			MultipartFile mf6 = request.getFile("img6");
			String orgName5 = mf6.getOriginalFilename();

			
				if(orgName4 != "") {

					
					vo1.setCnum(cnum1);
					String path = request.getRealPath("//resource/RecipePro");
					String ext = orgName4.substring(orgName4.lastIndexOf('.'));
					sql.insert("recipeReview.imgCountInsert");
					int num = sql.selectOne("recipeReview.imgCount");
					
					String newName4 = "image"+num+ext;
					File copyFile = new File(path + "//" + newName4);
					mf5.transferTo(copyFile);
					vo1.setImg1(newName4);
					if(orgName5 == "") {
					vo1.setImg2("noimage");
					sql.insert("recipe.insertImg1", vo1);
					}
					
				}
				
				else if(orgName4 == "") {
					System.out.println("����");
				}
				
				if(orgName5 != "") {

					vo1.setCnum(cnum1);
					String path = request.getRealPath("//resource/RecipePro");
					String ext = orgName5.substring(orgName5.lastIndexOf('.'));
					sql.insert("recipeReview.imgCountInsert");
					int num = sql.selectOne("recipeReview.imgCount");
					
					String newName5 = "image"+num+ext;
					File copyFile = new File(path + "//" + newName5);
					mf6.transferTo(copyFile);;
					vo1.setImg2(newName5);
					sql.insert("recipe.insertImg1", vo1);
				}
				else if(orgName5 == "") {
					System.out.println("����");
				}
		
				//�̹���
				MultipartFile mf7 = request.getFile("img7");
				String orgName6 = mf7.getOriginalFilename();
				
				MultipartFile mf8 = request.getFile("img8");
				String orgName7 = mf8.getOriginalFilename();

					if(orgName6 != "") {

						
						vo1.setCnum(cnum1);
						String path = request.getRealPath("//resource/RecipePro");
						String ext = orgName6.substring(orgName6.lastIndexOf('.'));
						sql.insert("recipeReview.imgCountInsert");
						int num = sql.selectOne("recipeReview.imgCount");
						
						String newName6 = "image"+num+ext;
						File copyFile = new File(path + "//" + newName6);
						mf7.transferTo(copyFile);
						vo1.setImg1(newName6);
						if(orgName7 == "") {
						vo1.setImg2("noimage");
						sql.insert("recipe.insertImg1", vo1);
						}
						
					}
					
					else if(orgName6 == "") {
						System.out.println("����");
					}
					
					if(orgName7 != "") {

						vo1.setCnum(cnum1);
						String path = request.getRealPath("//resource/RecipePro");
						String ext = orgName7.substring(orgName7.lastIndexOf('.'));
						sql.insert("recipeReview.imgCountInsert");
						int num = sql.selectOne("recipeReview.imgCount");
						
						String newName7 = "image"+num+ext;
						File copyFile = new File(path + "//" + newName7);
						mf8.transferTo(copyFile);;
						vo1.setImg2(newName7);
						sql.insert("recipe.insertImg1", vo1);
					}
					else if(orgName7 == "") {
						System.out.println("����");
					}

		return "/homepage/recipeCreateDetailPro";
	}
	
	
	//������ ����
	@RequestMapping("recipeDelete.eat")
	public String recipeDelete(Model model,HttpSession session,String cnum,String cate) {
		String admin = (String)session.getAttribute("loginID");
		if(admin.equals("admin@eatoday.com")) {
			sql.delete("recipe.delete",cnum);
		}
		model.addAttribute("cate",cate);
		return "/homepage/recipeDetail";
	}
	
	@RequestMapping("recipeEdit.eat")
	public String recipeEdit(Model model,HttpSession session, String cnum, String cate, recipeVO vo ) {
		//String admin = (String)session.getAttribute("loginID");
		/*
		if(admin.equals("admin@eatoday.com")) {
			vo=sql.selectOne("recipe.info", cnum);
			model.addAttribute("vo", vo);
		}
		*/
		vo=sql.selectOne("recipe.info", cnum);
		
		String mate = vo.getMate().replace("next","");
		String pro = vo.getPro().replace("next","");
		
		
		model.addAttribute("vo", vo);
		model.addAttribute("mate", mate);
		model.addAttribute("pro", pro);
		model.addAttribute("cnum", cnum);
		return "/homepage/recipeEdit";
	}
	
	@RequestMapping("recipeEditPro")
	public String recipeEditPro(MultipartHttpServletRequest request, Model model, HttpSession session) throws Exception {
		//������ ���� pro ������
		request.setCharacterEncoding("UTF-8");
		recipeVO vo = new recipeVO();
			
		String admin = (String)session.getAttribute("loginID");
		String cate = request.getParameter("cate");
		String cnum = request.getParameter("cnum");
		String title = request.getParameter("title");
		String mate = request.getParameter("mate");
		String pro = request.getParameter("pro");
		pro = pro.replace("\r\n", "next");
		mate = mate.replace("\r\n", "next");
			
		vo.setCate(cate);
		vo.setCnum(cnum);
		vo.setTitle(title);
		vo.setMate(mate);
		vo.setPro(pro);

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
		sql.update("recipe.updateRecipe", vo);
		model.addAttribute("cnum", cnum);
		return "/homepage/recipeEditPro";
	}
	
	@RequestMapping("recipeEditDetail")
	public String recipeEditDetail() {	
		return "/homepage/recipeEditDetail";
	}
	
	@RequestMapping("recipeEditDetailPro")
	public String recipeEditDetailPro(MultipartHttpServletRequest request, Model model, HttpSession session) throws Exception {	
		request.setCharacterEncoding("UTF-8");
		recipeImgVO vo = new recipeImgVO();
		
		String cnum = request.getParameter("cnum");
		
		int ynImg=sql.selectOne("recipe.containImg", cnum);
		
		vo.setCnum(cnum);
		//�̹���
		MultipartFile mf = request.getFile("img1");
		String orgName = mf.getOriginalFilename();
		
		MultipartFile mf2 = request.getFile("img2");
		String orgName1 = mf2.getOriginalFilename();

		if(orgName != "") {
			String path = request.getRealPath("//resource/RecipePro");
			String ext = orgName.substring(orgName.lastIndexOf('.'));
			sql.insert("recipeReview.imgCountInsert");
			int num = sql.selectOne("recipeReview.imgCount");
			
			String newName = "image"+num+ext;
			File copyFile = new File(path + "//" + newName);
			mf.transferTo(copyFile);
			vo.setImg1(newName);
		}
		
		if(orgName1 != "") {
			String path = request.getRealPath("//resource/RecipePro");
			String ext = orgName1.substring(orgName1.lastIndexOf('.'));
			sql.insert("recipeReview.imgCountInsert");
			int num = sql.selectOne("recipeReview.imgCount");
			
			String newName1 = "image"+num+ext;
			File copyFile = new File(path + "//" + newName1);
			mf2.transferTo(copyFile);;
			vo.setImg2(newName1);
		}
		
		else if (orgName1 == ""){
			vo.setImg2("noimage");
		}
		sql.update("recipe.updateImg", vo);
		

		
		//�̹���
		MultipartFile mf3 = request.getFile("img3");
		String orgName2 = mf3.getOriginalFilename();
		
		MultipartFile mf4 = request.getFile("img4");
		String orgName3 = mf4.getOriginalFilename();

		recipeImgVO vo1 = new recipeImgVO();
		String cnum1 = request.getParameter("cnum");
		
			if(orgName2 != "") {

				
				vo1.setCnum(cnum1);
				String path = request.getRealPath("//resource/RecipePro");
				String ext = orgName2.substring(orgName2.lastIndexOf('.'));
				sql.insert("recipeReview.imgCountInsert");
				int num = sql.selectOne("recipeReview.imgCount");
				
				String newName2 = "image"+num+ext;
				File copyFile = new File(path + "//" + newName2);
				mf3.transferTo(copyFile);
				vo1.setImg1(newName2);
				if(orgName3 == "") {
				vo1.setImg2("noimage");
				sql.update("recipe.updateImg1", vo1);
				}
				
			}
			
			else if(orgName2 == "") {
				System.out.println("����");
			}
			
			if(orgName3 != "") {

				vo1.setCnum(cnum1);
				String path = request.getRealPath("//resource/RecipePro");
				String ext = orgName3.substring(orgName3.lastIndexOf('.'));
				sql.insert("recipeReview.imgCountInsert");
				int num = sql.selectOne("recipeReview.imgCount");
				
				String newName3 = "image"+num+ext;
				File copyFile = new File(path + "//" + newName3);
				mf4.transferTo(copyFile);;
				vo1.setImg2(newName3);
				sql.update("recipe.updateImg1", vo1);
			}
			else if(orgName3 == "") {
				System.out.println("����");
			}
			
			
			
			
			//�̹���
			MultipartFile mf5 = request.getFile("img5");
			String orgName4 = mf5.getOriginalFilename();
			
			MultipartFile mf6 = request.getFile("img6");
			String orgName5 = mf6.getOriginalFilename();

			
				if(orgName4 != "") {

					
					vo1.setCnum(cnum1);
					String path = request.getRealPath("//resource/RecipePro");
					String ext = orgName4.substring(orgName4.lastIndexOf('.'));
					sql.insert("recipeReview.imgCountInsert");
					int num = sql.selectOne("recipeReview.imgCount");
					
					String newName4 = "image"+num+ext;
					File copyFile = new File(path + "//" + newName4);
					mf5.transferTo(copyFile);
					vo1.setImg1(newName4);
					if(orgName5 == "") {
					vo1.setImg2("noimage");
					sql.update("recipe.updateImg1", vo1);
					}
					
				}
				
				else if(orgName4 == "") {
					System.out.println("����");
				}
				
				if(orgName5 != "") {

					vo1.setCnum(cnum1);
					String path = request.getRealPath("//resource/RecipePro");
					String ext = orgName5.substring(orgName5.lastIndexOf('.'));
					sql.insert("recipeReview.imgCountInsert");
					int num = sql.selectOne("recipeReview.imgCount");
					
					String newName5 = "image"+num+ext;
					File copyFile = new File(path + "//" + newName5);
					mf6.transferTo(copyFile);;
					vo1.setImg2(newName5);
					sql.update("recipe.updateImg1", vo1);
				}
				else if(orgName5 == "") {
					System.out.println("����");
				}
		
				//�̹���
				MultipartFile mf7 = request.getFile("img7");
				String orgName6 = mf7.getOriginalFilename();
				
				MultipartFile mf8 = request.getFile("img8");
				String orgName7 = mf8.getOriginalFilename();

					if(orgName6 != "") {

						
						vo1.setCnum(cnum1);
						String path = request.getRealPath("//resource/RecipePro");
						String ext = orgName6.substring(orgName6.lastIndexOf('.'));
						sql.insert("recipeReview.imgCountInsert");
						int num = sql.selectOne("recipeReview.imgCount");
						
						String newName6 = "image"+num+ext;
						File copyFile = new File(path + "//" + newName6);
						mf7.transferTo(copyFile);
						vo1.setImg1(newName6);
						if(orgName7 == "") {
						vo1.setImg2("noimage");
						sql.update("recipe.updateImg1", vo1);
						}
						
					}
					
					else if(orgName6 == "") {
						System.out.println("����");
					}
					
					if(orgName7 != "") {

						vo1.setCnum(cnum1);
						String path = request.getRealPath("//resource/RecipePro");
						String ext = orgName7.substring(orgName7.lastIndexOf('.'));
						sql.insert("recipeReview.imgCountInsert");
						int num = sql.selectOne("recipeReview.imgCount");
						
						String newName7 = "image"+num+ext;
						File copyFile = new File(path + "//" + newName7);
						mf8.transferTo(copyFile);;
						vo1.setImg2(newName7);
						sql.update("recipe.updateImg1", vo1);
					}
					else if(orgName7 == "") {
						System.out.println("����");
					}
		return "/homepage/recipeEditDetailPro";
	}
	
	
}