package cc.greenit.sample.controller;

import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.Cookie;
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
import org.springframework.web.util.WebUtils;

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
		String autoLoginChk = (String) params.get("autoLoginChk");
		try {
			int chkIdCnt = memberService.chkIdCnt(params);
			//DB에 존재하지 않는 아이디,비번 일 경우 = null , 존재하면 패스
			if(chkIdCnt == 1){
				//세션 생성
				HashMap<String, Object> member = memberService.selectMember(params);
				session.setAttribute(Globals.SESSION_NAME , member);
				result.put("code","0000");

				if(autoLoginChk.equals("Y")){
					//쿠키생성
					Cookie cookie = new Cookie("loginCookie", session.getId());
					cookie.setPath("/");
					int amount = 60 * 60 * 24* 7;
					cookie.setMaxAge(amount);
					response.addCookie(cookie);
					//DB에 들어갈 정보 생성
					Date sessionLimit = new Date(System.currentTimeMillis()+(1000*amount));
					HashMap<String, Object> autoLogin = new HashMap<String, Object>();
					autoLogin.put("sessionId", session.getId());
					autoLogin.put("limitDate", sessionLimit);
					autoLogin.put("id", member.get("MS_ID"));
					//세션정보 DB 저장
					memberService.autoLogin(autoLogin);
				}else{

				}
			} else if(chkIdCnt == 0) {
				result.put("code", "1111");
				//아이디 비번 틀림
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
		HashMap<String, Object> result = new HashMap<String, Object>();
		HashMap<String, Object> params = new HashMap<String, Object>();
		try{
			//세션 조회
			HashMap<String, Object> obj = (HashMap<String, Object>) session.getAttribute(Globals.SESSION_NAME);
			params.put("id", obj.get("id"));
			//세션이 존재시 세션 삭제
			if(obj != null) {
				session.removeAttribute(Globals.SESSION_NAME);
				session.invalidate();
				Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
				//쿠키정보 삭제
				if(loginCookie != null){
					loginCookie.setPath("/");
					loginCookie.setMaxAge(0);
					response.addCookie(loginCookie);

					Date date = new Date(System.currentTimeMillis());
					params.put("limitDate", date);
					params.put("sessionId", session.getId());
					memberService.autoLogin(params);
				}
				result.put("status", "session delete");
				result.put("code", "0000");
			}
		}catch (Exception e){
			e.printStackTrace();
			result.put("code", "9999");
		}
		//결과값
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
		String memId = (String) params.get("id");
		String member = memberService.chkIdOverlap(memId);
		
		try { 	
			if(member != null) {
				result.put("code", "1111");	
			}else if(member == null) {
				memberService.insertMember(params);
				result.put("code", "0000");	
			}
		}catch(Exception e) {
			e.printStackTrace();
			result.put("code","9999");
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
	//회원정보 업데이트
	@ResponseBody
	@PostMapping(value = "/update")
	public ResponseResult doUpdate(HttpServletRequest request, HttpSession session, @RequestParam HashMap<String, Object> params){
		ResponseResult result = new ResponseResult();
		
		try {
			memberService.updateMember(params);
			result.setCode("0000");
			result.setMessage("update success");
		}catch(Exception e) {
			e.printStackTrace();
			result.setCode("9999");
			result.setMessage("error");
		}
		return result; 
	}
	//회원 삭제
	@ResponseBody
	@PostMapping(value = "/deleteMember")
	public ResponseResult deleteMember(HttpServletRequest request, HttpSession session, @RequestParam HashMap<String, Object> params){
		ResponseResult result = new ResponseResult();
		try {
			String chkPw = memberService.chkPassword(params);
			String memPw = (String) params.get("pw");
			
			if(chkPw.equals(memPw)) {
				memberService.deleteMember(params);
				session.invalidate();
				result.setCode("0000");
				result.setMessage("delete success");
			}else {
				result.setCode("1111");
				result.setMessage("password wrong");
			}
		}catch(Exception e) {
			e.printStackTrace();
			result.setCode("9999");
			result.setMessage("error");
		}
		return result; 
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
