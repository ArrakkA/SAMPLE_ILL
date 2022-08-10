package cc.greenit.sample.controller;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.greenit.sample.service.MemberService;
import cc.greenit.sample.vo.LogMemDTO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	
	SHA256 sha256 = new SHA256();
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	private static final String SESSION_NAME = "SessionUser";
	private MemberService memberService;
	
	
	@Autowired
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	//로그인
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public HashMap<String, Object> doLogin(HttpServletRequest request 
										   ,HttpServletResponse response 
										   ,HttpSession session 
										   ,@RequestParam HashMap<String, Object> params
									       ) throws NoSuchAlgorithmException {
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		
		//파라미터에 pw 암호화 작업
		params.put("pw", sha256.encrypt(request.getParameter("pw")));
		
		try { 	
			//로그인 작업
			HashMap<String, Object> member = memberService.selectMember(params);
			
			
			//DB에 존재하지 않는 아이디,비번 일 경우 = null , 존재하면 패스
			if(member != null) {
				
				
				//세션 생성
				session.setAttribute(SESSION_NAME , member);
				result.put("code","0000");
				
				
			} else {
				
				//id pw 틀림
				result.put("code", "1111");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
			result.put("code","9999");
		}
		
		
		//코드 표시
		return result;
	}
	
	//로그아웃
	@ResponseBody
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String dologout(HttpServletRequest request
						   ,HttpServletResponse response
						   ,HttpSession session
						   ,Model model) {
		
		
		//결과값
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		
		//세션 조회
		session = request.getSession(false);
		
		//세션이 존재시 세션 삭제
		if(session != null) {
	
			session.invalidate();
			result.put("상태", "session 삭제");
			
		}
		
		
		model.addAttribute("result" , result);
		return "index";
	}
	
	//회원가입
	@ResponseBody
	@RequestMapping(value = "/join", method = {RequestMethod.POST, RequestMethod.GET})
	public HashMap<String, Object> doJoin(HttpServletRequest request
										  ,@RequestParam HashMap<String,Object> params) throws NoSuchAlgorithmException {
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		params.put("pw",sha256.encrypt(request.getParameter("pw")));
		
		
		String memNum = memberService.makeMemNum();
		params.put("num",memNum);
		
		
		try { 	
			
				int cnt =	memberService.insertMember(params);
			
			
			result.put("status", "성공");
			
		}catch(Exception e) {
			e.printStackTrace();
			
			result.put("status","실패");
		}
		
		return result;
	}
	
	//회원정보 업데이트
	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public HashMap<String, Object> doUpdate(HttpServletRequest request
											,@RequestParam HashMap<String, Object> params){
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		
		
		try {
			
			memberService.updateMember(params);
			result.put("status", "업데이트 성공");
			
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		
		
		
		
		return result; 
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
