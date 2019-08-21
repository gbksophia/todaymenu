package eatoday.bean;

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
	public String score(Model model, HttpServletRequest request) throws Exception {
		RConnection conn = new RConnection();

		REXP x = conn.eval("tbc <- read.csv('D:/R/2bc.csv')");
		RList list = x.asList();
		
		String [][] s = new String[list.size()][]; //[...][] : �����迭
		for(int i=0; i<list.size(); i++) {
			s[i] = list.at(i).asStrings();
		}
		
		for(int i=0; i<list.size(); i++) {
			for(int j=0; j<list.at(0).length(); j++) {
				System.out.print(s[i][j]+" ");
			}
			System.out.println();
		}
		
		

		int size = list.size();
		model.addAttribute("size", size);
		model.addAttribute("s",s);
		
		conn.close();
		return "/csvtest/2bc";
	}
}