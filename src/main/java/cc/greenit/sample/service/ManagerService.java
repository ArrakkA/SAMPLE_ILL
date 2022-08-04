package cc.greenit.sample.service;

import java.util.List;

import cc.greenit.sample.common.dao.Pagination;
import cc.greenit.sample.common.dao.Search;
import cc.greenit.sample.vo.ManagerVO;

public interface ManagerService {
	
	public List<ManagerVO> getRegisterList(Search search); 
	
	public int getRegisterListCnt(Search search);
	
	public int insertManager(ManagerVO managerVO);
	
	public int updateManager(ManagerVO managerVO);
	
	public int deleteManager(String ms_num);
	
	
	public void saveManager(List<ManagerVO> paramList);
	
	

}
