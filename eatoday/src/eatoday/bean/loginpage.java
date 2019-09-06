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
	private String apiResult= null;
	
	@RequestMapping("login.eat")
	public String login(Model model,HttpSession session) {
		/*���̹����̵�� ���� URL�� �����ϱ� ���� naverLoginDOŬ������ getAuthorizationUrl�޼ҵ� ȣ��*/
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		model.addAttribute("url",naverAuthUrl);
		
		return "/loginpage/login";
	}
	
	// �α��� Pro
	@RequestMapping("loginPro.eat")
	public String loginPro(Model model,HttpSession session,memberVO vo) {
		int result = sql.selectOne("member.loginCheck",vo);
		if(result ==1) {
			session.setAttribute("loginID", vo.getId());
		}
		
		model.addAttribute("result",result);
		model.addAttribute("id",vo.getId());
		return "/loginpage/loginPro";
	}
	
		//ȸ������ ��
		@RequestMapping("sign.eat")
		public String sign() {
		 return "/loginpage/sign";
	}
		
		//ȸ������ Pro
		@RequestMapping("signPro.eat")
		public String signPro(Model model,HttpServletRequest request,memberVO vo) throws Exception {
			//String id = request.getParameter("id");
			//String pw = request.getParameter("pw");
			//int social=Integer.parseInt(request.getParameter("social"));
			String [] food = request.getParameterValues("food");
			int result = sql.selectOne("member.idCheck",vo.getId());
			
			// �ߺ� Ȯ��
			if (result==0) {

			if(food != null) {
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
		}
			sql.insert("member.insert",vo);
		} 
		model.addAttribute("result",result);			
		model.addAttribute("vo",vo);	
		//model.addAttribute("sid",sid);
		//model.addAttribute("spw",spw);
		//model.addAttribute("social",social);
		 return "/loginpage/signPro";
	}
	// ���̹� �ݹ�
	@RequestMapping("callback.eat")
	public String callback(Model model,@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException{
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// �α��� ����� ���� �о����
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		model.addAttribute("result",apiResult);
			
		return "/loginpage/naverSuccess";
		}
	
	@RequestMapping("Foodselect.eat")
	public String Foodselect(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		model.addAttribute("id",id);
		model.addAttribute("pw",pw);
		return "loginpage/Foodselect";
	}
	
	@RequestMapping("CheckSocial.eat")
	public String CheckSocial(HttpServletRequest request, Model model, memberVO vo) {
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		System.out.println(id);
		System.out.println(pw);
		model.addAttribute("id",id);
		model.addAttribute("pw",pw);
		int result = sql.selectOne("member.idCheck",id);
		System.out.print(result);
		model.addAttribute("result",result);	
		return "loginpage/CheckSocial";
	}
}
