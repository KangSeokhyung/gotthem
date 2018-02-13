package kr.co.gotthem.basket.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.gotthem.basket.bean.BasketBean;
import kr.co.gotthem.basket.service.BasketService;
import kr.co.gotthem.store.controller.StoreController;


@Controller
public class BasketController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	private BasketService basketService;

	public void setBasketService(BasketService basketService) {
		this.basketService = basketService;
	}

	@RequestMapping(value = "/basketIndex.gt", method = RequestMethod.GET)
	public String basketIndex() {


			System.out.println("테스트");
			List<BasketBean> list = new ArrayList<BasketBean>();
			list = basketService.list();
			System.out.println(list);	
		return "basket/productList";
	}
	
   /* @RequestMapping(value = "/loginForm.st", method = RequestMethod.GET)
	public String loginForm() {
		return "store/storeLogin";
	}*/
	
	/*@RequestMapping(value = "/login.st", method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpSession session) throws Exception{
		
		String sto_id = request.getParameter("sto_id");
		String sto_pw = request.getParameter("sto_pw");
		
		StoreBean dto = storeService.FindById(sto_id);
		
		session.setAttribute("sto_id", sto_id);
		if(dto==null) {
			return "store/fail2";
		}
		
		String pw = dto.getSto_pw();
		
		if(sto_pw.equals(pw)) {
			session.setAttribute("sto_id", sto_id);
		}else {
			return "fail";
		}
		return "store/storeIndex";
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
		
		System.out.println(id); System.out.println(pw);
		MemberBean result = (MemberBean)memberService.login(id);
		
		System.out.println(result);
		
		if (result != null) {
		session.setAttribute("id", id);
		System.out.println("로그인 됨");
		return "redirect:index.jsp";
		}
		System.out.println("로그인 안됨");
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
		
		
			List<StoreBean> list = new ArrayList<StoreBean>();
			list = memberService.list();
			System.out.println(list);
		
		
		return "store/storeIndex";
	}*/
	
}
