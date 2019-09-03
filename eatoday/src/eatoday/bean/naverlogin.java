package eatoday.bean;


import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
@RequestMapping("/naver/")
public class naverlogin {
	private NaverLoginBO naverLoginBO;
	private String apiResult= null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@RequestMapping("index.do")
	public String index() {
		return "/loginpage/index";
	}
	
	
	@RequestMapping("callback.eat")
	public String callback(Model model,@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException{
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 로그인 사용자 정보 읽어오기
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		model.addAttribute("result",apiResult);
		
		
		
		return "/loginpage/naverSuccess";
	}
}
