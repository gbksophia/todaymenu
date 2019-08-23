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

import eatoday.vo.TestVO;

@Controller
@RequestMapping("/csvtest/")
public class csvTest {
	
	@Autowired
	private SqlSessionTemplate sql = null;
	
	//http://localhost:8080/eatoday/csvtest/2bc.do
	@RequestMapping("2bc.do") //¿Ã∞≈æ»æ∏
	public String tbc(Model model, HttpServletRequest request) throws Exception {
		RConnection conn = new RConnection();
		REXP tbc = conn.eval("tbc <- read.csv('D:/R/2bc.csv')");
		RList list = tbc.asList();
		model.addAttribute("number",list.at(0).length());
		
		String [][] s = new String[list.size()][];
		for (int i=0; i<list.size(); i++) {
			s[i] = list.at(i).asStrings();
		}
		
		for (int i=0; i<list.size(); i++) {
			for(int j=0; j<list.at(0).length(); j++) {
				model.addAttribute("text", s[1][j]);
				model.addAttribute("mate", s[2][j]);
				model.addAttribute("pro", s[3][j]);
				System.out.println(s[1][j]);
			}
		}
		System.out.println("CSV -> JSP");
		
		conn.close();
		return "/csvtest/2bc";
	}
	
	//http://localhost:8080/eatoday/csvtest/csvdb.do
	@RequestMapping("csvdb.do")
	public String csvdb(HttpServletRequest request) throws Exception {
		try {
			request.setCharacterEncoding("UTF-8");
			TestVO tbcvo = new TestVO();
			RConnection conn = new RConnection();
			REXP tbc = conn.eval("tbc <- read.csv('D:/R/2bc_final.csv')");
			RList list = tbc.asList();
			
			String [][] s = new String[list.size()][];
			for (int i=0; i<list.size(); i++) {
				s[i] = list.at(i).asStrings();
			}
			
			for(int j=0; j<list.at(0).length(); j++) {
				tbcvo.setText(s[1][j]);
				tbcvo.setMate(s[2][j]);
				tbcvo.setPro(s[3][j]);
				sql.insert("eatoday.insert", tbcvo);
			}
			System.out.println("CSV -> SQL");

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/csvtest/csvdb";
	}
	
	//http://localhost:8080/eatoday/csvtest/showdb.do
	@RequestMapping("showdb.do")
	public String showdb(Model model, HttpServletRequest request) throws Exception {
		try {
			//TestVO tbcvo = new TestVO();
			int count = (Integer)sql.selectOne("eatoday.count");
			ArrayList tbc = new ArrayList();
			List tbcList = sql.selectList("eatoday.select");
			
			System.out.println(tbcList);

			model.addAttribute("tbcList", tbcList);
			model.addAttribute("count", count);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/csvtest/showdb";
	}
}



