package com.test.sts;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
@RequestMapping("/naverAPI/")
public class LoginController {
	private NaverLoginBO naverLoginBO;
	private String apiResult= null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@RequestMapping("index.eat")
	public String index() {
		return "/naverAPI/index";
	}
	
	//네이버 로그인 첫 화면 요청 메소드
	@RequestMapping("login.eat")
	public String login(Model model,HttpSession session) {
		/*네이버아이디로 인증 URL을 생성하기 위해 naverLoginDO클래스와 getAuthorizationUrl메소드 호출*/
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("네이버:"+naverAuthUrl);
		
		model.addAttribute("url",naverAuthUrl);
		return "/naverAPI/login";
	}
	
	//회원가입
		@RequestMapping("sign.eat")
		public String sign(Model model,HttpSession session) {
			String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
			
			model.addAttribute("url",naverAuthUrl);
			return "/naverAPI/login";
		}
	
	@RequestMapping("callback.eat")
	public String callback(Model model,@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException{
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 로그인 사용자 정보 읽어오기
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		model.addAttribute("result",apiResult);
		
		
		
		return "/naverAPI/naverSuccess";
	}
}
