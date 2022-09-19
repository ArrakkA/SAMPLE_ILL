package cc.greenit.sample.controller;

import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.greenit.sample.global.Globals;
import cc.greenit.sample.service.SampleService;

@Controller
@RequestMapping("/sample")
public class SampleController {
	
	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
	private SampleService sampleService;
	@Autowired
	public SampleController(SampleService sampleService) {
		this.sampleService = sampleService;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale
					   ,Model model 
					   ,HttpServletRequest request
					   ,HttpSession session) {
		
		//session 존재시 아이디 확인 
		HashMap<String, Object> member = (HashMap<String, Object>) session.getAttribute(Globals.SESSION_NAME);
		if(member == null) {
			return "index";
		}
		return "home";
		
	}
	@GetMapping(value ="/")
	public String index(Locale locale, Model model) {
		return "index";
	}
	@GetMapping(value = "/login")
	public String login(Locale locale, Model model) {
		return "login";
	}
	@GetMapping(value = "/join")
	public String wellcome(Locale locale, Model model) {
		return "join";
	}
	@GetMapping(value = "/test")
	public String test1(Locale locale, Model model) {
		return "test";
	}
	@GetMapping(value = "/test2")
	public String test2(Locale locale, Model model) {
		return "test2";
	}
	@GetMapping(value = "/popup")
	public String popup(Locale locale, Model model) {
		return "popup";
	}
	@GetMapping(value = "/mypage")
	@SuppressWarnings("unchecked")
	public String mypage(Locale locale
			    		 ,Model model
			    		 ,HttpServletRequest request
						 ,HttpSession session) {
		//session 존재시 아이디 확인
		HashMap<String, Object> member = (HashMap<String, Object>) session.getAttribute(Globals.SESSION_NAME);

		if(member == null) {
			return "index";	
		}
		model.addAttribute("user", member);
		return "mypage";
	}
	@GetMapping(value = "/userEdit")
	public String userEdit(Locale locale, Model model) {
		return "useredit";
	}
	@GetMapping(value ="/calendar")
	public String getCalendar(Model model) {
		return "calendar";
	}
}
