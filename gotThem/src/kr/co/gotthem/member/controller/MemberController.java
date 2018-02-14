package kr.co.gotthem.member.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
	private StoreService storeService;
	public void setStoreService(StoreService storeService) {
		this.storeService = storeService;
	}

	@RequestMapping(value = "/login.gt", method = RequestMethod.GET)
	public ModelAndView login(

		@RequestParam(value = "error", required = false) String error,

		@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();

		if (error != null) {

			model.addObject("error", "사용자 이름 및 비밀번호가 올바르지 않습니다.");

		}
		
		if (logout != null) {

			model.addObject("msg", "로그아웃 되었습니다.");

		}

		model.setViewName("member/mlogin");

		return model;
	}
	
	
	@RequestMapping(value = "/login.gt", method = RequestMethod.POST)
	public String getlogin(HttpSession  session, HttpServletRequest request, 
			@RequestParam("m_id") String id, @RequestParam("m_pass") String pw) {
		/*
		System.out.println(id); System.out.println(pw);
		MemberBean result = (MemberBean)memberService.login(id);
		
		System.out.println(result);
		
		if (result != null) {
		session.setAttribute("id", id);
		System.out.println("로그인 됨");
		return "redirect:index.jsp";
		}
		System.out.println("로그인 안됨");*/
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
