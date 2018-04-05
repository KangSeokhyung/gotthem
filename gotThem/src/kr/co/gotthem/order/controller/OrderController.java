package kr.co.gotthem.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.member.service.MemberService;
import kr.co.gotthem.order.bean.OrderpayBean;
import kr.co.gotthem.order.service.OrderService;

@Controller
public class OrderController {
	
	private OrderService orderService;
	private MemberService memberService;

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
 
      // 3. 아이디별 전체 결제 목록
     @RequestMapping("/orderList.gt")
     public ModelAndView listOrder(ModelAndView mav)throws Exception {
    	 
    	 Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	 String mem_id = authentication.getName();
    	 
    	 if (mem_id.equals("anonymousUser")) {
 	    	mav.setViewName("redirect:/login.gt");
 	    	return mav;
 	     } 
    	 
    	 MemberBean memberInfo = memberService.memberInfo(mem_id);
    	 int userNo = memberInfo.getMem_no();
    	 
    	 Map<String, Object> map = new HashMap<String, Object>();
         List<OrderpayBean> listOrder = orderService.listOrder(userNo); // 장바구니 정보 
         map.put("list",listOrder);
         mav.setViewName("/basket/orderList");
         mav.addObject("map", map);
         return mav;
         }
     
	// 3. 사장님 아이디별 전체 결제 목록
	@RequestMapping("/storeOrderList.st")
	public ModelAndView listOrderStore(Model model, @RequestParam int pageNo, ModelAndView mav) throws Exception {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mem_id = authentication.getName();
		MemberBean memberInfo = memberService.memberInfo(mem_id);
		String sto_name = memberInfo.getSto_name();

		orderService.storeListOrder(model, sto_name, pageNo);
		mav.setViewName("store/storeOrderList");
		return mav;
	}
	

	@RequestMapping(value = "/statusChange.st", method = RequestMethod.POST)
	protected ModelAndView statusChange(HttpServletRequest req, @RequestParam int pageNo) {
		int ord_no = Integer.parseInt(req.getParameter("ord_no"));
		orderService.statusChange(ord_no);
		ModelAndView mav = new ModelAndView("redirect:/stock.st?pageNo=" + pageNo);

		return mav;
	}
	
	// 4.단건 결제 api
	@RequestMapping(value="/paymentOne.gt", method = RequestMethod.POST)
	@ResponseBody
	public HashMap paymentOne(String accessToken, HttpSession session,@RequestParam String orderOne) throws Exception{
		System.out.println("접속된 토큰 : " + accessToken);
		System.out.println("orderOne : " + orderOne);
		@SuppressWarnings("rawtypes")
		
		HashMap result = orderService.payOne(accessToken, HashMap.class, orderOne);
		System.out.println("orderOne컨트롤: " + orderOne);
		session.setAttribute("tid",result.get("tid"));
        session.setAttribute("accessToken", accessToken);
        session.setAttribute("orderOne", orderOne);
        return result;
        }
	
	// 4.1 단건 승인 api
	@RequestMapping(value="/approveOne.gt")
	public ModelAndView approveOne(HttpServletRequest req,HttpSession session, ModelAndView mav) throws Exception {
		String orderOne = (String)session.getAttribute("orderOne");
		session.removeAttribute("orderOne");
		String pg_Token = req.getParameter("pg_token");
        @SuppressWarnings("rawtypes")
        HashMap result = orderService.approveOne(pg_Token,session,HashMap.class,orderOne);
       
        java.util.StringTokenizer  st = new java.util.StringTokenizer(orderOne,",");
        String bas_no = st.nextToken();
    	String bas_proname = st.nextToken();
    	String bas_proprice = st.nextToken(); 
    	String aaa = st.nextToken();
    	String bas_procode = st.nextToken(); 
 	    String bas_proimg = st.nextToken();
    	String bas_procomment = st.nextToken();
        String pro_memno = st.nextToken();
    	String sto_name = st.nextToken();
    	String bas_memno = st.nextToken();
    	String money = st.nextToken();
    	String bas_prostock = st.nextToken();
    	
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
        
        MemberBean memberInfo = memberService.storeInfo(orderBean.getOrd_memno());
        String mem_phone = memberInfo.getMem_phone();
        orderBean.setMem_phone(mem_phone);
        
        orderService.orderInsert(orderBean);
	    orderService.orderUpdateBasket(orderBean);
	    orderService.orderDeleteBasket(orderBean); 
	    System.out.println("결제 db연동"+orderBean);
	    
	    mav.addObject("result", result);
        mav.setViewName("basket/purchase");
        return mav;
        }
	
