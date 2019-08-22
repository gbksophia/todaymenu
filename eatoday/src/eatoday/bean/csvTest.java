package eatoday.bean;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/csvtest/")
public class csvTest {
	
	//http://localhost:8080/eatoday/csvtest/2bc.do
	@RequestMapping("2bc.do")
	public String tbc(Model model, HttpServletRequest request) throws Exception {
		RConnection conn = new RConnection();
		conn.eval("tbc <- read.csv('D:/R/2bc.csv')");
//		REXP tbc = conn.eval("tbc <- read.csv('D:/R/2bc.csv')");
//		RList list = x.asList();
		
//		String [][] s = new String[list.size()][]; //[...][] : 가변배열
//		for(int i=0; i<list.size(); i++) {
//			s[i] = list.at(i).asStrings();
//		}
//		for(int i=0; i<list.size(); i++) {
//			for(int j=0; j<list.at(0).length(); j++) {
//				System.out.print(s[i][j]+" ");
//			}
//			System.out.println();
//		}
		REXP ma = conn.eval("tbc$mate");
		String [] mat= ma.asStrings();
		
		List<String> mate= new ArrayList<String>();
		for (String mm : mat) {
			System.out.println(mm);
			mate.add(mm);
			model.addAttribute("mate", mate);
		}
		
		REXP te = conn.eval("tbc$text");
		String [] tex= te.asStrings();
		
		List<String> text= new ArrayList<String>();
		for (String tt : tex) {
			System.out.println(tt);
			text.add(tt);
			model.addAttribute("text", text);
		}


		
		conn.close();
		return "/csvtest/2bc";
	}
}
