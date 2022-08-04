package cc.greenit.sample.controller;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.greenit.sample.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	
	SHA256 sha256 = new SHA256();
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private MemberService memberService;
	
	@Autowired
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public HashMap<String, Object> doLogin(HttpServletRequest request, HttpServletResponse response) throws NoSuchAlgorithmException {
		HashMap<String, Object> params = new HashMap<String, Object>();
		HashMap<String, Object> result = new HashMap<String, Object>();
		params.put("id", request.getParameter("id"));
		params.put("pw", sha256.encrypt(request.getParameter("pw")));
		
		try { 	
			
			HashMap<String, Object> member = memberService.selectMember(params);
			
			if(member != null) {
				result.put("code","0000");
			} else {
				result.put("code", "1111");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
			result.put("code","9999");
		}
		
		

		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/join", method = {RequestMethod.POST, RequestMethod.GET})
	public HashMap<String, Object> doJoin(HttpServletRequest request, @RequestParam HashMap<String,Object> params) throws NoSuchAlgorithmException {
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		params.put("pw",sha256.encrypt(request.getParameter("pw")));
		
		
		String memNum = memberService.makeMemNum();
		params.put("num",memNum);
		
		logger.info(sha256.encrypt(request.getParameter("pw")));
		logger.info("##########################", memNum);
		
		try { 	
			
				int cnt =	memberService.insertMember(params);
			
			
			result.put("status", "성공");
			
		}catch(Exception e) {
			e.printStackTrace();
			
			result.put("status","실패");
		}
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
