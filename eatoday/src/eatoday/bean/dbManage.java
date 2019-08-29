package eatoday.bean;

import java.util.ArrayList;
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

import eatoday.vo.dbManageVO;
import eatoday.vo.restaurantVO;

@Controller
@RequestMapping("/csvtest/")
public class dbManage {
	
	@Autowired
	private SqlSessionTemplate sql = null;
	
	//http://localhost:8080/eatoday/csvtest/csvdb.eat
	@RequestMapping("csvdb.eat")
	public String csvdb(HttpServletRequest request) throws Exception {
		try {
			request.setCharacterEncoding("UTF-8");
			dbManageVO rcpvo = new dbManageVO();
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
				rcpvo.setName(s[3][j]);
				rcpvo.setMate(s[4][j]);
				rcpvo.setPro(s[5][j]);
				sql.insert("eatoday.insert", rcpvo);
			}
			System.out.println("recipe CSV -> DB");

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/csvtest/csvdb";
	}
	
	//http://localhost:8080/eatoday/csvtest/showdb.eat
	@RequestMapping("showdb.eat")
	public String showdb(Model model, HttpServletRequest request) throws Exception {
		try {
			int count = (Integer)sql.selectOne("eatoday.count");
			int rowCount = (Integer)sql.selectOne("eatoday.rowCount");
			ArrayList rcp = new ArrayList();
			List rcpList = sql.selectList("eatoday.select");
			
			System.out.println(count);
			//System.out.println(rcpList);

			model.addAttribute("recipeList", rcpList);
			model.addAttribute("count", count);
			model.addAttribute("rowCount", rowCount);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/csvtest/showdb";
	}
	
	//http://localhost:8080/eatoday/csvtest/restdb.eat
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
				//restVO.setCnum(s[0][j]);
				restVO.setStore(s[1][j]);
				restVO.setArea1(s[2][j]);
				restVO.setArea2(s[3][j]);
				restVO.setAddr(s[4][j]);
				restVO.setTel(s[5][j]);
				restVO.setCate(s[6][j]);
				sql.insert("restaurant.insert", restVO);
				//System.out.println(s[2][j]);
			}
			System.out.println("restaurant CSV -> DB");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/csvtest/restdb";
	}
	
	//http://localhost:8080/eatoday/csvtest/showrest.eat
	@RequestMapping("showrest.eat")
	public String showrest(Model model, HttpServletRequest request) throws Exception {
		try {
			int count = (Integer)sql.selectOne("restaurant.count");
			ArrayList rest = new ArrayList();
			List restList = sql.selectList("restaurant.select");
			
			System.out.println(count);
			//System.out.println(rcpList);

			model.addAttribute("restList", restList);
			model.addAttribute("count", count);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/csvtest/showrest";
	}
	
	
}



