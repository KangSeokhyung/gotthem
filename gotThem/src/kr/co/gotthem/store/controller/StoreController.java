package kr.co.gotthem.store.controller;

import java.io.PrintWriter;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView mystore(ModelAndView mav) throws Exception{

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mem_id = authentication.getName();
		MemberBean memberInfo = memberService.memberInfo(mem_id);
		String mem_address = memberInfo.getMem_address();
		StringTokenizer  st = new StringTokenizer(mem_address,"/");
		String post = st.nextToken();
		String address1 = st.nextToken();
		String address2 = st.nextToken();
		mav.addObject("mem_post", post);
		mav.addObject("mem_address1", address1);
		mav.addObject("mem_address2", address2);
		mav.addObject("info", memberInfo);
		mav.setViewName("store/mystore");
		return mav;
	}
	
	@RequestMapping(value = "/mystoreModi.st", method = RequestMethod.GET)
	public ModelAndView memberModi(ModelAndView mav) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mem_id = authentication.getName();
		MemberBean memberInfo = memberService.memberInfo(mem_id);
		String mem_address = memberInfo.getMem_address();
		StringTokenizer  st = new StringTokenizer(mem_address,"/");
		String post = st.nextToken();       
		String address1 = st.nextToken();      
		String address2 = st.nextToken();      
		mav.addObject("mem_post", post);
		mav.addObject("mem_address1", address1);
		mav.addObject("mem_address2", address2);
		mav.addObject("memberInfo", memberInfo);
		mav.setViewName("store/mystoreModi");
		return mav;
	}
	
	@RequestMapping(value = "/storeModi.st", method = RequestMethod.POST)
	public String memberUpdate(MemberBean bean) {
		memberService.memberModifi(bean);
		return "store/mystore";
	}
	
	@RequestMapping(value = "/passCheck.st", method = RequestMethod.GET)
	public ModelAndView passCheck(MemberBean bean, ModelAndView mav) {
		mav.setViewName("store/mystorePWCheck");
		return mav;
	}
	
	@RequestMapping(value = "/passCheck.st", method = RequestMethod.POST)
	public ModelAndView passCheckPost(MemberBean bean, ModelAndView mav, PrintWriter out, HttpServletResponse response)
			throws Exception {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mem_id = authentication.getName();
		bean.setMem_id(mem_id);
		String mem_pw = bean.getMem_pw();
		System.out.println(mem_pw);
		int result = memberService.passCheck(bean);

		if(result == 0) {
			response.setContentType("text/html; charset=UTF-8");
			out = response.getWriter();
			out.println("<Script>");
			out.println("alert('비밀번호를 확인해 주세요');");
			out.println("history.go(-1);");
			out.println("</Script>");
			return null;
		}
		System.out.println(result);
		mav.addObject("passCheck", result);
		mav.setViewName("store/changePW");
		return mav;
	}
	
	@RequestMapping(value = "/mystoreDel.st", method = RequestMethod.GET)
	public ModelAndView memberDel(ModelAndView mav) {
		mav.setViewName("store/mystoreDel");
		return mav;
	}
	
	@RequestMapping(value = "/mystoreDel.st", method = RequestMethod.POST)
	public ModelAndView memberDelete(ModelAndView mav, MemberBean bean, HttpSession  session) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mem_id = authentication.getName();
		bean.setMem_id(mem_id);
		memberService.memberDelete(bean);
		session.invalidate();
		mav.setViewName("redirect:/store/storeindex");
		return mav;
	}
	
	@RequestMapping(value = "/findIDAndPW.st", method = RequestMethod.GET)
	public ModelAndView findID(ModelAndView mav) {
		mav.setViewName("store/findIDAndPW");
		return mav;
	}
	
	@RequestMapping(value = "loginfail.st", method= RequestMethod.GET)
	public String lgfail(HttpServletRequest request) {
		String id = (String)request.getParameter("sto_id");
		System.out.println(id);
		return "store/fail2";
	}

}
