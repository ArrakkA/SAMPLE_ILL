package cc.greenit.sample.service;

import java.util.HashMap;
import java.util.List;

public interface ReservationService {
	
	public List<HashMap<String, Object>> reservationList(String dateId);
	
	public List<HashMap<String, Object>> makeCalendar(String yMId);
}
