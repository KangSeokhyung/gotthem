package kr.co.gotthem.basket.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gotthem.basket.bean.BasketBean;
import kr.co.gotthem.basket.service.BasketService;

@Controller
public class BasketController {
	
	private static final Logger logger = LoggerFactory.getLogger(BasketController.class);
	
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
	 
	
	// 1. 장바구니 추가
    @RequestMapping("/insert.gt")
    public String insert(@ModelAttribute BasketBean basketBean, HttpSession session){
    	/* int userNo = (int) session.getAttribute("mem_no");*/
    	int userNo = 1;
    	basketBean.setBas_memno(userNo);
    
        // 장바구니에 기존 상품이 있는지 검사
        int count = basketService.countBasket(basketBean.getBas_procode(),basketBean.getBas_memno());
        
        System.out.println("count  " + count);
        /*count == 0 ? basketService.updateCart(basketBean) : basketService.insert(basketBean);*/
        if(count == 0){
            // 없으면 insert
        	basketService.insert(basketBean);
        } else {
            // 있으면 update
        	basketService.updateCart(basketBean);
        }
    	System.out.println("insert 끝");
       
        return "redirect:/list.gt";
    }
 // 2. 장바구니 목록
    @RequestMapping("list.gt")
    public ModelAndView list(HttpSession session, ModelAndView mav){
    	
   /* 	int userNo = (int) session.getAttribute("mem_no"); // session에 저장된 userId
*/    	int userNo = 1;
    	Map<String, Object> map = new HashMap<String, Object>();
        List<BasketBean> list = basketService.listCart(userNo); // 장바구니 정보 
        System.out.println("list " + list);
        int sumMoney = basketService.sumMoney(userNo);// 장바구니 전체 금액 호출
        System.out.println("userNo  "+userNo );
        System.out.println("sumMoney  "+sumMoney );
        // 장바구니 전체 긍액에 따라 배송비 구분
        // 배송료(10만원이상 => 무료, 미만 => 2500원)
       /* int fee = sumMoney >= 100000 ? 0 : 2500;*/
        map.put("list", list);                // 장바구니 정보를 map에 저장
        map.put("count", list.size());        // 장바구니 상품의 유무
        map.put("sumMoney", sumMoney);        // 장바구니 전체 금액
        /* map.put("fee", fee);                 // 배송금액
        map.put("allSum", sumMoney+fee);    // 주문 상품 전체 금액*/
        mav.setViewName("basket/cartList");    // view(jsp)의 이름 저장
        mav.addObject("map", map);            // map 변수 저장
        return mav;
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
