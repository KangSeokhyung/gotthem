package kr.co.gotthem.member.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mariadb.jdbc.internal.logging.Logger;
import org.mariadb.jdbc.internal.logging.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.member.service.MemberService;
import kr.co.gotthem.store.service.StoreService;

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
		return "redirect:index.jsp";
	}
	
	@RequestMapping(value = "/join.gt", method = RequestMethod.GET)
	public String memberJoin() {	
		return "member/join";
	}
	
	@RequestMapping(value = "/joinSccess.gt", method = RequestMethod.POST)
	public String joinSccess(MemberBean memberBean, HttpServletResponse response) throws Exception {
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

	@RequestMapping(value = "test.gt", method = RequestMethod.GET)
	public String test() {
		return "member/test";
	}
	
	
}
