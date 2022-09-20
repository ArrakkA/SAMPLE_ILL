package cc.greenit.sample.controller;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import cc.greenit.sample.global.Globals;
import cc.greenit.sample.service.ReservationService;
import cc.greenit.sample.vo.ResponseResult;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	private ReservationService reservationService;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	public ReservationController(ReservationService reservationService) {
		this.reservationService = reservationService;
	}
	@ResponseBody
	@PostMapping(value = "/getCalendar")
	public ResponseResult getCalendar(HttpServletRequest request, @RequestParam(name="ymId")String ymId){
		ResponseResult result = new ResponseResult();
		try {
			List<HashMap<String, Object>> data = reservationService.makeCalendar(ymId);
			result.setData(data);
			result.setCode("0000");
			result.setMessage("success");
		}catch(Exception e) {
			e.printStackTrace();
			result.setCode("9999");
			result.setMessage("error");
		}
		return result;
	}
	@ResponseBody
	@PostMapping(value = "/getReservation")
	public ResponseResult getReservation(HttpServletRequest request, @RequestParam HashMap<String,Object> params,HttpSession session){
		ResponseResult result = new ResponseResult();
		try {
			HashMap<String, Object> member = (HashMap<String, Object>) session.getAttribute(Globals.SESSION_NAME);
			if(member != null){
				params.put("id", member.get("MS_ID"));
			}
			//쿼리문 저장
			List<HashMap<String, Object>> data = reservationService.reservationList(params);
			//결과 세팅
			result.setData(data);
			result.setCode("0000");
			result.setMessage("success");
		}catch(Exception e) {
			e.printStackTrace();
			//결과 세팅
			result.setCode("9999");
			result.setMessage("error");
		}
		return result;
	}
	@ResponseBody
	@SuppressWarnings("unchecked")
	@PostMapping(value="/setReservation")
	public ResponseResult setReservation(@RequestParam HashMap<String, Object> params, HttpSession session) {
		ResponseResult result = new ResponseResult();
		try {
			//세션저장 데이터 가져오기
			HashMap<String, Object> member = (HashMap<String, Object>) session.getAttribute(Globals.SESSION_NAME);
			if(member == null) {
				result.setCode("2222");
				result.setMessage("session not exist");
			}else if(member != null) {
				// 필요한 parameter 입력
				String rNum = reservationService.makeReservNum();
				params.put("rNum", rNum);
				params.putAll(member);
				int rCnt = reservationService.setReservation(params);
				if(rCnt == 0){
					result.setCode("1111");
					result.setMessage("reservation Data is not exist");
				}else if(rCnt == 1){
				 	result.setCode("0000");
					result.setMessage("reservation Success");
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
			//결과 세팅
			result.setCode("9999");
			result.setMessage("error");
		}
		return result;		
	}
	@ResponseBody
	@SuppressWarnings("unchecked")
	@PostMapping(value = "/getMemberReservation")
	public ResponseResult getMemberReservation(HttpServletRequest request,HttpSession session){
		ResponseResult result = new ResponseResult();
		try {
			//세션저장 데이터 가져오기
			HashMap<String, Object> member = (HashMap<String, Object>) session.getAttribute(Globals.SESSION_NAME);
			List<HashMap<String, Object>> data = reservationService.memberReservationList(member);//데이터 가져오기
			//결과 세팅
			result.setData(data);
			result.setCode("0000");
			result.setMessage("success");
		}catch(Exception e) {
			e.printStackTrace();
			//결과 세팅
			result.setCode("9999");
			result.setMessage("error");
		}
		return result;
	}
	@ResponseBody
	@PostMapping(value = "/cancelReservation")
	public ResponseResult cancelReservation(HttpServletRequest request,HttpSession session, @RequestParam HashMap<String,Object> params){
		ResponseResult result = new ResponseResult();
		try {
			//예약 취소
			reservationService.cancelReservation(params);
			//결과 세팅
			result.setCode("0000");
			result.setMessage("success");
		}catch(Exception e) {
			e.printStackTrace();
			//결과 세팅
			result.setCode("9999");
			result.setMessage("error");
		}
		return result;
	}
	@PostMapping(value = "/dataMove")
	public String dataMove(Model model,@RequestParam HashMap<String,Object> params){
		model.addAttribute("rNum", params.get("rNum").toString());
		return "calendar";
	}
	@ResponseBody
	@PostMapping(value = "/changeReservation")
	public ResponseResult changeReservation(@RequestParam HashMap<String,Object> params, HttpSession session){
		ResponseResult result = new ResponseResult();
		try{
			int chkCnt = reservationService.chkReservationCnt(params);
			HashMap<String, Object> member = (HashMap<String, Object>) session.getAttribute(Globals.SESSION_NAME);
			if(chkCnt == 0){
				result.setCode("1111");
			}else if(chkCnt == 1){
				reservationService.cancelReservation(params);
				params.putAll(member);
				reservationService.setReservation(params);
				result.setCode("0000");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	@ResponseBody
	@PostMapping(value= "/preemptionReservation")
	public ResponseResult preemptionReservation(@RequestParam HashMap<String, Object> params, HttpSession session){
		ResponseResult result = new ResponseResult();
		try{

			HashMap<String, Object> member = (HashMap<String, Object>) session.getAttribute(Globals.SESSION_NAME);
			String id = (String) member.get("MS_ID") ;
			id = id != null ? id : "";
			String overlap = (String) session.getAttribute(Globals.USER_OVERLAP);
			overlap = overlap != null ? overlap : "";

			int viewCnt;
			if(overlap.equals(id)){
				viewCnt = reservationService.selectViewCnt(params);
			}else{
				viewCnt = reservationService.selectViewCnt(params)+1;
				session.setAttribute(Globals.USER_OVERLAP, id);
			}
			reservationService.overlapReservation(params);//기존 독점 삭제
			Date limitDate = new Date(System.currentTimeMillis()+(1000* 60 * 5));// 시간 5분 제한
			params.put("viewCnt", viewCnt);
			params.put("limitDate",limitDate);
			params.put("viewCnt", viewCnt);
			int popCnt = reservationService.preemptionReservation(params); //새로운 독점 생성
			if(popCnt == 0){
				result.setCode("1111"); // 독점 내용이 없음 (선점당함)
			}else{
				HashMap<String, Object> popup = reservationService.popupReservation(params); //팝업창 생성
				result.setCode("0000");
				result.setData(popup); // 독점 성공
			}
		}catch (Exception e){
			e.printStackTrace();
			result.setCode("9999");
		}
		return result;
	}
	@ResponseBody
	@PostMapping(value="/cancelPreemption")
	public ResponseResult cancelPreemption(@RequestParam HashMap<String, Object> params){
		ResponseResult result = new ResponseResult();
		try{
			int cancelCnt = reservationService.overlapReservation(params);
			if(cancelCnt == 1){
				result.setCode("0000");
			}else if(cancelCnt == 0){
				result.setCode("1111");
				result.setMessage("session Time out");
			}
		}catch (Exception e){
			e.printStackTrace();
			result.setCode("9999");
		}
		return result;
	}
}
