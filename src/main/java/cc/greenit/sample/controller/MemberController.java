package cc.greenit.sample.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.greenit.sample.global.Globals;
import cc.greenit.sample.service.MemberService;
import cc.greenit.sample.vo.ResponseResult;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	private MemberService memberService;
	
	
	@Autowired
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	//로그인
	@ResponseBody
	@PostMapping(value = "/login")
	public HashMap<String, Object> doLogin(HttpServletRequest request 
										   ,HttpServletResponse response 
										   ,HttpSession session 
										   ,@RequestParam HashMap<String, Object> params
									       ){
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		try {
			HashMap<String, Object> member = memberService.selectMember(params);
			//DB에 존재하지 않는 아이디,비번 일 경우 = null , 존재하면 패스
			if(member != null) {
				//세션 생성
				session.setAttribute(Globals.SESSION_NAME , member);
				result.put("code","0000");
			} else {
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
	@PostMapping(value = "/logout")
	public HashMap<String,Object> dologout(HttpServletRequest request
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
			result.put("status", "session delete");
		}
		return result;
	}
	
	//회원가입
	@ResponseBody
	@PostMapping(value = "/join")
	public HashMap<String, Object> doJoin(HttpServletRequest request
										  ,@RequestParam HashMap<String,Object> params){
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		String memNum = memberService.makeMemNum();
		params.put("num",memNum);
		try { 	
			int cnt =	memberService.insertMember(params);
			result.put("code", "0000");
		}catch(Exception e) {
			e.printStackTrace();
			
			result.put("code","9999");
		}
		return result;
	}
	
	//회원정보 업데이트
	@ResponseBody
	@PostMapping(value = "/update")
	public HashMap<String, Object> doUpdate(HttpServletRequest request,@RequestParam HashMap<String, Object> params){
		HashMap<String, Object> result = new HashMap<String, Object>();
		try {
			memberService.updateMember(params);
			result.put("status", "success");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result; 
	}
	//내정보 가져오기
	@ResponseBody
	@PostMapping(value = "/getMemberInfo")
	public ResponseResult getMemberInfo(HttpServletRequest request,HttpSession session){
		ResponseResult result = new ResponseResult();
		
		try {
			@SuppressWarnings("unchecked")
			HashMap<String, Object> member = (HashMap<String, Object>) session.getAttribute(Globals.SESSION_NAME);
			result.setData(member);
			result.setCode("0000");
			
		}catch(Exception e) {
			e.printStackTrace();
			result.setCode("9999");
			result.setMessage("error");
		}
		return result;
	}
	
	@ResponseBody
	@PostMapping(value = "/chkIdOverlap")
	public ResponseResult chkIdOverlap(HttpSession session, @RequestParam("memId")String memId){
		ResponseResult result = new ResponseResult();
		
		
		
		try {
			String member = memberService.chkIdOverlap(memId);
			
			if(member != null) {
				result.setCode("1111");
				result.setMessage("id exist");
			}else if(member == null){
				result.setCode("0000");
				result.setMessage("id not exist");
			}
		}catch(Exception e) {
			e.printStackTrace();
			result.setCode("9999");
			result.setMessage("error");
		}
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
