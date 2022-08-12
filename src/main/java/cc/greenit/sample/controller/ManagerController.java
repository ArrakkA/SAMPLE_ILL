package cc.greenit.sample.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@GetMapping(value= "/getRegisterList")
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
	
	@ResponseBody
	@PostMapping(value="/managedata")
	public HashMap<String, Object> managementManager(@RequestBody List<ManagerVO> paramList) {
		
		
		int icnt = 0;
		int ucnt = 0;
		int dcnt = 0;
		
		for(int i = 0; i< paramList.size(); i++) {
			
			ManagerVO managerVO = paramList.get(i);
			String type = managerVO.getMs_type();
			
			if("u".equals(type)) {
				
				if(managerService.updateManager(managerVO) > 0) ucnt++;
				
			}else if("i".equals(type)) {
			
				String mNum = memberService.makeMemNum();
				managerVO.setMs_num(mNum);
				if(managerService.insertManager(managerVO) > 0)icnt++;
				
			}else if("d".equals(type)) {
				
				if(managerService.deleteManager(managerVO) > 0) dcnt++;
			}
		
		}
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		result.put("insertCnt", icnt);
		result.put("updateCnt", ucnt);
		result.put("deleteCnt", dcnt);
		
		return result;
		
	}



	


}
