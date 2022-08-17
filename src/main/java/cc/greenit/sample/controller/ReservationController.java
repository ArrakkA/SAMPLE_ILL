package cc.greenit.sample.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public ResponseResult getReservation(HttpServletRequest request, @RequestParam(name="dateId")String dateId){
		
		ResponseResult result = new ResponseResult();
		
		try {
			//쿼리문 저장
			List<HashMap<String, Object>> data = reservationService.reservationList(dateId);
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
	@PostMapping(value="/setReservation")
	public ResponseResult setReservation(HttpServletRequest request, @RequestParam HashMap<String, Object> params, HttpSession session) {
		
		
		
		ResponseResult result = new ResponseResult();
		
		try {
			session = request.getSession(false);
				
			if(session == null) {
				
				result.setCode("1111");
				result.setMessage("session not exist");
				
			}else if(session != null) {
				
				// 필요한 parameter들 입력
				@SuppressWarnings("unchecked")
				HashMap<String, Object> sParams = (HashMap<String, Object>) session.getAttribute(Globals.SESSION_NAME);
				String rNum = reservationService.makeReservNum();
				params.put("rNum", rNum);
				params.putAll(sParams);
				
				reservationService.setReservation(params);
				
				result.setCode("0000");
				result.setMessage("session exist");
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			//결과 세팅
			result.setCode("9999");
			result.setMessage("error");
		}
		
		

		return result;
				
	}
	

	
	
	
	

}
