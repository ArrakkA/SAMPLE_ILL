package cc.greenit.sample.service;

import java.util.HashMap;
import java.util.Map;

public interface MemberService {
	
	public HashMap<String, Object> selectMember(Map<String, Object> params);
	
	public HashMap<String, Object> insertMember(Map<String, Object> params);
}
