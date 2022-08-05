package cc.greenit.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.greenit.sample.common.dao.Search;
import cc.greenit.sample.dao.ManagerDAO;
import cc.greenit.sample.dao.MemberDAO;
import cc.greenit.sample.vo.ManagerVO;

@Service
public class ManagerServiceImpl implements ManagerService{

	
	ManagerDAO managerDAO;
	MemberDAO memberDAO;
	
	@Autowired
	public ManagerServiceImpl(ManagerDAO managerDAO) {
		this.managerDAO = managerDAO;
	}
	
	@Override
	public List<ManagerVO> getRegisterList(Search search) {
		
		return managerDAO.getRegisterList(search);
	}
	

	@Override
	public int getRegisterListCnt(Search search) {
		
		return managerDAO.getRegisterListCnt(search);
	}

	@Override
	public int insertManager(ManagerVO managerVO) {
		
		return managerDAO.insertManager(managerVO);
	}

	@Override
	public int updateManager(ManagerVO managerVO) {
		
		return managerDAO.updateManager(managerVO);
	}

	@Override
	public int deleteManager(ManagerVO managerVO) {
		
		return managerDAO.deleteManager(managerVO);
		
	}
	
	
		
	

}
