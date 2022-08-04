package cc.greenit.sample.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cc.greenit.sample.common.dao.Search;
import cc.greenit.sample.service.ManagerService;
import cc.greenit.sample.service.MemberService;
import cc.greenit.sample.vo.ManagerVO;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	private ManagerService managerService;
	private MemberService memberService;
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	
	@Autowired
	public ManagerController(ManagerService managerService, MemberService memberService) {
		
		this.managerService = managerService;
		this.memberService = memberService;
		
	}
	
	
	
	@RequestMapping(value= "/getRegisterList", method = RequestMethod.GET)
	public String getRegister(Model model
			,@RequestParam(required= false, defaultValue ="1") int page
			,@RequestParam(required= false, defaultValue ="1") int range
			,@RequestParam(required= false, defaultValue ="name") String searchType
			,@RequestParam(required= false) String keyword
			){
		
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		int listCnt = managerService.getRegisterListCnt(search);
		
		search.pageInfo(page, range , listCnt);
		
		model.addAttribute("pagination", search);
		model.addAttribute("registerList", managerService.getRegisterList(search));
		return "manager";
		
	}
	
	@RequestMapping(value="/management", method = {RequestMethod.POST, RequestMethod.GET})
	public HashMap<String, Object> updateManager(@RequestBody List<ManagerVO> paramList) {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		
		for(int i = 0; i< paramList.size(); i++) {
			
		String type = paramList.get(i).getMs_type();
		
		
		if(type == "u") {
			
			managerService.updateManager(paramList.get(i));
			
			result.put("update" , i);
			
		}else if(type == "i") {
		
			String mNum = memberService.makeMemNum();
			paramList.get(i).setMs_num(mNum);
			
			managerService.insertManager(paramList.get(i));
			
			result.put("insert" , i);
			
		}else if(type== "d") {
			
			String mmNum = paramList.get(i).getMs_num();
			
			managerService.deleteManager(mmNum);
			
			result.put("delete", i);
		}
		
		
		}
		
		
		
		
		
		
		return result;
		
	}



	


}
