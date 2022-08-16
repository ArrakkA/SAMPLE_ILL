package cc.greenit.sample.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import cc.greenit.sample.service.ReservationService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	private ReservationService reservationService;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	public ReservationController(ReservationService reservationService) {
		this.reservationService = reservationService;
		
	}
	//날짜에 맞는 테이블 들고오기(상태가 Y)
	@ResponseBody
	@PostMapping(value = "/getCalendarInfo")
	public HashMap<String, Object> getReservation(HttpServletRequest request){

		//결과 입력
		HashMap<String, Object> result = new HashMap<String, Object>();

		String dateId = request.getParameter("dateId");
		String yMId = request.getParameter("yMId");
		try {
			//쿼리문에 것들 저장
			List<HashMap<String, Object>> params1 = reservationService.reservationList(dateId);
			List<HashMap<String, Object>> params2 = reservationService.makeCalendar(yMId);
			//표현하기위해 가져감
			result.put("reservation", params1);
			result.put("calendar", params2);
			result.put("status", "success");

		}catch(Exception e){
			//실패시 에러 표시
			e.printStackTrace();
			result.put("status", "실패");
		}
		return result;
	}

	@ResponseBody
	@PostMapping(value = "/getReservation")
	public ResponseResult reservationList(HttpServletRequest request, @RequestParam(name = "dateId") String dateId){
		//결과 입력
		ResponseResult result = new ResponseResult();
		try {
			//쿼리문에 것들 저장
			List<HashMap<String, Object>> data = reservationService.reservationList(dateId);

			//표현하기위해 가져감
			result.setData(data);
		}catch(Exception e){
			e.printStackTrace();

			result.setCode("9999");
		}

		return result;
	}

	@ResponseBody
	@PostMapping(value = "/getCalendar")
	public ResponseResult getCalendar(HttpServletRequest request, @RequestParam(name = "yMId") String yMId){
		//결과 입력
		ResponseResult result = new ResponseResult();
		try {
			//쿼리문에 것들 저장
			List<HashMap<String, Object>> data = reservationService.makeCalendar(yMId);

			//표현하기위해 가져감
			result.setData(data);
		} catch(Exception e){
			e.printStackTrace();

			result.setCode("9999");
			result.setMessage("오류");
		}

		return result;
	}

	private class ResponseResult {
		private String code;
		private String message;
		private Object data;

		public ResponseResult() {
			code = "0000";
			message = "";
		}

		public String getCode() {
			return code;
		}

		public void setCode(String code) {
			this.code = code;
		}

		public String getMessage() {
			return message;
		}

		public void setMessage(String message) {
			this.message = message;
		}

		public Object getData() {
			return data;
		}

		public void setData(Object data) {
			this.data = data;
		}
	}

	
	
	
	

}
