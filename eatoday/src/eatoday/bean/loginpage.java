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
		/*네이버아이디로 인증 URL을 생성하기 위해 naverLoginDO클래스와 getAuthorizationUrl메소드 호출*/
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		model.addAttribute("url",naverAuthUrl);
		
		return "/loginpage/login";
	}
	
	// 로그인 Pro
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
	
		//회원가입 폼
		@RequestMapping("sign.eat")
		public String sign() {
		 return "/loginpage/sign";
	}
		
		//회원가입 Pro
		@RequestMapping("signPro.eat")
		public String signPro(Model model,HttpServletRequest request,memberVO vo) throws Exception {
			//String id = request.getParameter("id");
			//String pw = request.getParameter("pw");
			//int social=Integer.parseInt(request.getParameter("social"));
			String [] food = request.getParameterValues("food");
			int result = sql.selectOne("member.idCheck",vo.getId());
			
			// 중복 확인
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
	// 네이버 콜백
	@RequestMapping("callback.eat")
	public String callback(Model model,@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException{
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 로그인 사용자 정보 읽어오기
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
