package cc.greenit.sample.service;

import java.util.HashMap;
import java.util.Map;

public interface MemberService {
	
	public HashMap<String, Object> selectMember(Map<String, Object> params);
	
	public int insertMember(Map<String, Object> params);
	
	public String makeMemNum();
	
	public HashMap<String, Object> getMemberList(String memId);
	
}
