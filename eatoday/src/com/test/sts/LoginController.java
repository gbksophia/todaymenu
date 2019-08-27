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
	
	//���̹� �α��� ù ȭ�� ��û �޼ҵ�
	@RequestMapping("login.eat")
	public String login(Model model,HttpSession session) {
		/*���̹����̵�� ���� URL�� �����ϱ� ���� naverLoginDOŬ������ getAuthorizationUrl�޼ҵ� ȣ��*/
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("���̹�:"+naverAuthUrl);
		
		model.addAttribute("url",naverAuthUrl);
		return "/naverAPI/login";
	}
	
	//ȸ������
		@RequestMapping("sign.eat")
		public String sign(Model model,HttpSession session) {
			String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
			
			model.addAttribute("url",naverAuthUrl);
			return "/naverAPI/login";
		}
	
	@RequestMapping("callback.eat")
	public String callback(Model model,@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException{
		System.out.println("����� callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// �α��� ����� ���� �о����
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		model.addAttribute("result",apiResult);
		
		
		
		return "/naverAPI/naverSuccess";
	}
}
