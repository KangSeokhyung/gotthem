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

import kr.co.gotthem.product.service.ProductService;
import kr.co.gotthem.store.bean.StoreBean;
import kr.co.gotthem.store.service.StoreService;
import org.springframework.web.servlet.ModelAndView;
import kr.co.gotthem.member.service.MemberService;

@Controller
public class StoreController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	private MemberService memberService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	
	@RequestMapping(value = "/storeIndex.st", method = RequestMethod.GET)
	public String storeIndex() {
		return "store/storeIndex";
	}
	
	@RequestMapping(value = "/join.st", method = RequestMethod.GET)
	public String join(HttpServletRequest request, HttpSession session) throws Exception{
		
		/*StoreBean stBean = new StoreBean();
		
		bean.setSto_id(request.getParameter("sto_id"));
		bean.setSto_pw(request.getParameter("sto_pw"));
		bean.setSto_owner(request.getParameter("sto_owner"));
		bean.setSto_name(request.getParameter("sto_name"));
		bean.setSto_address(request.getParameter("sto_addr1") + "/" +
				request.getParameter("sto_addr2") + "/" + request.getParameter("sto_addr3"));
		stBean.setSto_registno(request.getParameter("sto_registno"));
		stBean.setSto_phone(request.getParameter("sto_phone"));
		stBean.setSto_email(request.getParameter("sto_email"));*/
		
		 /*String dbpw = encoder.saltEncoding(passwd, email);
		 Map<String, String> paramMap = new HashMap<String, String>();
		 paramMap.put("email", email);
		 paramMap.put("passwd", dbpw);
		 int result = dao.insertUser(paramMap);
		 logger.info("result ===> {}", result);*/		
		
		
		/*int result = memberService.joinStore(stBean);*/
		/*System.out.println(result);*/
	
		return "store/join";
	}
	
	@RequestMapping(value = "/login.st", method = RequestMethod.GET)
	public String stlogin(HttpServletRequest request, HttpSession session) throws Exception{
		System.out.println("로그인 페이지 진입했다.");
		
		return "store/stLogin";
	}
	
	@RequestMapping(value = "/logout.st", method = RequestMethod.GET)
	public String stlogout(HttpServletRequest request, HttpSession session) throws Exception{
		session.invalidate();	
		System.out.println("로그아웃 했다.");
		return "store/storeIndex";
	}
	
	@RequestMapping(value = "/stock.st", method = RequestMethod.GET)
	public String stock(HttpServletRequest request, HttpSession session) throws Exception{
		return "store/stock";
	}
	
	@RequestMapping(value = "/cvs.st", method = RequestMethod.POST)
	public String cvs(HttpServletRequest request, HttpSession session) throws Exception{

		return "store/cvs";
	}

}
