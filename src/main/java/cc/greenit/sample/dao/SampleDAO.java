package cc.greenit.sample.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cc.greenit.sample.common.dao.AbstractDAO;

@Repository
public class SampleDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> selectTest(Map<String, Object> params) {
		return (HashMap<String, Object>) selectOne("sample.selectTest", params);
	}
	
}
