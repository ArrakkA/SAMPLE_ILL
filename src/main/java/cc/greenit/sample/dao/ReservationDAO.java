package cc.greenit.sample.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import cc.greenit.sample.common.dao.AbstractDAO;

@Repository
public class ReservationDAO extends AbstractDAO{
	
	
	//예약안된 테이블 조회
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> reservationList(String dateId) {
		
		return (HashMap<String, Object>) selectOne("reservation.reservationTable", dateId);
		
	}
	
	
	

	
	
	
	

}
