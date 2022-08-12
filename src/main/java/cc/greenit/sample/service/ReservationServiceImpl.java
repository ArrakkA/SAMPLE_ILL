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
	public List<HashMap<String, Object>> reservationList(String dateId) {
		
		return reservationDAO.reservationList(dateId);
		
	}


	@Override
	public List<HashMap<String, Object>> makeCalendar(String yMId) {
		return reservationDAO.makeCalendar(yMId);
	}

}