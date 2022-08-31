package cc.greenit.sample.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cc.greenit.sample.common.dao.AbstractDAO;

@Repository
public class MemberDAO extends AbstractDAO {
	
	//로그인 회원조회
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> selectMember(Map<String, Object> params) {
		return (HashMap<String, Object>) selectOne("member.selectMember", params);
	}
	
	//회원가입
	public int insertMember(Map<String, Object> params) {
		return  insert("member.insertMember", params);
	}
	
	//회원번호 생성 알고리즘
 	public String makeMemNum() {
		return (String) selectOne("member.makeMemNum");
	}
	
 	//회원정보 업데이트
	public int updateMember(HashMap<String, Object> params){
 		return update("member.updateMember", params);
 	}
 	public String chkIdOverlap(String memId) {
 		return (String) selectOne("member.chkIdOverlap", memId);
 	}
 	
 	public String chkPassword(HashMap<String, Object> params) {
 		return (String) selectOne("member.chkPassword", params);
 	}
 	
 	public int deleteMember(HashMap<String, Object> params) {
		return update("member.deleteMember", params);
 	}
 	
 }
