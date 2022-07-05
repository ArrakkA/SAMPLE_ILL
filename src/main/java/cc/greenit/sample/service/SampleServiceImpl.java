package cc.greenit.sample.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.greenit.sample.dao.SampleDAO;

@Service
public class SampleServiceImpl implements SampleService {
	
	SampleDAO sampleDAO;
	
	@Autowired
	public SampleServiceImpl(SampleDAO sampleDAO) {
		this.sampleDAO = sampleDAO;
	}

	@Override
	public HashMap<String, Object> selectTest(Map<String, Object> params) {
		return sampleDAO.selectTest(params);
	}
	
}
