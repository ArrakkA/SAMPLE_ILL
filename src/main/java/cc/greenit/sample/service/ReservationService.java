package cc.greenit.sample.service;

import java.util.HashMap;
import java.util.List;

public interface ReservationService {
	
	public List<HashMap<String, Object>> reservationList(HashMap<String,Object> params);
	
	public List<HashMap<String, Object>> makeCalendar(String yMId);
	
	public String makeReservNum();
	
	public int setReservation(HashMap<String, Object> params);
	
	public List<HashMap<String, Object>> memberReservationList(HashMap<String, Object> params);
	
	public int cancelReservation(HashMap<String, Object> params);
	public int chkReservationCnt(HashMap<String, Object> params);
	public int preemptionReservation(HashMap<String,Object> params);
	public int overlapReservation(HashMap<String,Object> params);
	public HashMap<String,Object> popupReservation(HashMap<String,Object> params);
	public int selectViewCnt(HashMap<String,Object> params);
}
