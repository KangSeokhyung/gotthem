package kr.co.gotthem.store.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import kr.co.gotthem.store.bean.StoreBean;
import kr.co.gotthem.store.service.StoreService;

@Controller
public class StoreController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	private StoreService storeService;

	public void setStoreService(StoreService storeService) {
		this.storeService = storeService;
	}
	
	
	@RequestMapping(value = "/storeIndex.st", method = RequestMethod.GET)
	public String storeIndex() {
		return "store/storeIndex";
	}
	
	@RequestMapping(value = "/join.st", method = RequestMethod.POST)
	public String join(HttpServletRequest request, HttpSession session) throws Exception{
		
		StoreBean bean = new StoreBean();
		
		bean.setSto_id(request.getParameter("sto_id"));
		bean.setSto_pw(request.getParameter("sto_pw"));
		bean.setSto_owner(request.getParameter("sto_owner"));
		bean.setSto_name(request.getParameter("sto_name"));
		bean.setSto_address(request.getParameter("sto_addr1") + "/" +
				request.getParameter("sto_addr2") + "/" + request.getParameter("sto_addr3"));
		bean.setSto_registno(request.getParameter("sto_registno"));
		bean.setSto_phone(request.getParameter("sto_phone"));
		bean.setSto_email(request.getParameter("sto_email"));
		
		 /*String dbpw = encoder.saltEncoding(passwd, email);
		 Map<String, String> paramMap = new HashMap<String, String>();
		 paramMap.put("email", email);
		 paramMap.put("passwd", dbpw);
		 int result = dao.insertUser(paramMap);
		 logger.info("result ===> {}", result);*/		
		
		int result = storeService.joinStore(bean);
		System.out.println(result);
	
		return "store/storeIndex";
	}
	
	@RequestMapping(value = "/login.st", method = RequestMethod.GET)
	public String stlogin(HttpServletRequest request, HttpSession session) throws Exception{
		System.out.println("로그인 페이지 진입했다.");
		
		return "store/stLogin";
	}
	
}
