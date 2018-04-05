package kr.co.gotthem.basket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
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
import kr.co.gotthem.product.service.ProductService;

@Controller
public class BasketController {
	
	private BasketService basketService;
	private ProductService productService;
	private MemberService memberService;
	
	public void setBasketService(BasketService basketService) {
		this.basketService = basketService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
    // 1. 장바구니 추가
	@RequestMapping(value ="insertBasket.gt")
    @ResponseBody
    public void insertBasket(@ModelAttribute BasketBean basketBean,HttpServletRequest req, HttpServletResponse res) throws Exception {
    	
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	String mem_id = authentication.getName();
    
    	MemberBean memberInfo = memberService.memberInfo(mem_id);  
        int userNo = memberInfo.getMem_no();
    	basketBean.setBas_memno(userNo);
        
        int count = basketService.countBasket(basketBean.getBas_procode(),basketBean.getBas_memno());
        if (count == 0) {
        	 basketService.insertBasket(basketBean);      	 
        	 System.out.println("첫 상품 장바구니 인서트");
        } else {    // 있으면 update, 동일 상품 존재시 기존 수량에 새로운 수량 더하기
        	basketService.updateBasket(basketBean);
			System.out.println("존재하는 상품 인서트");
        }
    }
 
    // 2. 장바구니 목록
    @RequestMapping(value = "listBasket.gt", method = RequestMethod.GET)
	public ModelAndView listBasket(ModelAndView mav,HttpServletRequest req, HttpServletResponse res,
			BasketBean basketBean) throws Exception {
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String mem_id = authentication.getName();
	    
	    if (mem_id.equals("anonymousUser")) {
	    	mav.setViewName("redirect:/login.gt");
	    	return mav;
	    }
	    
     	MemberBean memberInfo = memberService.memberInfo(mem_id);
        int userNo = memberInfo.getMem_no();
        
        
        Map<String, Object> map = new HashMap<String, Object>();
        List<BasketBean> listBasket = basketService.listBasket(userNo); // 장바구니 정보 
        int sumMoney = basketService.sumMoney(userNo);// 장바구니 전체 금액 호출
	    for(int i=0; i< listBasket.size(); i++){
			basketBean = listBasket.get(i);
			int procode = basketBean.getBas_procode();
			int stock = productService.productSearchStock(procode);
			basketBean.setStock(stock);
			}
	    map.put("sumMoney", sumMoney);        // 장바구니 전체 금액
	    map.put("list", listBasket);          // 장바구니 정보를 map에 저장
	    map.put("count", listBasket.size());
	    mav.setViewName("basket/cartList");    // view(jsp)의 이름 저장
	    mav.addObject("map", map);            // map 변수 저장
	    mav.addObject("memberInfo", memberInfo);		    
	    System.out.println("listBasket: "+mav );
	    return mav;
	}

    // 3. 장바구니 삭제
    @RequestMapping(value = "delete.gt", method = RequestMethod.GET) 
    public String delete(@RequestParam int bas_no,@ModelAttribute BasketBean basketBean) throws Exception {
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	String mem_id = authentication.getName();
    
    	MemberBean memberInfo = memberService.memberInfo(mem_id);  
        int userNo = memberInfo.getMem_no();
    	
        basketBean.setBas_memno(userNo); 
    	basketService.deleteBasket(basketBean);
    	System.out.println("한건삭제");
        return "redirect:/listBasket.gt";
    }
    
    // 3.1 장바구니 선택 삭제
    @RequestMapping(value = "selectDelete.gt", method = RequestMethod.POST) 
    public String testCheck(@RequestParam (value= "arrDel[]") List valueArr,
    		@ModelAttribute BasketBean basketBean) throws Exception {
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	String mem_id = authentication.getName();
    
    	MemberBean memberInfo = memberService.memberInfo(mem_id);  
        int userNo = memberInfo.getMem_no();
        String A = null;
        for(int i=0; i<valueArr.size(); i++){
        	A = (String) valueArr.get(i);
        	if ( 2==A.length()) {
        		continue;
        		}else {
        			java.util.StringTokenizer  st = new java.util.StringTokenizer(A,",");
        			String bas_no = st.nextToken();
        			basketBean.setBas_memno(userNo);
        			basketBean.setBas_no(Integer.parseInt(bas_no));
        			basketService.deleteBasket(basketBean);
        			}
        	}
        System.out.println("선택삭제");
        return "redirect:/listBasket.gt";
        } 
   
    // 4. 장바구니 수정(수량만 수정)
    @RequestMapping(value ="update.gt", method = RequestMethod.POST)
    @ResponseBody
	public void update(@RequestParam int bas_procode, @RequestParam int bas_prostock,@ModelAttribute BasketBean basketBean) throws Exception {
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mem_id = authentication.getName();
		MemberBean memberInfo = memberService.memberInfo(mem_id);
		int userNo = memberInfo.getMem_no();
		basketBean.setBas_memno(userNo);
		basketBean.setBas_prostock(bas_prostock);
		basketBean.setBas_procode(bas_procode);
		basketService.modifyBasket(basketBean);
		System.out.println("수량만 변경");
    }
    
    // 5. 편의점 상세에서 장바구니 선택 추가
	@RequestMapping(value = "selectAddBasket.gt", method = RequestMethod.POST)
	@ResponseBody
	public void selectAddBasket(@RequestParam (value= "checkList[]") List checkList,
			@RequestParam String checkOne, BasketBean basketBean) throws Exception {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mem_id = authentication.getName();
		MemberBean memberInfo = memberService.memberInfo(mem_id);
		int userNo = memberInfo.getMem_no();
		basketBean.setBas_memno(userNo);
		StringTokenizer st = null;
		String row = null;
		if (!(checkOne.equals(""))) {
			st = new StringTokenizer(checkOne, ",");
			String bas_procode = st.nextToken();
			String bas_proname = st.nextToken();
			String pro_memno = st.nextToken();
			String bas_procategory = st.nextToken();
			String bas_prostock = st.nextToken();
			String bas_proprice = st.nextToken();
			String bas_proimg = st.nextToken();
			String sto_name = st.nextToken();
			
			basketBean.setBas_procode(Integer.parseInt(bas_procode));
			basketBean.setBas_proname(bas_proname);
			basketBean.setBas_procategory(bas_procategory);
			basketBean.setBas_prostock(1);
			basketBean.setBas_proprice(Integer.parseInt(bas_proprice));
			basketBean.setBas_proimg(bas_proimg);
			basketBean.setPro_memno(Integer.parseInt(pro_memno));
			basketBean.setSto_name(sto_name);
			
	        int count = basketService.countBasket(basketBean.getBas_procode(),basketBean.getBas_memno());
	        if (count == 0) {
	        	basketService.insertBasket(basketBean);
	        	System.out.println("첫 상품 장바구니 인서트");
	        } else {
	        	basketService.updateBasket(basketBean);
	        	System.out.println("존재하는 상품 인서트");
	        	}
	        } else {
	        	for (int i = 0; i < checkList.size(); i++) {
				row = (String) checkList.get(i);
				st = new StringTokenizer(row, ",");

				String bas_procode = st.nextToken();
				String bas_proname = st.nextToken();
				String pro_memno = st.nextToken();
				String bas_procategory = st.nextToken();
				String bas_prostock = st.nextToken();
				String bas_proprice = st.nextToken();
				String bas_proimg = st.nextToken();
				String sto_name = st.nextToken();

				basketBean.setBas_procode(Integer.parseInt(bas_procode));
				basketBean.setBas_proname(bas_proname);
				basketBean.setBas_procategory(bas_procategory);
				basketBean.setBas_prostock(1);
				basketBean.setBas_proprice(Integer.parseInt(bas_proprice));
				basketBean.setBas_proimg(bas_proimg);
				basketBean.setPro_memno(Integer.parseInt(pro_memno));
				basketBean.setSto_name(sto_name);

				int count = basketService.countBasket(basketBean.getBas_procode(), basketBean.getBas_memno());
				if (count == 0) {
					basketService.insertBasket(basketBean);
					System.out.println("첫 상품 장바구니 인서트");
				} else {
					basketService.updateBasket(basketBean);
					System.out.println("존재하는 상품 인서트");
				}
			}
		}
	}
}
