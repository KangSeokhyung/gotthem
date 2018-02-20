package kr.co.gotthem.admin.controller;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import kr.co.gotthem.store.service.StoreService;
import kr.co.gotthem.store.bean.StoreBean;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	private StoreService storeService;

	public void setStoreService(StoreService storeService) {
		this.storeService = storeService;
	}

	@RequestMapping(value = "/superAdmin.ad", method = RequestMethod.GET)
	public String storeIndex() {
		System.out.println("아에이오우!");
		return "admin/adminLogin";
	}
	
	@RequestMapping(value = "/superAdmin.ad", method = RequestMethod.POST)
	public String control() {
		System.out.println("최종 관리자 로그인 진입");
		return "admin/controlPage";
	}
	
	@RequestMapping(value = "/control.ad", method = RequestMethod.GET)
	public String ccc() {
		System.out.println("최종 관리자 로그인 진입");
		return "admin/controlPage";
	}
	
	@RequestMapping(value = "/memcontrol.ad", method = RequestMethod.GET)
	public ModelAndView member(ModelAndView mav) {
		
		List<StoreBean> stlist = storeService.list();		
		System.out.println("멤버 컨트롤 진입");
		System.out.println(stlist);
		
		mav.addObject("stlist", stlist);
		mav.setViewName("admin/memberControl");
		
		return mav;
		
	}

}
