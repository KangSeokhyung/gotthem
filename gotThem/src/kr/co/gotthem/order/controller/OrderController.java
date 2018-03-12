package kr.co.gotthem.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	private BasketService basketService;
	private ProductService productService;
	private MemberService memberService;
	private OrderService ord_no;
	
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public void setBasketService(BasketService basketService) {
		this.basketService = basketService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

   // 1. 장바구니에서 결제 추가
   @RequestMapping(value ="insertOrder.gt",method = RequestMethod.GET)
    public String insertOrder(@RequestParam String bas_no, @RequestParam String bas_prostock, @RequestParam String bas_procode,
    		            @RequestParam String bas_proname,@RequestParam String money,
    		HttpSession session,HttpServletRequest req,HttpServletResponse res,
    		@ModelAttribute OrderpayBean orderBean )throws Exception {
	   
	   Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	   String mem_id = authentication.getName();
       System.out.println("결제 왔다" );
       
       MemberBean memberInfo = memberService.memberInfo(mem_id);
       int userNo = memberInfo.getMem_no();
       orderBean.setOrd_memno(userNo);
   	   orderBean.setOrd_stock(Integer.parseInt(bas_prostock));
   	   orderBean.setOrd_procode(Integer.parseInt(bas_procode));
   	   orderBean.setOrd_proname(bas_proname);
   	   orderBean.setOrd_price(Integer.parseInt(money)); 
   	   orderBean.setOrd_no(Integer.parseInt(bas_no));
   	   
   	   orderService.orderInsert(orderBean);
   	   orderService.orderUpdateBasket(orderBean);
   	   orderService.orderDeleteBasket(orderBean);
   	   System.out.println("결제 완료 변경된 수량" + bas_prostock );
   	   return "redirect:/orderList.gt";
   	   }
    
  // 1.1 장바구니에서 선택 결제
   @RequestMapping(value = "selectOrder.gt", method = RequestMethod.POST) 
   public String testCheck(@RequestParam (value= "arrOrder[]") List valueArr,
   		@ModelAttribute BasketBean basketBean,@ModelAttribute OrderpayBean orderBean) throws Exception {
	   
	   Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	   String mem_id = authentication.getName();
	   
	   MemberBean memberInfo = memberService.memberInfo(mem_id);  
       int userNo = memberInfo.getMem_no();
       System.out.println("valueArr은" + valueArr);
       
       String A = null;
       for(int i=0; i<valueArr.size(); i++){
    	   A = (String) valueArr.get(i);
    	   System.out.println("여기값"+A.toString());
    	   java.util.StringTokenizer  st = new java.util.StringTokenizer(A,",");
    	   String bas_no = st.nextToken();
       	   String bas_proname = st.nextToken();
       	   String bas_proprice = st.nextToken(); 
       	   String bas_prostock = st.nextToken();
       	   String bas_procode = st.nextToken();
    	   String money = st.nextToken();
    	   String bas_proimg = st.nextToken();
       	   String bas_procomment = st.nextToken();
       	   
       	   orderBean.setOrd_memno(userNo);       
           orderBean.setOrd_no(Integer.parseInt(bas_no));        
           orderBean.setOrd_proname(bas_proname);
           orderBean.setOrd_stock(Integer.parseInt(bas_prostock));
           orderBean.setOrd_procode(Integer.parseInt(bas_procode));
           orderBean.setOrd_price(Integer.parseInt(money));
           
           orderService.orderInsert(orderBean);
 	       orderService.orderUpdateBasket(orderBean);
   	       orderService.orderDeleteBasket(orderBean); 	 
   	       System.out.println("결제 변경된 수량" + bas_prostock );
   	       }
       return "redirect:/orderList.gt";
       }
 
   // 1.2 상품에서 결제 추가
   
      // 3. 아이디별 전체 결제 목록
     @RequestMapping("/orderList.gt")
     public ModelAndView listOrder(ModelAndView mav,HttpSession session,
    		 HttpServletRequest req,HttpServletResponse res)throws Exception {
    	 
    	 Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	 String mem_id = authentication.getName();
    	 MemberBean memberInfo = memberService.memberInfo(mem_id);
    	 int userNo = memberInfo.getMem_no();
    	 
    	 Map<String, Object> map = new HashMap<String, Object>();
         List<OrderpayBean> listOrder = orderService.listOrder(userNo); // 장바구니 정보 
         System.out.println("listOrder타고 " + listOrder);
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
     }

