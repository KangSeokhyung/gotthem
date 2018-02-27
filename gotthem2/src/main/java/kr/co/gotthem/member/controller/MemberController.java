package kr.co.gotthem.member.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.member.service.MemberService;
import kr.co.gotthem.product.service.ProductService;

@Controller
public class MemberController {
	
	private MemberService memberService;
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	private ProductService productService;
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	@RequestMapping(value = "/login.gt", method = RequestMethod.GET)
	public String login() {
		return "index";
	}

	@RequestMapping(value = "/myPage.gt", method = RequestMethod.GET)
	public String memberIndex() {
	
		return "store/storeIndex";
	}
	
	@RequestMapping(value = "/storeDetail.gt")
	public String storeDetail(Model model, int mem_no) {
		MemberBean storeInfo = memberService.storeInfo(mem_no);
		List productInfo = productService.productInfo(mem_no);
		
		model.addAttribute("mem_no", mem_no);
		model.addAttribute("storeInfo", storeInfo);
		model.addAttribute("productInfo", productInfo);
		
		return "store/storeDetail";
	}
	
}
