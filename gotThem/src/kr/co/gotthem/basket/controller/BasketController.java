package kr.co.gotthem.basket.controller;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gotthem.basket.bean.BasketBean;
import kr.co.gotthem.basket.service.BasketService;
import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.member.service.MemberService;
import kr.co.gotthem.order.service.OrderService;
import kr.co.gotthem.product.service.ProductService;

@Controller
public class BasketController {
	
	private static final Logger logger = LoggerFactory.getLogger(BasketController.class);
	
	private BasketService basketService;
	private ProductService productService;
	private OrderService orderService;
	private MemberService memberService;
	
	public void setBasketService(BasketService basketService) {
		this.basketService = basketService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
/*	 @RequestMapping("/testa.gt")
	    public String test() {
		 return "basket/NewFile";
	 }       
	 @RequestMapping(value="/updateChkBox")
	   public @ResponseBody String updateChkBox (
	       HttpServletRequest request,
	       HttpServletResponse response,
	       @RequestParam(value="name",required=true) List<String> name,
	       @RequestParam(value="age",required=true) List<Integer> age) throws Exception {    
	     log.debug( ">>> param size : " + name.size() );
	      
	     int i = 0;
	     for( String value : name ){
	       log.debug( ">>> name's value : " + value + "\tage : " + age.get(i) );
	       i++;
	     }
	      
	     return "success";
	   }*/
	
	// product 1. 상품 전체 목록
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
   
    // 1. 장바구니 추가
    @RequestMapping(value ="insert.gt")
    public String insertBasket(@ModelAttribute BasketBean basketBean,
    		HttpServletRequest req,HttpServletResponse res,HttpSession session) throws Exception {
    	System.out.println("장바구니 추가왔다");
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	String mem_id = authentication.getName();
    
    	MemberBean memberInfo = memberService.memberInfo(mem_id);  
        int userNo = memberInfo.getMem_no();
    	basketBean.setBas_memno(userNo);   
        
    	// 장바구니에 기존 상품이 있는지 검사
        int count = basketService.countBasket(basketBean.getBas_procode(),basketBean.getBas_memno());
        System.out.println("count  " + count);
        
        /*count == 0 ? basketService.updateBasket(basketBean) : basketService.insertBasket(basketBean);*/
        if(count == 0){
            // 없으면 insert
        	 basketBean.setBas_proname(basketBean.getBas_proname());
        	 basketBean.setBas_proprice(basketBean.getBas_proprice());
        	 basketBean.setBas_procategory(basketBean.getBas_procategory());
        	 basketBean.setBas_proexdate(basketBean.getBas_proexdate());
        	 basketService.insertBasket(basketBean);
        	System.out.println("0==insert 실행" );
        } else {
            // 있으면 update 동일 상품 존재시 기존 수량에 새로운 수량 더하기
        	basketService.updateBasket(basketBean);
        	System.out.println("0아닐때 insert 실행" );
        }
       return "redirect:/list.gt";
    }
 
    /// 2. 장바구니 목록
    @RequestMapping(value = "list.gt", method = RequestMethod.GET)
	public ModelAndView listBasket(HttpServletRequest req,HttpServletResponse res, 
			HttpSession session,ModelAndView mav) throws Exception {
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String mem_id = authentication.getName();
	
     	MemberBean memberInfo = memberService.memberInfo(mem_id);
        int userNo = memberInfo.getMem_no();
		
        Map<String, Object> map = new HashMap<String, Object>();
        List<BasketBean> listBasket = basketService.listBasket(userNo); // 장바구니 정보 
        System.out.println("list타고,listBasket " + listBasket);
       
        int sumMoney = basketService.sumMoney(userNo);// 장바구니 전체 금액 호출
        System.out.println("userNo  "+userNo );
        System.out.println("sumMoney  "+sumMoney );
		map.put("list", listBasket);                // 장바구니 정보를 map에 저장
	    map.put("count", listBasket.size());        // 장바구니 상품의 유무
	    map.put("sumMoney", sumMoney);        // 장바구니 전체 금액
	    /* map.put("fee", fee);                 // 배송금액
	       map.put("allSum", sumMoney+fee);    // 주문 상품 전체 금액*/
	    mav.setViewName("basket/cartList");    // view(jsp)의 이름 저장
	    mav.addObject("map", map);            // map 변수 저장
	    System.out.println("mav  "+mav );
	    return mav;
	}
	
    // 3. 장바구니 삭제
    @RequestMapping(value = "delete.gt", method = RequestMethod.GET) 
    public String delete(@RequestParam int bas_no,@ModelAttribute BasketBean basketBean,
    		HttpServletRequest req,HttpServletResponse res,HttpSession session) throws Exception {
    	
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	String mem_id = authentication.getName();
    
    	MemberBean memberInfo = memberService.memberInfo(mem_id);  
        int userNo = memberInfo.getMem_no();
    	
        basketBean.setBas_memno(userNo); 
    	basketService.deleteBasket(bas_no);
    	System.out.println("삭제 실행");
        return "redirect:/list.gt";
    }
    
   // 4. 장바구니 수정( 수량만 수정)
    @RequestMapping("update.gt")
    public String update(@RequestParam String[] bas_prostock, @RequestParam String[] bas_procode, HttpSession session) throws Exception {
    	  	
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	String mem_id = authentication.getName();
    	
    	MemberBean memberInfo = memberService.memberInfo(mem_id);  	
        int userNo = memberInfo.getMem_no();
     	System.out.println("update왔다");  
     	// 레코드의 갯수 만큼 반복문 실행
        for(int i=0; i< bas_procode.length; i++){
        	BasketBean basketBean = new BasketBean();
        	basketBean.setBas_memno(userNo); 
        	basketBean.setBas_prostock(Integer.parseInt((bas_prostock[i])));
        	basketBean.setBas_procode(Integer.parseInt((bas_procode[i])));
            basketService.modifyBasket(basketBean);
            System.out.println("새로 셋팅된 basketBean" + basketBean);
        }
        return "redirect:/list.gt";
    }
   	
}