	// 5. 복수 결제 api
	@RequestMapping(value="/payment.gt", method = RequestMethod.POST)
    @ResponseBody
	public HashMap payment(String accessToken, HttpSession session,@RequestParam (value= "arrOrder[]") List valueArr,@RequestParam String sum) throws Exception {
		System.out.println("sum ㅋㅋ: " + sum);
		System.out.println("접속된 토큰 : " + accessToken);
		String oneArr = (String) valueArr.get(0);
		@SuppressWarnings("rawtypes")
        HashMap result = orderService.pay(accessToken, HashMap.class, oneArr, sum);
        
		session.setAttribute("tid",result.get("tid"));
        session.setAttribute("accessToken", accessToken);
        session.setAttribute("valueArr", valueArr);
        return result;
        }
	
	
	// 5.1 복수 승인 api
	@RequestMapping(value="/approve.gt")
    public ModelAndView approve(HttpServletRequest req,HttpSession session, ModelAndView mav) throws Exception {
		List valueArr = (List)session.getAttribute("valueArr");
	    session.removeAttribute("valueArr");
	    String oneArr = (String) valueArr.get(0);
	    String pg_Token = req.getParameter("pg_token");
        System.out.println("pg_Token:승인컨트롤"+pg_Token);
        @SuppressWarnings("rawtypes")
        HashMap result = orderService.approve(pg_Token,session,HashMap.class,oneArr);
        
        String A = null;
        for(int i=0; i<valueArr.size(); i++){
        	A = (String) valueArr.get(i);
        	if ( 2==A.length()) {
        		continue;
        		} else {
        			java.util.StringTokenizer  st = new java.util.StringTokenizer(A,",");
     	            String bas_no = st.nextToken();
        	        String bas_proname = st.nextToken();
        	        String bas_proprice = st.nextToken(); 
        	        String aaa = st.nextToken();
        	        String bas_procode = st.nextToken();
     	            String bas_proimg = st.nextToken();
        	        String bas_procomment = st.nextToken();
                    String pro_memno = st.nextToken();
        	        String sto_name = st.nextToken();
        	        String bas_memno = st.nextToken();
        	        String money = st.nextToken();
        	        String bas_prostock = st.nextToken();
        	        
        	        OrderpayBean orderBean = new OrderpayBean();
        	        orderBean.setOrd_procode(Integer.parseInt(bas_procode));
        	        orderBean.setOrd_proname(bas_proname);
                    orderBean.setOrd_memno(Integer.parseInt(bas_memno));;
                    orderBean.setOrd_stock(Integer.parseInt(bas_prostock));
                    orderBean.setOrd_price(Integer.parseInt(money));
                    orderBean.setOrd_basno(Integer.parseInt(bas_no));        
                    orderBean.setOrd_proimg(bas_proimg);
                    orderBean.setOrd_proprice(Integer.parseInt(bas_proprice));
                    orderBean.setSto_name(sto_name);
                    orderBean.setPro_memno(Integer.parseInt(pro_memno));
       
                    MemberBean memberInfo = memberService.storeInfo(orderBean.getOrd_memno());
                    String mem_phone = memberInfo.getMem_phone();
                    orderBean.setMem_phone(mem_phone);
                    
                    orderService.orderInsert(orderBean);
                    orderService.orderUpdateBasket(orderBean);
                    orderService.orderDeleteBasket(orderBean);
                    System.out.println("ㅋ복수결제 DB orderBean:"+orderBean);
                    }
        	}
        mav.addObject("result", result);
        mav.setViewName("basket/purchase");
        return mav;
        }
	
	@RequestMapping(value = "/orderSelectSearch.st", method = RequestMethod.GET)
	public ModelAndView selectSearch(ModelAndView mav, String select, String search,
			@RequestParam(defaultValue="1") int pageNo) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mem_id = authentication.getName();
		MemberBean memberInfo = memberService.memberInfo(mem_id);
		String sto_name = memberInfo.getSto_name();
		
		List<OrderpayBean> storeListOrder = null;
		
		final int ROW_PER_PAGE = 10; // 페이지당 레코드 출력 갯수
		int begin = (pageNo - 1) * ROW_PER_PAGE;
		int end = pageNo * ROW_PER_PAGE;
		
		storeListOrder = orderService.orderSelectSearch(begin, select, search, sto_name);
		
		int totalRows = storeListOrder.size(); // 전체 게시물 갯수
		int totalPages = (int) Math.ceil((double) totalRows / ROW_PER_PAGE);

		final int PAGE_PER_PAGE = 5; // 화면당 페이지 출력 갯수
		int totalRanges = (int) Math.ceil((double) totalPages
				/ PAGE_PER_PAGE); // 전체 Range 갯수
		int currentRange = (int) Math.ceil((double) pageNo / PAGE_PER_PAGE);
		//요청된 pageNo의 현재 range
		int beginPage = (currentRange - 1) * PAGE_PER_PAGE + 1; // 시작 페이지 번호
		int endPage = currentRange * PAGE_PER_PAGE; // 마지막 페이지 번호
		if (currentRange == totalRanges)
			endPage = totalPages; // currentRange가 맨 마지막 range인 경우

		int prevPage = 0;
		if (currentRange != 1)
			prevPage = (currentRange - 2) * PAGE_PER_PAGE + 1;
		int nextPage = 0;
		if (currentRange != totalRanges)
			nextPage = currentRange * PAGE_PER_PAGE + 1;
		
		mav.addObject("ROW_PER_PAGE", ROW_PER_PAGE);
		mav.addObject("begin", begin); 
		mav.addObject("end", end); 
		mav.addObject("pageNo", pageNo);
		mav.addObject("totalRows", totalRows); 
		mav.addObject("totalPages",totalPages); 
		mav.addObject("totalRanges",totalRanges);
		mav.addObject("currentRange",currentRange);
		mav.addObject("beginPage", beginPage); 
		mav.addObject("endPage", endPage); 
		mav.addObject("prevPage", prevPage);
		mav.addObject("nextPage", nextPage);
		mav.addObject("storeListOrder", storeListOrder);
		mav.setViewName("store/storeOrderList");
		
		return mav;
	}
	
}
