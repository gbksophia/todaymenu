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
	@RequestMapping("2bc.do")
	public String tbc(Model model, HttpServletRequest request) throws Exception {
		RConnection conn = new RConnection();
		REXP tbc = conn.eval("tbc <- read.csv('D:/R/2bc.csv')");
		
//		REXP te = conn.eval("tbc$text");
//		String [] tex= te.asStrings();
//		List<String> text= new ArrayList<String>();
//		for (String tt : tex) {
//			System.out.println(tt);
//			text.add(tt);
//			model.addAttribute("text", text);
//		}
		
//		REXP ma = conn.eval("tbc$mate");
//		String [] mat= ma.asStrings();
//		List<String> mate= new ArrayList<String>();
//		for (String mm : mat) {
//			System.out.println(mm);
//			mate.add(mm);
//			model.addAttribute("mate", mate);
//		}

		RList list = tbc.asList();
		model.addAttribute("number",list.at(0).length());
				
		for (int i=0; i<list.at(0).length()+1; i++) {
			REXP te = conn.eval("tbc$text["+i+"]");
			String [] tex= te.asStrings();
			List<String> text= new ArrayList<String>();
			for (String tt : tex) {
				System.out.println(tt);
				text.add(tt);
				model.addAttribute("text", text);
			}
			
			REXP ma = conn.eval("tbc$mate["+i+"]");
			String [] mat= ma.asStrings();
			List<String> mate= new ArrayList<String>();
			for (String mm : mat) {
				System.out.println(mm);
				mate.add(mm);
				model.addAttribute("mate", mate);
			}
			
			REXP p = conn.eval("tbc$pro["+i+"]");
			String [] pr= p.asStrings();
			List<String> pro= new ArrayList<String>();
			for (String pp : pr) {
				System.out.println(pp);
				pro.add(pp);
				model.addAttribute("pro", pro);
			}
			System.out.println();
		}
		
		conn.close();
		return "/csvtest/2bc";
	}
	
	//http://localhost:8080/eatoday/csvtest/csvdb.do
	@RequestMapping("csvdb.do")
	public String csvdb() throws Exception {
		TestVO tbcvo = new TestVO();
		RConnection conn = new RConnection();
		try {
			REXP tbc = conn.eval("tbc <- read.csv('D:/R/2bc.csv')");
			RList list = tbc.asList();
					
			for (int i=0; i<list.at(0).length()+1; i++) {
				REXP te = conn.eval("tbc$text["+i+"]");
				String [] tex= te.asStrings();
				List<String> text= new ArrayList<String>();
				for (String tt : tex) {
					System.out.println(tt);
					text.add(tt);
					tbcvo.setText(tt);
				}
				
				REXP ma = conn.eval("tbc$mate["+i+"]");
				String [] mat= ma.asStrings();
				List<String> mate= new ArrayList<String>();
				for (String mm : mat) {
					System.out.println(mm);
					mate.add(mm);
					tbcvo.setMate(mm);
				}
				
				REXP p = conn.eval("tbc$pro["+i+"]");
				String [] pr= p.asStrings();
				List<String> pro= new ArrayList<String>();
				for (String pp : pr) {
					System.out.println(pp);
					pro.add(pp);
					tbcvo.setPro(pp);
				}
				System.out.println();
				sql.insert("eatoday.insert", tbcvo);
			}
			
		conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/csvtest/csvdb";
	}
}










