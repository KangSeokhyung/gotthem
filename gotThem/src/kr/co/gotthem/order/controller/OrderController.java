package kr.co.gotthem.order.controller;

import java.util.ArrayList;
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
import org.springframework.ui.Model;
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
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	private OrderService orderService;
	private BasketService basketService;
	private ProductService productService;
	private MemberService memberService;
	
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
    @RequestMapping(value ="insertOrder.gt",method = RequestMethod.GET)
    public String insert(@RequestParam String bas_no, @RequestParam String bas_prostock, @RequestParam String bas_procode,
    		            @RequestParam String bas_proname,@RequestParam String money,
    		HttpSession session,HttpServletRequest req,HttpServletResponse res,@ModelAttribute OrderpayBean orderBean)throws Exception {
    	
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	String mem_id = authentication.getName();
    	
    	MemberBean memberInfo = memberService.memberInfo(mem_id);
    	int userNo = memberInfo.getMem_no();     	
     	     orderBean.setOrd_memno(userNo);      	 
        	 orderBean.setOrd_stock(Integer.parseInt(bas_prostock));
        	 orderBean.setOrd_procode(Integer.parseInt(bas_procode));
        	 orderBean.setOrd_proname(bas_proname);
        	 orderBean.setOrd_price(Integer.parseInt(money));   	
        	 orderService.insertOrder(orderBean);
             System.out.println("새로 셋팅된 orderBean" + orderBean);
        	 System.out.println("결제 완료" );
        
       return "redirect:/list.gt";
    }

    // 2. 결제 목록ㅍㅍ
    @RequestMapping("listOrder.gt")
    public ModelAndView listBasket(HttpSession session, ModelAndView mav){
    	
    	/*.int userNo = (int) session.getAttribute("mem_no"); // session에 저장된 userId
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
    */
