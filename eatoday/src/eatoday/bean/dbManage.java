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
				rcpvo.setName(s[3][j]);
				rcpvo.setMate(s[4][j]);
				rcpvo.setPro(s[5][j]);
				sql.insert("eatoday.insert", rcpvo);
			}
			System.out.println("CSV -> DB");

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
}



