package kr.co.gotthem.member.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletRequest;
import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.member.service.MemberService;

@Controller
public class MemberController {
	
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
	public String joinSccess(MemberBean memberBean) {
		System.out.println(memberBean);
		memberService.insert(memberBean);
		return "redirect:index.gt";
	}
	
	@RequestMapping(value = "/index.gt", method = RequestMethod.GET)
	public String index() {	
		return "redirect:index.jsp";
	}

	@RequestMapping(value = "/myPage.gt", method = RequestMethod.GET)
	public String memberIndex() {
		
		
			List<MemberBean> list = new ArrayList<MemberBean>();
			list = memberService.mlist();
			System.out.println(list);
		
		
		return "store/storeIndex";
	}
	
}
