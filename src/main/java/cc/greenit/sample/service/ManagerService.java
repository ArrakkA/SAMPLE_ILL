package cc.greenit.sample.service;

import java.util.List;

import cc.greenit.sample.common.dao.Search;
import cc.greenit.sample.vo.ManagerVO;

public interface ManagerService {
	
	public List<ManagerVO> getRegisterList(Search search); 
	
	public int getRegisterListCnt(Search search);
	
	public int insertManager(ManagerVO managerVO);
	
	public int updateManager(ManagerVO managerVO);
	
	public int deleteManager(ManagerVO managerVO);
	
}