package kr.co.gotthem.store.controller;

import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.member.mail.MailService;
import kr.co.gotthem.member.service.MemberService;

@Controller
public class StoreController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	private MemberService memberService;
	private MailService mailService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Autowired
	public void setMailService(MailService mailService) {
        this.mailService = mailService;
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
	
	@RequestMapping(value = "/findId.st", method = RequestMethod.GET)
	public ModelAndView findID(ModelAndView mav) {
		mav.setViewName("store/findId");
		return mav;
	}
	
	@RequestMapping(value = "/findPw.st", method = RequestMethod.GET)
	public ModelAndView findPW(ModelAndView mav) {
		mav.setViewName("store/findPw");
		return mav;
	}

	@RequestMapping(value = "loginfail.st", method= RequestMethod.GET)
	public String lgfail(HttpServletRequest request) {
		String id = (String)request.getParameter("sto_id");
		System.out.println(id);
		return "store/fail2";
	}
	
	// 아이디 찾기
    @RequestMapping(value = "/findId.st", method = RequestMethod.POST)
    public ModelAndView sendMailId(HttpSession session, @RequestParam("mem_email") String email,
    		@RequestParam("mem_name") String name, ModelAndView mav, MemberBean bean) {
    	
        System.out.println(bean);
        MemberBean memberBean =  memberService.findAccount(bean);
        System.out.println(memberBean);
        if (memberBean != null) {
            String subject = "Goththem 아이디 찾기 안내 입니다.";
            StringBuilder sb = new StringBuilder();
            sb.append("귀하의 아이디는 " + memberBean.getMem_id() + " 입니다.");
            if(mailService != null) {
            	System.out.println(mailService);
            } else {
            	System.out.println(" 빈거" + mailService);
            }
            boolean mailResult = mailService.send(subject, sb.toString(), "gotthembit@gmail.com", email, null);
            
            System.out.println("이메일 보내기 성공?"+ mailResult);
            
            mav.addObject("resultMsg", "1");
        } else {
        	mav.addObject("resultMsg", "2");
        }
        mav.setViewName("store/findId");
        return mav;
    }
    
    // 비밀번호 찾기
    @RequestMapping(value = "/findPw.st", method = RequestMethod.POST)
    public ModelAndView sendMailPassword(HttpSession session, MemberBean bean, @RequestParam("mem_email") String email,
    		ModelAndView mav) {
        String mem_id = bean.getMem_id();
        bean= memberService.login(mem_id);
        if (bean != null) {
            if (!bean.getMem_id().equals(mem_id)) {
                mav.addObject("resultMsg", "6");
            }
            int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
            String password = String.valueOf(ran);
            bean.setMem_pw(password);
            bean.setMem_email(email);
            int pwChangeResult = memberService.changePassword(bean); // 해당 유저의 DB정보 변경
            if(pwChangeResult==1) {
            	String subject = "임시 비밀번호 발급 안내 입니다.";
                StringBuilder sb = new StringBuilder();
                sb.append("귀하의 임시 비밀번호는 " + password + " 입니다.");
                boolean mailResult = mailService.send(subject, sb.toString(), "gotthembit@gmail.com", email, null);
                System.out.println("이메일 보내기 성공?"+ mailResult);
                mav.addObject("resultMsg", "3");
            } else {
            	mav.addObject("resultMsg", "4");
            }
            
        } else {
        	mav.addObject("resultMsg", "5");
        }
        mav.setViewName("store/findPw");
        return mav;
    }

}
