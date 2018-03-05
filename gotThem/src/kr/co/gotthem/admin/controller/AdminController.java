package kr.co.gotthem.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

@Controller
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	private MemberService memberService;

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@RequestMapping(value = "/admin.ad", method = RequestMethod.GET)
	public String storeIndex() {
		System.out.println("아에이오우!");
		return "admin/adminLogin";
	}

	@RequestMapping(value = "/control.ad", method = RequestMethod.GET)
	public String ccc() {
		System.out.println("최종 관리자 로그인 진입");
		return "admin/controlPage";
	}

	@RequestMapping(value = "/memcontrol.ad", method = RequestMethod.GET)
	public ModelAndView member(ModelAndView mav) {

		List<MemberBean> mlist = memberService.mlist();
		System.out.println("멤버 컨트롤 진입"); System.out.println(mlist);
		 
		mav.addObject("mlist", mlist);
		mav.setViewName("admin/memberControl");

		return mav;

	}

	@RequestMapping(value = "/storecontrol.ad", method = RequestMethod.GET)
	public ModelAndView store(ModelAndView mav, MemberBean bean) {

		List<MemberBean> stlist = memberService.stlist();
		System.out.println("스토어 컨트롤 진입");
		
		System.out.println();	  
		
		for(MemberBean abc : stlist) {
			System.out.println(abc);
			int abb = abc.getEnabled();
		}
		
		mav.addObject("stlist", stlist);		
		mav.setViewName("admin/storeControl");
		
		

		return mav;
	}
	
	@RequestMapping(value = "/storemodify.ad", method = RequestMethod.POST)
	public ModelAndView storemodi(ModelAndView mav, 
		@RequestParam(required=false) String enable, 
		MemberBean mbean, HttpServletRequest request, HttpSession session) {		
		
		int approve = 0;
		
		if(enable.equals("승인완료")) {
			approve = 1;
		} else {
			approve = 0;
		}
		
		mbean.setMem_id(request.getParameter("mem_id"));
		mbean.setMem_name(request.getParameter("mem_name"));
		mbean.setSto_name(request.getParameter("sto_name"));
		mbean.setMem_email(request.getParameter("mem_email"));
		mbean.setMem_address(request.getParameter("mem_addr1")+"/"+
		request.getParameter("mem_addr2")+"/"+request.getParameter("mem_addr3"));
		mbean.setEnabled(approve);
		System.out.println(mbean);
		System.out.println(approve);
		
		memberService.memModi(mbean);
	
		mav.setViewName("admin/controlPage");

		return mav;
	}
	
	@RequestMapping(value = "/memmodify.ad", method = RequestMethod.POST)
	public ModelAndView memmodi(ModelAndView mav, 
			@RequestParam(required=false) String enable,
			MemberBean membean, HttpServletRequest request) {
		
		int approve = 0;
		

		if(enable.equals("가입")) {
			approve = 1;
		} else {
			approve = 0;
		}

		membean.setMem_id(request.getParameter("mem_id"));
		membean.setMem_name(request.getParameter("mem_name"));
		membean.setMem_email(request.getParameter("mem_email"));
		membean.setMem_email(request.getParameter("mem_phone"));
		membean.setMem_address(request.getParameter("mem_addr1")+"/"+
		request.getParameter("mem_addr2")+"/"+request.getParameter("mem_addr3"));
		membean.setEnabled(approve);
		
		memberService.memModi(membean);
		
		mav.setViewName("admin/controlPage");

		return mav;
	}
}
