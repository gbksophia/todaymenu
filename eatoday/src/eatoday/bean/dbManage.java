package eatoday.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.rosuda.REngine.REXP;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import eatoday.vo.recipeImgVO;
import eatoday.vo.recipeVO;
import eatoday.vo.restaurantVO;

@Controller
@RequestMapping("/csvtodb/")
public class dbManage {
	
	@Autowired
	private SqlSessionTemplate sql = null;
	
	// ������ ����, �����̹����� recipe DB�� �Է�
	//http://localhost:8080/eatoday/csvtodb/recipedb.eat
	@RequestMapping("recipedb.eat")
	public String csvdb(HttpServletRequest request) throws Exception {
		try {
			request.setCharacterEncoding("UTF-8");
			recipeVO rcpvo = new recipeVO();
			RConnection conn = new RConnection();
			REXP tbc = conn.eval("tbc <- read.csv('D:/R/recipe.csv')");
			RList list = tbc.asList();
			
			String [][] s = new String[list.size()][];
			for (int i=0; i<list.size(); i++) {
				s[i] = list.at(i).asStrings();
			}
			
			for(int j=0; j<list.at(0).length(); j++) {
				rcpvo.setCate(s[1][j]);
				rcpvo.setCnum(s[2][j]);
				rcpvo.setMain_name(s[3][j]);
				rcpvo.setTitle(s[4][j]);
				rcpvo.setMate(s[5][j]);
				rcpvo.setPro(s[6][j]);
				sql.insert("recipe.insert", rcpvo);
			}
			System.out.println("recipe CSV -> DB");

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/csvtodb/recipedb";
	}
	
	// DB�� ������ ������ ����ϴ� �׽�Ʈ ������
	//http://localhost:8080/eatoday/csvtodb/showreci.eat
	@RequestMapping("showreci.eat")
	public String showdb(Model model, HttpServletRequest request) throws Exception {
		try {
			int count = (Integer)sql.selectOne("recipe.count");
			List rcpList = sql.selectList("recipe.select");
			System.out.println(count);

			model.addAttribute("recipeList", rcpList);
			model.addAttribute("count", count);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/csvtodb/showreci";
	}
	
	// ������ �������� DB�� �Է�
	//http://localhost:8080/eatoday/csvtodb/reciimg.eat
	@RequestMapping("reciimg")
	public String reciimg(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
			recipeImgVO rimgvo = new recipeImgVO();
			RConnection conn = new RConnection();
			REXP rimg = conn.eval("tbc <- read.csv('C:/recipe_img.csv')");
			RList list = rimg.asList();
			
			String [][] s = new String[list.size()][];
			for (int i=0; i<list.size(); i++) {
				s[i] = list.at(i).asStrings();
			}
			
			for(int j=0; j<list.at(0).length(); j++) {
				rimgvo.setCnum(s[1][j]);
				rimgvo.setImg1(s[2][j]);
				rimgvo.setImg2(s[3][j]);
				sql.insert("recipe.imginsert", rimgvo);
			}
			System.out.println("recipeIMG CSV -> DB");

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/csvtodb/reciimg";
	}
	
	// ������� ������ restaurant DB�� �Է�
	//http://localhost:8080/eatoday/csvtodb/restdb.eat
	@RequestMapping("restdb.eat")
	public String restdb(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
			restaurantVO restVO = new restaurantVO();
			RConnection conn = new RConnection();
			REXP rest = conn.eval("rest <- read.csv('D:/R/restaurant.csv')");
			RList list = rest.asList();
			
			String [][] s = new String[list.size()][];
			for (int i=0; i<list.size(); i++) {
				s[i] = list.at(i).asStrings();
			}
			
			for(int j=0; j<list.at(0).length(); j++) {
				restVO.setCnum(s[1][j]);
				restVO.setStore(s[2][j]);
				restVO.setArea1(s[3][j]);
				restVO.setArea2(s[4][j]);
				restVO.setAddr(s[5][j]);
				restVO.setTel(s[6][j]);
				restVO.setCate(s[7][j]);
				sql.insert("restaurant.insert", restVO);
			}
			System.out.println("restaurant CSV -> DB");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/csvtodb/restdb";
	}
	
	// DB�� ������� ������ ����ϴ� �׽�Ʈ ������ 
	//http://localhost:8080/eatoday/csvtodb/showrest.eat
	@RequestMapping("showrest.eat")
	public String showrest(Model model, HttpServletRequest request) throws Exception {
		try {
			int count = (Integer)sql.selectOne("restaurant.count");
			List restList = sql.selectList("restaurant.select");
			System.out.println(count);

			model.addAttribute("restList", restList);
			model.addAttribute("count", count);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/csvtodb/showrest";
	}
	
}



