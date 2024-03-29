package cc.greenit.sample.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import cc.greenit.sample.common.dao.AbstractDAO;

@Repository
public class ReservationDAO extends AbstractDAO{
	
	
	//예약안된 테이블 조회
	@SuppressWarnings("unchecked")
	public List<HashMap<String, Object>> reservationList(HashMap<String, Object> params) {
		return (List<HashMap<String, Object>>) selectList("reservation.reservationTable", params);
		
	}
	
	@SuppressWarnings("unchecked")
	public List<HashMap<String, Object>> makeCalendar(String yMId){
		return (List<HashMap<String, Object>>) selectList("reservation.makeCalendar",yMId);
	}
	public String makeReservNum() {
		return (String) selectOne("reservation.makeReservNum");
	}
	public int setReservation(HashMap<String, Object> params) {
		return update("reservation.setReservation",params);
	}
	
	@SuppressWarnings("unchecked")
	public List<HashMap<String, Object>> memberReservationList(HashMap<String, Object> params) {
		
		return (List<HashMap<String, Object>>) selectList("reservation.getMemberReservation", params);
		
	}
	public int cancelReservation(HashMap<String, Object> params) {

		return update("reservation.cancelReservation",params);
	}
	public int chkReservationCnt(HashMap<String,Object> params){
		return selectCnt("reservation.chkReservationCnt", params);
	}
	public int preemptionReservation(HashMap<String,Object> params){
		return update("reservation.preemptionReservation", params);
	}

	public int overlapReservation(HashMap<String,Object> params){
		return update("reservation.overlapReservation", params);
	}
	public HashMap<String,Object> popupReservation(HashMap<String,Object> params){
		return (HashMap<String, Object>) selectOne("reservation.popupReservation", params);
	}
}
