package kr.co.gotthem.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gotthem.basket.bean.BasketBean;
import kr.co.gotthem.basket.service.BasketService;
import kr.co.gotthem.order.bean.OrderBean;
import kr.co.gotthem.order.service.OrderService;
import kr.co.gotthem.product.service.ProductService;

@Controller
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	private OrderService orderService;
	private BasketService basketService;
	private ProductService productService;
	
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	
	public void setBasketService(BasketService basketService) {
		this.basketService = basketService;
	}
	
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
/*    // product 1. 상품 전체 목록
    @RequestMapping("/productlist.gt")
    public ModelAndView list(ModelAndView mav) {
        mav.setViewName("/basket/productList");
        mav.addObject("list", productService.listProduct());
        System.out.println("상품리스트왔다");
        return mav;
    }
    	// product 2. 상품 상세보기
    @RequestMapping("/detail/{pro_code}.gt")
    public ModelAndView detail(@PathVariable("pro_code") int pro_code, ModelAndView mav){
    	System.out.println("디테일왔다");
    	mav.setViewName("basket/productDetail");
        mav.addObject("m", productService.detailProduct(pro_code));
        return mav;
    }
    */
   
    // order 1. 결제 전체 목록
    @RequestMapping("/orderList.gt")
    public String order ( Model model) {
    	List<String> orderList = new ArrayList<String> ();
    	orderList.add("1");
    	orderList.add("2");
    	orderList.add("3");
    	model.addAttribute("ordelList", orderList);
    	return "basket/orderList";
    }

     
   // 1. 결제 추가
    @RequestMapping("insertOrder.gt")
    public String insert(@RequestParam String bas_prostock, @RequestParam String bas_procode,
    		            @RequestParam String bas_proname,@RequestParam String money,
    		HttpSession session){
    	/*int userNo = (int) session.getAttribute("mem_no"); */       	
    	int userNo = 1;
    	/*orderBean.setOrd_memno(userNo);
          // 없으면 insert
        	 System.out.println("orderBean insert하기 전   " + orderBean);
      	     orderBean.setOrd_proname(basketBean.getBas_proname());
      	   System.out.println("orderBean insert하기 전   " + orderBean);
        	 orderBean.setOrd_price(orderBean.getOrd_price());
        	 orderBean.setOrd_stock(orderBean.getOrd_stock());
        	 orderBean.setOrd_procode(orderBean.getOrd_procode());
        	 orderService.insertOrder(orderBean);*/       	 
        	 System.out.println("bas_prostock" + bas_prostock );
        	 System.out.println("bas_procode" + bas_procode );
        	 System.out.println("bas_proname" + bas_proname );
        	 System.out.println("money" + money );
        	 System.out.println("0==insert 실행" );
        	 OrderBean orderBean = new OrderBean();
        	 orderBean.setOrd_memno(userNo); 
        	 orderBean.setOrd_stock(Integer.parseInt(bas_prostock));
        	 orderBean.setOrd_procode(Integer.parseInt(bas_procode));
        	 orderBean.setOrd_proname(bas_proname);
        	 orderBean.setOrd_price(Integer.parseInt(money));
        	 orderService.insertOrder(orderBean);
            System.out.println("새로 셋팅된 orderBean" + orderBean);
        	
        	
        	
         /*else {
            // 있으면 update
        	orderService.updateBasket(basketBean);
        	System.out.println("0아닐때 insert 실행" );*/
        
       return "redirect:/list.gt";
    }

    // 2. 장바구니 목록
    @RequestMapping("listO.gt")
    public ModelAndView listBasket(HttpSession session, ModelAndView mav){
    	
    	/*int userNo = (int) session.getAttribute("mem_no"); // session에 저장된 userId
*/    	int userNo = 1;
    	Map<String, Object> map = new HashMap<String, Object>();
        List<BasketBean> listBasket = basketService.listBasket(userNo); // 장바구니 정보 
        System.out.println("list타고,listBasket " + listBasket);
        int sumMoney = basketService.sumMoney(userNo);// 장바구니 전체 금액 호출
        System.out.println("userNo  "+userNo );
        System.out.println("sumMoney  "+sumMoney );
        // 장바구니 전체 긍액에 따라 배송비 구분 , 배송료(10만원이상 => 무료, 미만 => 2500원)
         int fee = sumMoney >= 100000 ? 0 : 2500;
        map.put("list", listBasket);                // 장바구니 정보를 map에 저장
        map.put("count", listBasket.size());        // 장바구니 상품의 유무
        System.out.println("listBasket.size()"+ listBasket.size());
        map.put("sumMoney", sumMoney);        // 장바구니 전체 금액
         map.put("fee", fee);                 // 배송금액
        map.put("allSum", sumMoney+fee);    // 주문 상품 전체 금액
        mav.setViewName("basket/cartList");    // view(jsp)의 이름 저장
        mav.addObject("map", map);            // map 변수 저장
        System.out.println("mav  "+mav );
        return mav;
    }}
    
/*    // 3. 장바구니 삭제
    @RequestMapping("delete.gt")
    public String delete(@RequestParam int bas_no){
    	basketService.deleteBasket(bas_no);
    	System.out.println("삭제 실행");
        return "redirect:/shop/cart/list.gt";
        return "redirect:/list.gt";
    }
   }*/
    
    /*    
   // 4. 장바구니 수정
    @RequestMapping("update.gt")
    public String update(@RequestParam String[] bas_prostock, @RequestParam String[] bas_procode, HttpSession session) {
    
        String userId = (String) session.getAttribute("userId");// session의 id
        int userNo = (int) session.getAttribute("mem_no"); // session에 저장된 userId  
     	int userNo = 1;
     	System.out.println("update왔다");     	
     	// 레코드의 갯수 만큼 반복문 실행
        for(int i=0; i< bas_procode.length; i++){
        	BasketBean basketBean = new BasketBean();
        	basketBean.setBas_memno(userNo); 
        	basketBean.setBas_prostock(Integer.parseInt((bas_prostock[i])));
        	basketBean.setBas_procode(Integer.parseInt((bas_procode[i])));
            basketService.modifyBasket(basketBean);
            System.out.println("update 완료");
        }
        return "redirect:/list.gt";
    }
    

    @RequestMapping(value = "/loginForm.st", method = RequestMethod.GET)
	public String loginForm() {
		return "store/storeLogin";
	}
	
	@RequestMapping(value = "/login.st", method = RequestMethod.POST)
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
	}
	
}
*/