package com.model2.mvc.web.bbs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model2.mvc.service.bbs.BbsService;
import com.model2.mvc.service.domain.Bbs;

@Controller
@RequestMapping("/bbs/*")
public class BbsController {

	@Autowired
	@Qualifier("bbsServiceImpl")
	private BbsService bbsService;
	
	public BbsController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String addBbsView(@ModelAttribute("bbs") Bbs bbs, Model model) throws Exception{
		System.out.println("/bbs/write : POST");
		
		bbsService.addBbs(bbs);
		
		model.addAttribute(bbs);
		
		return "forward:/bbs/bbs.jsp";
	}
	
}
