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
		
		System.out.println("aaaaaa");
		System.out.println("두번쨰테스트dddd");
		List<StoreBean> list = new ArrayList<StoreBean>();
		list = storeService.list();
		System.out.println(list+"잘된다");
		
		return "store/storeIndex";
	}
	
	@RequestMapping(value = "/loginForm.st", method = RequestMethod.GET)
	protected ModelAndView loginForm(HttpServletRequest request, HttpSession session) throws Exception{
		ModelAndView mav = new ModelAndView();
		System.out.println("안오냐");
		String sto_id = request.getParameter("sto_id");
		session.setAttribute("sto_id", sto_id);
		mav.setViewName("store/storeLogin");
		return mav;
	}
	
	@RequestMapping(value = "/login.st", method = RequestMethod.POST)
	protected ModelAndView login(HttpServletRequest request, HttpSession session) throws Exception{
		ModelAndView mav = new ModelAndView();
				
		String sto_id = request.getParameter("sto_id");
		session.setAttribute("sto_id", sto_id);
		mav.setViewName("store/storeLogin");
		return mav;
	}
}
