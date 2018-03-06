package kr.co.gotthem.member.controller;

import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mariadb.jdbc.internal.logging.Logger;
import org.mariadb.jdbc.internal.logging.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.member.service.MemberService;

@Controller
public class MemberController {
	 
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	private MemberService memberService;
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@RequestMapping(value = "/login.gt", method = RequestMethod.GET)
	public String login() {
		return "member/mlogin";
	}
	@RequestMapping(value = "/logout.gt", method = RequestMethod.GET)
	public String logout(HttpSession  session, HttpServletRequest request) {		
		session.invalidate();
		System.out.println("회원 로그아웃");
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
		System.out.println(mem_address);
		String post = st.nextToken();       
		String address1 = st.nextToken();      
		String address2 = st.nextToken();      
		System.out.println(post);
		System.out.println(address1);
		System.out.println(address2);
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
		public ModelAndView passCheckPost(@RequestParam("new_pw") String new_pw, @RequestParam("new_pw2") String new_pw2,
				MemberBean bean, ModelAndView mav, HttpServletResponse response, RedirectAttributes ra) throws Exception {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			String mem_id = authentication.getName();
			System.out.println("비밀번호 변경하러 왔나~");
			bean.setMem_id(mem_id);
			System.out.println("빈 한번 보자 : " + bean);
			int result = memberService.passCheck(bean);
			System.out.println("비밀번호 체크 : " + result);
			if(result != 1) {
				System.out.println("현재비밀번호가 안 맞을때");
				ra.addFlashAttribute("resultMsg", "fail1");
				mav.setViewName("member/mypage");
			}else if(!new_pw.equals(new_pw2)){
				System.out.println("새로운 비밀번호와 비밀번호 확인이 안 맞을때");
				ra.addFlashAttribute("resultMsg", "fail2");
				mav.setViewName("member/mypage");
			}else {
				System.out.println("잘 들어왔네");
				bean.setMem_pw(new_pw);
				int changeResult = memberService.changePasswordReal(bean);
				System.out.println("변경결과"+changeResult);
				if(changeResult != 0) {
					System.out.println("비밀번호 변경이 성공했네");
					ra.addFlashAttribute("resultMsg", "success");
					mav.setViewName("member/mypage");
				}else {
					ra.addFlashAttribute("resultMsg", "fail3");
					mav.setViewName("member/mypage");
				}
			}
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
}
