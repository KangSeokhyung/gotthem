package kr.co.gotthem.store.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.gotthem.member.bean.MemberBean;
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
		
		 /*String dbpw = encoder.saltEncoding(passwd, email);
		 Map<String, String> paramMap = new HashMap<String, String>();
		 paramMap.put("email", email);
		 paramMap.put("passwd", dbpw);
		 int result = dao.insertUser(paramMap);
		 logger.info("result ===> {}", result);		
		
		
		/*int result = memberService.joinStore(stBean);*/
		/*System.out.println(result);*/
	
		return "store/join";
	}
	
	@RequestMapping(value = "/join.st", method = RequestMethod.POST)
	public String stjoin(HttpServletRequest request, HttpSession session) throws Exception{
		
		MemberBean stBean = new MemberBean();
		stBean.setMem_id(request.getParameter("mem_id"));
		stBean.setMem_pw(request.getParameter("mem_pw"));
		stBean.setMem_name(request.getParameter("mem_name"));
		stBean.setSto_name(request.getParameter("sto_name"));
		stBean.setMem_phone(request.getParameter("mem_phone"));
		stBean.setMem_address(request.getParameter("mem_addr1") + "/" +
				request.getParameter("mem_addr2") + "/" + request.getParameter("mem_addr3"));
		stBean.setMem_email(request.getParameter("mem_email"));
		
		System.out.println(stBean);	
		
		int result = memberService.stjoin(stBean);
		System.out.println(result);
	
		return "store/storeIndex";
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
	
	@RequestMapping(value = "/mystore.st", method = RequestMethod.GET)
	public String mystore(HttpServletRequest request, HttpSession session) throws Exception{
		System.out.println("마이스토어 진입");
		return "store/mystore";
	}
	
	@RequestMapping(value = "loginfail.st", method= RequestMethod.GET)
	public String lgfail(HttpServletRequest request) {
		String id = (String)request.getParameter("sto_id");
		System.out.println(id);
		return "store/fail2";
	}

}
