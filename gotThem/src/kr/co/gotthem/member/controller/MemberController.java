package kr.co.gotthem.member.controller;

import java.io.PrintWriter;
import java.util.Random;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
public class MemberController {
	
	private MemberService memberService;
	private MailService mailService;


	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Autowired
	public void setMailService(MailService mailService) {
        this.mailService = mailService;
    }

	@RequestMapping(value = "/login.gt", method = RequestMethod.GET)
	public String login() {
		return "member/mlogin";
	}
	
	@RequestMapping(value = "/logout.gt", method = RequestMethod.GET)
	public String logout(HttpSession  session, HttpServletRequest request) {		
		session.invalidate();		
		return "redirect:index.jsp";
	}
	
	@RequestMapping(value = "/join.gt", method = RequestMethod.GET)
	public String memberJoin() {	
		return "member/join";
	}
	
	@RequestMapping(value = "/joinSccess.gt", method = RequestMethod.POST)
	public String joinSccess(HttpServletRequest request, MemberBean memberBean, HttpServletResponse response) throws Exception {
		
		memberBean.setMem_address(request.getParameter("mem_post")+"/"+
		request.getParameter("mem_address1")+"/"+request.getParameter("mem_address2"));
		
		System.out.println(memberBean);
		memberService.join(memberBean);
		return "redirect:index.gt";
	}
	
	@RequestMapping(value = "/duplCheck.gt", method = RequestMethod.POST)
	public String duplCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String mem_id = request.getParameter("mem_id");
		int result = 0;
		
		result = memberService.duplCheck(mem_id);
		if (result > 0) {
			System.out.println("아이디 존재");
		} else {
			System.out.println("아이디 없음");
		}
		response.getWriter().write(result + "");
		
		return null;
	}
	
	@RequestMapping(value = "loginfail.gt", method= RequestMethod.GET)
	public String lgfail() {
		return "store/fail2";
	}
	
	@RequestMapping(value = "/index.gt", method = RequestMethod.GET)
	public String index() {	
		return "redirect:index.jsp";
	}

	@RequestMapping(value = "/mypage.gt", method = RequestMethod.GET)
	public ModelAndView mypage(ModelAndView mav) {
		mav.setViewName("member/mypage");
		return mav;
	}
	
	@RequestMapping(value = "/mypageMemberInfo.gt", method = RequestMethod.GET)
	public ModelAndView memberInfo(ModelAndView mav) {
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
		mav.setViewName("member/mypageMemberInfo");
		return mav;
	}
	
	@RequestMapping(value = "/mypageMemberModi.gt", method = RequestMethod.GET)
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
		mav.setViewName("member/mypageMemberModi");
		return mav;
	}
	
	@RequestMapping(value = "/memberModi.gt", method = RequestMethod.POST)
	public String memberUpdate(MemberBean bean) {
		memberService.memberModifi(bean);
		return "member/mypage";
	}
	
	@RequestMapping(value = "/passCheck.gt", method = RequestMethod.GET)
	public ModelAndView passCheck(MemberBean bean, ModelAndView mav) {
		mav.setViewName("member/mypagePWCheck");
		return mav;
	}
	
	@RequestMapping(value = "/passCheck.gt", method = RequestMethod.POST)
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
		mav.setViewName("member/changePW");
		return mav;
	}
	
	@RequestMapping(value = "/mypageMemberDel.gt", method = RequestMethod.GET)
	public ModelAndView memberDel(ModelAndView mav) {
		mav.setViewName("member/mypageMemberDel");
		return mav;
	}
	
	@RequestMapping(value = "/mypageMemberDel.gt", method = RequestMethod.POST)
	public ModelAndView memberDelete(ModelAndView mav, MemberBean bean, HttpSession  session) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mem_id = authentication.getName();
		bean.setMem_id(mem_id);
		memberService.memberDelete(bean);
		session.invalidate();
		mav.setViewName("redirect:index.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/findIDAndPW.gt", method = RequestMethod.GET)
	public ModelAndView findID(ModelAndView mav) {
		mav.setViewName("member/findIDAndPW");
		return mav;
	}
	
 
    // 아이디 찾기
    @RequestMapping(value = "/findID.gt", method = RequestMethod.POST)
    public String sendMailId(HttpSession session, @RequestParam("mem_email") String email, RedirectAttributes ra, MemberBean bean) {
       
        bean =  memberService.findAccount(email);
        System.out.println(bean);
        System.out.println(email);
        if (bean != null) {
            String subject = "Goththem 아이디 찾기 안내 입니다.";
            StringBuilder sb = new StringBuilder();
            sb.append("귀하의 아이디는 " + bean.getMem_id() + " 입니다.");
            if(mailService != null) {
            	System.out.println(mailService);
            } else {
            	System.out.println(" 빈거" + mailService);
            }
            boolean mailResult = mailService.send(subject, sb.toString(), "gotthembit@gmail.com", email, null);
          
            
            System.out.println("이메일 보내기 성공?"+ mailResult);
            
            ra.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 해당 이메일로 가입된 아이디를 발송 하였습니다.");
        } else {
            ra.addFlashAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
        }
        return "redirect:/findIDAndPW.gt";
    }
 
    
    // 비밀번호 찾기
    @RequestMapping(value = "/findPW.gt", method = RequestMethod.POST)
    public String sendMailPassword(HttpSession session, MemberBean bean, @RequestParam("mem_email") String email, RedirectAttributes ra) {
        String mem_id = bean.getMem_id();
        bean= memberService.login(mem_id);
        if (bean != null) {
            if (!bean.getMem_id().equals(mem_id)) {
                ra.addFlashAttribute("resultMsg", "입력하신 이메일의 회원정보와 가입된 아이디가 일치하지 않습니다.");
                return "redirect:/findIDAndPW.gt";
            }
            int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
            String password = String.valueOf(ran);
            bean.setMem_pw(password);
            bean.setMem_email(email);
            memberService.changePassword(bean); // 해당 유저의 DB정보 변경
 
            String subject = "임시 비밀번호 발급 안내 입니다.";
            StringBuilder sb = new StringBuilder();
            sb.append("귀하의 임시 비밀번호는 " + password + " 입니다.");
            boolean mailResult = mailService.send(subject, sb.toString(), "gotthembit@gmail.com", email, null);
            System.out.println("이메일 보내기 성공?"+ mailResult);
            ra.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다.");
        } else {
            ra.addFlashAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
        }
        return "redirect:/findIDAndPW.gt";
    }


}
