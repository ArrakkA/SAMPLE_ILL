package cc.greenit.sample.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

	
	
	
	

}
