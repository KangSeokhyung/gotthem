package kr.co.gotthem.store.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gotthem.store.bean.StoreBean;
import kr.co.gotthem.store.service.StroreService;

@Controller
public class StoreController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	private StroreService storeService;

	public void setStoreService(StroreService storeService) {
		this.storeService = storeService;
	}

	@RequestMapping(value = "/storeIndex.st", method = RequestMethod.GET)
	public String storeIndex() {
		return "store/storeIndex";
	}
	
	@RequestMapping(value = "/login.st", method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpSession session) throws Exception{
		
		String sto_id = request.getParameter("sto_id");
		String sto_pw = request.getParameter("sto_pw");
		
		StoreBean dto = storeService.FindById(sto_id);
		
		session.setAttribute("sto_id", sto_id);
		if(dto==null) {
			return "store/fail2";
		}
		
		String pw = dto.getSto_pw();
		
		if(sto_pw.equals(pw)) {
			session.setAttribute("sto_id", sto_id);
		}else {
			return "fail";
		}
		return "store/storeIndex";
	}
	
	@RequestMapping(value = "/stock.st", method = RequestMethod.POST)
	public String stock(HttpServletRequest request, HttpSession session) throws Exception{
		
		/*session.getAttribute("sto_id", sto_id);
		if(dto==null) {
			return "store/fail2";
		}
		
		String pw = dto.getSto_pw();
		
		if(sto_pw.equals(pw)) {
			session.setAttribute("sto_id", sto_id);
		}else {
			return "fail";
		}*/
		return "store/stock";
	}
	
	@RequestMapping(value = "/cvs.st", method = RequestMethod.POST)
	public String cvs(HttpServletRequest request, HttpSession session) throws Exception{
		
		
		return "store/cvs";
	}
}
