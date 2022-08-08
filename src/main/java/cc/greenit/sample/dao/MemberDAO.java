package cc.greenit.sample.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cc.greenit.sample.common.dao.AbstractDAO;

@Repository
public class MemberDAO extends AbstractDAO {
	
	//로그인
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> selectMember(Map<String, Object> params) {
		return (HashMap<String, Object>) selectOne("member.selectMember", params);
	}
	
	//회원가입
	public int insertMember(Map<String, Object> params) {
		return   insert("member.insertMember", params);
	}
	
	//회원번호 생성 알고리즘
 	public String makeMemNum() {
		return (String) selectOne("member.makeMemNum");
	}
	
 	//마이페이지 조회
 	@SuppressWarnings("unchecked")
	public HashMap<String, Object> getMemberList(String memId){
 		
 		return (HashMap<String, Object>) selectOne("member.memberList", memId);
 	}
 	
 	
}
