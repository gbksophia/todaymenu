package eatoday.bean;

import java.io.IOException;
import eatoday.vo.memberVO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
@Controller
@RequestMapping("/loginpage/")

public class loginpage {
	private NaverLoginBO naverLoginBO;
	
	@Autowired
	private SqlSessionTemplate sql = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@RequestMapping("login.eat")
	public String login(Model model,HttpSession session, String gloginState, String gname, String gemail) {
		/*���̹����̵�� ���� URL�� �����ϱ� ���� naverLoginDOŬ������ getAuthorizationUrl�޼ҵ� ȣ��*/
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("���̹�:"+naverAuthUrl);
		
		model.addAttribute("url",naverAuthUrl);
		
		if(gloginState=="true") {
			System.out.println(gname);
			System.out.println(gemail);
		}
		
		return "/loginpage/login";
	}
	
		//ȸ������
		@RequestMapping("sign.eat")
		public String sign() {
				
		 return "/loginpage/sign";
	}
		
		//ȸ������ Pro
		@RequestMapping("signPro.eat")
		public String signPro(Model model,HttpServletRequest request,memberVO vo) throws Exception {
			String [] food = request.getParameterValues("food");
			request.setCharacterEncoding("EUC-KR");
			for (String val : food) {
				if(val.equals("kor")) {
					vo.setKor(5);
				} 
				if(val.equals("china")) {
					vo.setChina(5);
				}
				if(val.equals("japan")) {
					vo.setJapan(5);
				} 
				if(val.equals("european")) {
					vo.setEuropean(5);
				}
				if(val.equals("bunsig")) {
					vo.setBunsig(5);
				}
				if(val.equals("cafe")) {
					vo.setCafe(5);
				}
				
				if(val.equals("fm") || val.equals("ff")) {
					vo.setEtc(5);
				}
			}
			sql.insert("member.insert",vo);
		 return "/loginpage/signPro";
	}
}
