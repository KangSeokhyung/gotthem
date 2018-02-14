package kr.co.gotthem.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.gotthem.member.service.MemberService;
import kr.co.gotthem.store.bean.StoreBean;
import kr.co.gotthem.store.service.StoreService;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	private MemberService memberService;
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	private StoreService storeService;
	public void setStoreService(StoreService storeService) {
		this.storeService = storeService;
	}

	@RequestMapping(value = "/storeIndex.ad", method = RequestMethod.GET)
	public String storeIndex() {
		
		List<StoreBean> list = new ArrayList<StoreBean>();
		list = storeService.list();
		System.out.println(list+"값가져옵니까");
		System.out.println(memberService.mlist()+"##");
		
		return "store/storeIndex";
	}
	
	@RequestMapping(value = "/storeIndex.gt", method = RequestMethod.GET)
	public String storeIndex2() {
		
		System.out.println("aaaaaa");
		System.out.println("두번쨰테스트dddd");
		List<StoreBean> list = new ArrayList<StoreBean>();
		list = storeService.list();
		System.out.println(list+"잘된다");
		
		return "store/storeIndex";
	}
}
