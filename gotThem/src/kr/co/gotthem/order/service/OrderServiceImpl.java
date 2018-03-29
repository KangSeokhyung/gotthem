package kr.co.gotthem.order.service;

import java.sql.Timestamp;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import kr.co.gotthem.basket.bean.BasketBean;
import kr.co.gotthem.order.bean.OrderpayBean;
import kr.co.gotthem.order.dao.OrderDao;


public class OrderServiceImpl implements OrderService {
	
	private OrderDao orderDao;
	
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	// 1.장바구니에서 결제 추가
    @Override
    public void orderInsert(OrderpayBean orderBean) {
    	orderDao.orderInsert(orderBean);
    }
    
    //1.1. 결제 되면, 상품에서 결제된 수량만큼  수량 빼기
    @Override
    public void orderUpdateBasket(OrderpayBean orderBean) {
    	orderDao.orderUpdateBasket(orderBean);
    }
    
    // 1.2. 결제되면, 장바구니 삭제
    @Override
    public void orderDeleteBasket(OrderpayBean orderBean) {
    	orderDao.orderDeleteBasket(orderBean);
    }
   
    // 2. 결제 취소 삭제
    @Override
    public void orderDelete(int ord_no) {
    	orderDao.orderDelete(ord_no);
    }
  
    //2.1. 결제 취소되면, 결제된 수량만큼  상품에 수량 더하기
    @Override
    public void orderUpdateProduct(OrderpayBean orderBean) {
    	orderDao.orderUpdateProduct(orderBean);
    }
    
    
    // 3. 아이디별 전체 결제 목록
    @Override
    public List<OrderpayBean> listOrder(int userNo) {
        return orderDao.listOrder(userNo);
    }
    
    // 3.1 사장님 아이디별 전체 결제 목록
    @Override
    public List<OrderpayBean> storeListOrder(Model model, String sto_name, int pageNo) {
    	final int rowPerPage = 10;
		int beginList = (pageNo - 1) * rowPerPage;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("beginList", beginList);
		map.put("sto_name", sto_name);

		List storeListOrder = orderDao.storeListOrder(map);

		// 전체 게시물 수
		int totalRows = orderDao.storeListOrderCount(sto_name);
		// 전체 페이지 번호 수
		int totalPages = (int) Math.ceil((double) totalRows / rowPerPage);

		// 화면 하단에 표시될 페이지의 개수
		final int pagePerPage = 5;

		// 하단에 표시될 페이지의 범위 개수
		int totalRanges = (int) Math.ceil((double) totalPages / pagePerPage);

		// 현재 페이지의 범위 번호
		int currentRange = (int) Math.ceil((double) pageNo / pagePerPage);

		int beginPage = (currentRange - 1) * pagePerPage + 1;
		int endPage = currentRange * pagePerPage;

		if (currentRange == totalRanges) {
			endPage = totalPages;
		}

		int prevPage = 0;
		if (currentRange != 1) {
			prevPage = (currentRange - 2) * pagePerPage + 1;
		}

		int nextPage = 0;
		if (currentRange != totalRanges) {
			nextPage = currentRange * pagePerPage + 1;
		}

		model.addAttribute("pageNo", pageNo);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("prevPage", prevPage);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("storeListOrder", storeListOrder);

		return storeListOrder;
	}
    
    // 3.2 사장님 아이디별 기간  결제 목록
    @Override
    public List<OrderpayBean> storeListOrderTime(int userNo, Timestamp begin, Timestamp end ){
    	  return orderDao.storeListOrderTime(userNo, begin, end);
    }
    
    //결제 api 실험중
    @Override
    public <T> T pay(String accessToken, Class<T> type, List valueArr) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        headers.setAccept(Arrays.asList(new MediaType[]{MediaType.ALL}));
        headers.set("Authorization", "Bearer " + accessToken);
 
        System.out.println("valueArr서비스 "+ valueArr);
        String A = null;
        for(int i=0; i<valueArr.size(); i++){
     	   A = (String) valueArr.get(i);
     	   System.out.println("결제 서비스A"+A.toString());
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

      	   OrderpayBean orderBean = new OrderpayBean();
           orderBean.setOrd_basno(Integer.parseInt(bas_no));        
           orderBean.setOrd_proname(bas_proname);
           orderBean.setOrd_proprice(Integer.parseInt(bas_proprice));
           orderBean.setOrd_stock(Integer.parseInt(bas_prostock));
           orderBean.setOrd_procode(Integer.parseInt(bas_procode));
           orderBean.setOrd_price(Integer.parseInt(money));
           orderBean.setOrd_proimg(bas_proimg);
           orderBean.setPro_memno(Integer.parseInt(pro_memno));
           orderBean.setSto_name(sto_name);
           System.out.println("Sto_name서비스 "+ sto_name);
     		   }
        }
           MultiValueMap<String,String> param = new LinkedMultiValueMap<>();
        param.add("cid", "TC0ONETIME");
        param.add("partner_order_id", "partner_order_id");
        param.add("partner_user_id", "partner_user_id");
        param.add("item_name", "상품명");
        param.add("quantity", "2");
        param.add("total_amount", "10000");
        param.add("tax_free_amount", "100"); 
        
        param.add("approval_url", "http://localhost:8080/gotThem/approve.gt");
        param.add("cancel_url", "http://localhost:8080/gotThem/index.jsp");
        param.add("fail_url", "http://localhost:8080/gotThem/index.jsp");
        System.out.println("파람 : " + param + "\n헤더 : " + headers);
        HttpEntity<MultiValueMap<String,String>> entity = new HttpEntity<>(param, headers);
        System.out.println("엔티티 : "+entity);
        RestTemplate restTemplate = new RestTemplate();
        
        try {
        	System.out.println("zzx고 ");
        return restTemplate.postForObject("https://kapi.kakao.com/v1/payment/ready",entity, type);
        } catch (Exception e) {
            throw new RuntimeException("카카오 API 실행 오류!",e);
        }
    }
    
    
    @Override
    public <T> T approve(String pg_Token, HttpSession session, Class<T> type) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        headers.setAccept(Arrays.asList(new MediaType[]{MediaType.ALL}));
        headers.set("Authorization", "Bearer " + session.getAttribute("accessToken"));
        MultiValueMap<String,String> param = new LinkedMultiValueMap<>();
        param.add("cid", "TC0ONETIME");
        param.add("tid", (String)session.getAttribute("tid"));
        param.add("partner_order_id", "partner_order_id");
        param.add("partner_user_id", "partner_user_id");
        param.add("pg_token", pg_Token);
        System.out.println("승인파람" + param);
        HttpEntity<MultiValueMap<String,String>> entity = new HttpEntity<>(param, headers);
        RestTemplate restTemplate = new RestTemplate();
        try {
        return restTemplate.postForObject("https://kapi.kakao.com/v1/payment/approve",entity, type);
        } catch (Exception e) {
            throw new RuntimeException("카카오 API 실행 오류!",e);
        }
    }

}
