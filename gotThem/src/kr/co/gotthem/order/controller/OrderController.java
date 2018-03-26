package kr.co.gotthem.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gotthem.basket.bean.BasketBean;
import kr.co.gotthem.basket.service.BasketService;
import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.member.service.MemberService;
import kr.co.gotthem.order.bean.OrderpayBean;
import kr.co.gotthem.order.service.OrderService;
import kr.co.gotthem.product.service.ProductService;

@Controller
public class OrderController {
	
	private OrderService orderService;
	private MemberService memberService;
	private BasketService basketService;
	private ProductService productService;
	
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	public void setBasketService(BasketService basketService) {
		this.basketService = basketService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
   // 1. 장바구니에서 결제 추가
   @RequestMapping(value ="insertOrder.gt",method = RequestMethod.GET)
    public String insertOrder(@RequestParam String bas_no, @RequestParam String bas_prostock, @RequestParam String bas_procode,
    		            @RequestParam String bas_proname,@RequestParam String money, @RequestParam String bas_proimg, 
    		            @RequestParam String bas_proprice,@RequestParam String pro_memno,@RequestParam String sto_name,
    		@ModelAttribute OrderpayBean orderBean,HttpServletRequest req, HttpServletResponse res )throws Exception {
	   
	   Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	   String mem_id = authentication.getName();
       System.out.println("결제 왔다" );
       
       MemberBean memberInfo = memberService.memberInfo(mem_id);
       int userNo = memberInfo.getMem_no();
       orderBean.setOrd_memno(userNo);
   	
       orderBean.setOrd_proprice(Integer.parseInt(bas_proprice));
   	   orderBean.setOrd_stock(Integer.parseInt(bas_prostock));
   	   orderBean.setOrd_procode(Integer.parseInt(bas_procode));
   	   orderBean.setOrd_proname(bas_proname);
   	   orderBean.setOrd_price(Integer.parseInt(money)); 
   	   orderBean.setOrd_basno(Integer.parseInt(bas_no));
       orderBean.setOrd_proimg(bas_proimg);
   	   orderBean.setOrd_no(Integer.parseInt(bas_no));
   	   orderBean.setPro_memno(Integer.parseInt(pro_memno));
   	   orderBean.setSto_name(sto_name);
 
   	   orderService.orderInsert(orderBean);
   	   orderService.orderUpdateBasket(orderBean);
   	   orderService.orderDeleteBasket(orderBean);
   	   System.out.println("결제 완료 변경된 수량" + bas_prostock );
   	   return "redirect:/orderList.gt";
   	   }
    
  // 1.1 장바구니에서 선택 결제
   @RequestMapping(value = "selectOrder.gt", method = RequestMethod.POST) 
   public String testCheck(@RequestParam (value= "arrOrder[]") List valueArr,
   		@ModelAttribute BasketBean basketBean,@ModelAttribute OrderpayBean orderBean,
   		HttpServletRequest req, HttpServletResponse res) throws Exception {	   
	   Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	   String mem_id = authentication.getName();
	   
	   MemberBean memberInfo = memberService.memberInfo(mem_id);  
       int userNo = memberInfo.getMem_no();
       String A = null;
       for(int i=0; i<valueArr.size(); i++){
    	   A = (String) valueArr.get(i);
    	   System.out.println("선택결제 여기값"+A.toString());
    	   if ( 2==A.length()) {
    		   continue;
    		   } else {
    	   java.util.StringTokenizer  st = new java.util.StringTokenizer(A,",");
    	   String bas_no = st.nextToken();
       	   String bas_proname = st.nextToken();
       	   String bas_proprice = st.nextToken(); 
       	   String bas_prostock = st.nextToken();
       	   String bas_procode = st.nextToken();
    	   String money = st.nextToken();
    	   String bas_proimg = st.nextToken();
       	   String bas_procomment = st.nextToken();
           String pro_memno = st.nextToken();
       	   String sto_name = st.nextToken();

       	   orderBean.setOrd_memno(userNo);       
           orderBean.setOrd_basno(Integer.parseInt(bas_no));        
           orderBean.setOrd_proname(bas_proname);
           orderBean.setOrd_proprice(Integer.parseInt(bas_proprice));
           orderBean.setOrd_stock(Integer.parseInt(bas_prostock));
           orderBean.setOrd_procode(Integer.parseInt(bas_procode));
           orderBean.setOrd_price(Integer.parseInt(money));
           orderBean.setOrd_proimg(bas_proimg);
           orderBean.setPro_memno(Integer.parseInt(pro_memno));
           orderBean.setSto_name(sto_name);

           orderService.orderInsert(orderBean);
 	       orderService.orderUpdateBasket(orderBean);
   	       orderService.orderDeleteBasket(orderBean); 	 
   	       System.out.println("선택결제 성공");
   	       }
        }
       return "redirect:/orderList.gt";
       }
 
      // 3. 아이디별 전체 결제 목록
     @RequestMapping("/orderList.gt")
     public ModelAndView listOrder(ModelAndView mav)throws Exception {
    	 
    	 Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	 String mem_id = authentication.getName();
    	 MemberBean memberInfo = memberService.memberInfo(mem_id);
    	 int userNo = memberInfo.getMem_no();
    	 
    	 Map<String, Object> map = new HashMap<String, Object>();
         List<OrderpayBean> listOrder = orderService.listOrder(userNo); // 장바구니 정보 
         map.put("list",listOrder);
         mav.setViewName("/basket/orderList");
         mav.addObject("map", map);
         return mav;
         }

     // 3. 결제 취소 삭제
     @RequestMapping("deleteOrder.gt")
     public String deleteAOrder(@RequestParam int ord_no,@RequestParam int ord_stock,@RequestParam int ord_procode,
    		 @ModelAttribute OrderpayBean orderBean )throws Exception {
    	    
    	 orderBean.setOrd_stock(ord_stock);
    	 orderBean.setOrd_procode(ord_procode);
    	 orderService.orderDelete(ord_no);
    	 orderService.orderUpdateProduct(orderBean);
	     System.out.println("Order삭제 실행");
	     return "redirect:/orderList.gt";
	     }
     

     
	// 3. 사장님 아이디별 전체 결제 목록
	@RequestMapping("/storeOrderList.st")
	public ModelAndView listOrderStore( ModelAndView mav) throws Exception {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mem_id = authentication.getName();
		MemberBean memberInfo = memberService.memberInfo(mem_id);
	
		int userNo = memberInfo.getMem_no();
		String userName = memberInfo.getSto_name();

		Map<String, Object> map = new HashMap<String, Object>();
		List<OrderpayBean> slistOrder = orderService.storeListOrder(userName);
/*		List<OrderpayBean> slistOrder = orderService.storeListOrder(userNo);
*/		System.out.println("storeLisOrder타고 " + slistOrder);
		map.put("list", slistOrder);
		mav.setViewName("/store/storeOrderList");
		mav.addObject("map", map);
		return mav;
	}
	

	// 3.1 사장님 아이디 기간별 결제 목록
	@RequestMapping("/storeOrderListTime.st")
	public ModelAndView listOrderStore(@RequestParam String from, @RequestParam String to, ModelAndView mav)
			throws Exception {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mem_id = authentication.getName();
		MemberBean memberInfo = memberService.memberInfo(mem_id);
		int userNo = memberInfo.getMem_no();
		String userName = memberInfo.getSto_name();

		String from1 = from + " 00:00:00.0";
		java.sql.Timestamp begin = java.sql.Timestamp.valueOf(from1);
		String to1 = to + " 23:59:59.9";
		java.sql.Timestamp end = java.sql.Timestamp.valueOf(to1);
		
		
		System.out.println("begin은 " + begin);
		System.out.println("end은 " + end);
		Map<String, Object> map = new HashMap<String, Object>();
		List<OrderpayBean> slistOrder = orderService.storeListOrderTime(userNo, begin, end);
		System.out.println("Time " + slistOrder);
		
		map.put("begin", from);
		map.put("end", to);
		map.put("list", slistOrder);
		mav.setViewName("/store/storeOrderListTime");
		mav.addObject("map", map);
		return mav;
	}
	@RequestMapping("/test.gt")
	public String test2() {
		return "basket/purchase";
	}
	
	@RequestMapping(value="/payment.gt", method = RequestMethod.POST)
    @ResponseBody
	public HashMap payment(String accessToken, HttpSession session,
			@RequestParam (value= "arrOrder[]") List valueArr) throws Exception {
		
		System.out.println("접속된 토큰 : " + accessToken);
		@SuppressWarnings("rawtypes")
        HashMap result = orderService.pay(accessToken, HashMap.class,valueArr);
        System.out.println("페이한 결과 : " + result);
		session.setAttribute("tid",result.get("tid"));
        session.setAttribute("accessToken", accessToken);
    return result;
    }
 
	
	// 단건 결제 api
	@RequestMapping(value="/paymentOne.gt", method = RequestMethod.POST)
    @ResponseBody
	public HashMap paymentOne(String accessToken, HttpSession session,
			@RequestParam String orderOne) throws Exception {
		System.out.println("접속된 토큰 : " + accessToken);
		@SuppressWarnings("rawtypes")
        HashMap result = orderService.payOne(accessToken, HashMap.class, orderOne);
        
		System.out.println("페이한 결과 : " + result);
		System.out.println("orderOne : " + orderOne);
		session.setAttribute("tid",result.get("tid"));
        session.setAttribute("accessToken", accessToken);
        session.setAttribute("orderOne", orderOne);
       
    return result;
    }
	
	@RequestMapping(value="/approveOne.gt")
    public ModelAndView approveOne(HttpServletRequest req,HttpSession session, ModelAndView mav) throws Exception {
        String orderOne = (String)session.getAttribute("orderOne");
		session.removeAttribute("orderOne");
		String pg_Token = req.getParameter("pg_token");
        System.out.println("pg_Token:승인컨트롤"+pg_Token);
        System.out.println("승인orderOne: "+ orderOne);
        
        @SuppressWarnings("rawtypes")
        HashMap result = orderService.approveOne(pg_Token,session,HashMap.class,orderOne);
        System.out.println("승인컨트롤 돌아옴 ");
        
        System.out.println("orderOne서비스 "+ orderOne);
       
        java.util.StringTokenizer  st = new java.util.StringTokenizer(orderOne,",");
        String bas_no = st.nextToken();
    	String bas_proname = st.nextToken();
    	String bas_proprice = st.nextToken(); 
    	String bas_prostock = st.nextToken();
    	String bas_procode = st.nextToken();
 	    String money = st.nextToken();
 	    String bas_proimg = st.nextToken();
    	String bas_procomment = st.nextToken();
        String pro_memno = st.nextToken();
    	String sto_name = st.nextToken();
    	String bas_memno = st.nextToken();
    	
    	OrderpayBean orderBean = new OrderpayBean();
    	orderBean.setOrd_memno(Integer.parseInt(bas_memno));      
        orderBean.setOrd_basno(Integer.parseInt(bas_no));        
        orderBean.setOrd_proname(bas_proname);
        orderBean.setOrd_proprice(Integer.parseInt(bas_proprice));
        orderBean.setOrd_stock(Integer.parseInt(bas_prostock));
        orderBean.setOrd_procode(Integer.parseInt(bas_procode));
        orderBean.setOrd_price(Integer.parseInt(money));
        orderBean.setOrd_proimg(bas_proimg);
        orderBean.setPro_memno(Integer.parseInt(pro_memno));
        orderBean.setSto_name(sto_name);
        
        orderService.orderInsert(orderBean);
	    orderService.orderUpdateBasket(orderBean);
	    orderService.orderDeleteBasket(orderBean); 
	    int userNo = orderBean.getOrd_memno();
	    orderService.listOrder(userNo);
	    System.out.println("결제 db연동");

        mav.addObject("result", result);
        mav.setViewName("basket/purchase");
        return mav;
          
	}
	 
	 
	
    @RequestMapping(value="/approve.gt")
    public ModelAndView approve(HttpServletRequest req,HttpSession session, ModelAndView mav) throws Exception {
        String pg_Token = req.getParameter("pg_token");
        System.out.println("pg_Token:승인컨트롤"+pg_Token);
        @SuppressWarnings("rawtypes")
        HashMap result = orderService.approve(pg_Token,session,HashMap.class);
        mav.addObject("result", result);
        mav.setViewName("basket/purchase");
        return mav;
        }
	
}
