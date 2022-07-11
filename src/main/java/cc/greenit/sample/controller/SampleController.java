package cc.greenit.sample.controller;

import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.greenit.sample.service.SampleService;

@Controller
@RequestMapping("/sample")
public class SampleController {
	
	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
	
	private SampleService sampleService;
	
	@Autowired
	public SampleController(SampleService sampleService) {
		this.sampleService = sampleService;
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "test";
	}
	
	@ResponseBody
	@RequestMapping(value = "/testDB", method = RequestMethod.GET)
	public HashMap<String, Object> testDB(HttpServletRequest request, HttpServletResponse response) {
		HashMap<String, Object> result = sampleService.selectTest(null);
		
		logger.info(result.get("CO_DIV").toString());
		logger.info(result.get("CO_NAME").toString());

		return result;
	}
		
}
