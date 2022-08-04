package cc.greenit.sample.dao;

import java.util.List;
import org.springframework.stereotype.Repository;

import cc.greenit.sample.common.dao.AbstractDAO;
import cc.greenit.sample.common.dao.Pagination;
import cc.greenit.sample.common.dao.Search;
import cc.greenit.sample.vo.ManagerVO;



@Repository
public class ManagerDAO extends AbstractDAO{
	
	
	
	@SuppressWarnings("unchecked")
	public List<ManagerVO> getRegisterList(Search search){
		
		return selectList("manager.getRegisterList", search);
			
		
	}
	
	public int getRegisterListCnt(Search search) {
		
		return (int) selectOne("manager.getRegisterListCnt", search);
	}
	
	public int insertManager(ManagerVO managerVO) {
		
		return insert("manager.insertManager", managerVO);
	}
	
	
	
	public int updateManager(ManagerVO managerVO) {
		
		return update("manager.updateManager", managerVO );
	}
	
	public int deleteManager(String ms_num) {
		
		return delete("manager.deleteManager", ms_num);
	}

}
