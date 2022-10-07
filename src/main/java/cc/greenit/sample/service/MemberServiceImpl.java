package cc.greenit.sample.service;

import cc.greenit.sample.dao.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

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
	public int chkPassword(HashMap<String, Object> params) {
		return memberDAO.chkPassword(params);
	}
	@Override
	public int deleteMember(HashMap<String, Object> params) {
		return memberDAO.deleteMember(params);
	}
	@Override
	public HashMap<String, Object> checkUserSessionKey(HashMap<String, Object> params) {
		return memberDAO.checkUserSessionKey(params);
	}
	@Override
	public int autoLogin(HashMap<String, Object> params) {
		return memberDAO.autoLogin(params);
	}
	@Override
	public int chkIdCnt(HashMap<String, Object> params) {
		return memberDAO.chkIdCnt(params);
	}
}
