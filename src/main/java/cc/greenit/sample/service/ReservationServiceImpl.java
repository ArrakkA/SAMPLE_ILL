package cc.greenit.sample.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.greenit.sample.dao.ReservationDAO;


@Service
public class ReservationServiceImpl implements ReservationService {

	ReservationDAO reservationDAO;
	
	@Autowired
	public ReservationServiceImpl(ReservationDAO reservationDAO) {
		
		this.reservationDAO = reservationDAO;
		
	}
	@Override
	public List<HashMap<String, Object>> reservationList(HashMap<String,Object> params) {
		
		return reservationDAO.reservationList(params);
		
	}
	@Override
	public List<HashMap<String, Object>> makeCalendar(String yMId) {

		return reservationDAO.makeCalendar(yMId);
	}
	@Override
	public String makeReservNum() {
	
		return reservationDAO.makeReservNum();
	}
	@Override
	public int setReservation(HashMap<String, Object> params) {
		return reservationDAO.setReservation(params);
	}
	@Override
	public List<HashMap<String, Object>> memberReservationList(HashMap<String, Object> params) {
		return reservationDAO.memberReservationList(params);
	}
	@Override
	public int cancelReservation(HashMap<String, Object> params) {

		return reservationDAO.cancelReservation(params);
	}
	@Override
	public int chkReservationCnt(HashMap<String, Object> params) {
		return reservationDAO.chkReservationCnt(params);
	}
	@Override
	public int preemptionReservation(HashMap<String, Object> params) {
		return reservationDAO.preemptionReservation(params);
	}
	@Override
	public int overlapReservation(HashMap<String, Object> params) {
		return reservationDAO.overlapReservation(params);
	}
	@Override
	public HashMap<String, Object> popupReservation(HashMap<String, Object> params) {
		return reservationDAO.popupReservation(params);
	}
}
