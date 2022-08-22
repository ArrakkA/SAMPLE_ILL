package cc.greenit.sample.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.greenit.sample.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	MemberDAO memberDAO;
	
	@Autowired
	public MemberServiceImpl(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	public HashMap<String,Object> selectMember(Map<String, Object> params) {
		
		return memberDAO.selectMember(params);
	}

	@Override
	public int insertMember(Map<String, Object> params) {
		
		return memberDAO.insertMember(params);
	}

	@Override
	public String makeMemNum() {
		
		return memberDAO.makeMemNum();
	}

	@Override
	public int updateMember(HashMap<String, Object> params) {
		
		return memberDAO.updateMember(params);
	}

	@Override
	public String chkIdOverlap(String memId) {
		return memberDAO.chkIdOverlap(memId);
	}

	@Override
	public String chkPassword(HashMap<String, Object> params) {
		return memberDAO.chkPassword(params);
	}

	@Override
	public int deleteMember(HashMap<String, Object> params) {
		return memberDAO.deleteMember(params);
	}

	
	
}
