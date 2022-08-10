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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.greenit.sample.service.SampleService;

@Controller
@RequestMapping("/sample")
public class SampleController {
	
	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
	private static final String SESSION_NAME = "SessionUser";
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
		
		//session이 존재하지 않을때
		session = request.getSession(false);
		
		if(session == null) {
			return "index";
			
		}
		
		//session 존재시 아이디 확인
		HashMap<String, Object> member = (HashMap<String, Object>) session.getAttribute(SESSION_NAME);
		
		if(member == null) {
			return "index";
		}
		
		
		return "home";
		
	}
	
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		return "login";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String wellcome(Locale locale, Model model) {
		return "join";
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Locale locale, Model model) {
		return "test";
	}
	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	public String reservation(Locale locale, Model model) {
		return "calendar";
	}
	
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage(Locale locale
			    		 ,Model model
			    		 ,HttpServletRequest request
						 ,HttpSession session) {
		
		session = request.getSession(false);
		
		if(session == null) {
			return "index";
			
		}
		
		//session 존재시 아이디 확인
		HashMap<String, Object> member = (HashMap<String, Object>) session.getAttribute(SESSION_NAME);
		
		if(member == null) {
			
			return "index";
			
		}
		
		
		model.addAttribute("user", member);
		return "mypage";
	}
	
	
	
	 
	@ResponseBody
	@RequestMapping(value = "/testDB", method = RequestMethod.GET)
	public HashMap<String, Object> testDB(HttpServletRequest request, HttpServletResponse response) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("aaa", "102");
		params.put("bbb", "TEST");
		
		HashMap<String, Object> result = sampleService.selectTest2(params);
		
		logger.info(result.get("CO_DIV").toString());
		logger.info(result.get("CO_NAME").toString());

		return result;
	}
		
}
