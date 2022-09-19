package cc.greenit.sample.service;

import java.util.HashMap;
import java.util.Map;

public interface MemberService {
	
	public HashMap<String, Object> selectMember(Map<String, Object> params);
	public int insertMember(Map<String, Object> params);
	public String makeMemNum();
	public int updateMember(HashMap<String, Object> params);
	public String chkIdOverlap(String memId);
	public String chkPassword(HashMap<String, Object> params);
	public int deleteMember(HashMap<String, Object> params);
	public HashMap<String,Object> checkUserSessionKey(HashMap<String, Object> params);
	public int autoLogin(HashMap<String, Object> params);
	public int chkIdCnt(HashMap<String,Object> params);
}
