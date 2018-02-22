package kr.co.gotthem.admin.controller;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		
		/*List<MemberBean> mlist = memberService.mlist();		
		System.out.println("멤버 컨트롤 진입");
		System.out.println(mlist);
		
		mav.addObject("stlist", mlist);*/
		mav.setViewName("admin/memberControl");
		
		return mav;
		
	}

}
