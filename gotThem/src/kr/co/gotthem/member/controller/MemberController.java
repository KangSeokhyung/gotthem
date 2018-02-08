package kr.co.gotthem.member.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.gotthem.member.service.MemberService;
import kr.co.gotthem.store.bean.StoreBean;

@Controller
public class MemberController {
	 
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	private MemberService memberService;

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String memberJoin() {	
		System.out.println("오는지확인");
		System.out.println("오는지확인");
		System.out.println("오는지확인");
		System.out.println("오는지확인");
		System.out.println("오는지확인");
		System.out.println("오는지확인");
		System.out.println("오는지확인");
		System.out.println("오는지확인");
		return "member/join";
	}
	

	@RequestMapping(value = "/myPage.gt", method = RequestMethod.GET)
	public String memberIndex() {
		
		
			List<StoreBean> list = new ArrayList<StoreBean>();
			list = memberService.list();
			System.out.println(list);
		
		
		return "store/storeIndex";
	}
	
	
}
