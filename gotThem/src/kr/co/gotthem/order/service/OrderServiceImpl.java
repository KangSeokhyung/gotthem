package kr.co.gotthem.order.service;

import java.sql.Timestamp;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
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
    public List<OrderpayBean> storeListOrder(String userName) {
        return orderDao.storeListOrder(userName);
    }
    
    // 3.2 사장님 아이디별 기간  결제 목록
    @Override
    public List<OrderpayBean> storeListOrderTime(int userNo, Timestamp begin, Timestamp end ){
    	  return orderDao.storeListOrderTime(userNo, begin, end);
    }
    
    
    //4. 단건 결제 api 
    @Override
    public <T> T payOne(String accessToken, Class<T> type, String orderOne) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        headers.setAccept(Arrays.asList(new MediaType[]{MediaType.ALL}));
        headers.set("Authorization", "Bearer " + accessToken);
 
        System.out.println("orderOne서비스 "+ orderOne);
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
    	
        MultiValueMap<String,String> param = new LinkedMultiValueMap<>();
       
        param.add("cid", "TC0ONETIME");
        param.add("partner_order_id", sto_name);
        param.add("partner_user_id",  bas_memno);
        param.add("item_name", bas_proname);
        param.add("quantity", bas_prostock);
        param.add("total_amount",money);
        param.add("tax_free_amount", "0"); 
        
        param.add("approval_url", "http://localhost:8080/gotThem/approveOne.gt");
        param.add("cancel_url", "http://localhost:8080/gotThem/index.jsp");
        param.add("fail_url", "http://localhost:8080/gotThem/index.jsp");
        System.out.println("파람 : " + param + "\n헤더 : " + headers);
        
        HttpEntity<MultiValueMap<String,String>> entity = new HttpEntity<>(param, headers);
        RestTemplate restTemplate = new RestTemplate();
        
        try {
        	System.out.println("zzx고 ");
        return restTemplate.postForObject("https://kapi.kakao.com/v1/payment/ready",entity, type);
        } catch (Exception e) {
            throw new RuntimeException("카카오 API 실행 오류!",e);
        }
    }
    
    //4.1 단건 승인 api 
    @Override
    public <T> T approveOne(String pg_Token, HttpSession session, Class<T> type, String orderOne) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        headers.setAccept(Arrays.asList(new MediaType[]{MediaType.ALL}));
        headers.set("Authorization", "Bearer " + session.getAttribute("accessToken"));
        
        System.out.println("orderOne서비스 "+ orderOne);
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
    	
        MultiValueMap<String,String> param = new LinkedMultiValueMap<>();
        param.add("cid", "TC0ONETIME");
        param.add("tid", (String)session.getAttribute("tid"));
        param.add("partner_order_id", sto_name);
        param.add("partner_user_id", bas_memno);
        param.add("pg_token", pg_Token);
        System.out.println("승인서비스파람" + param);
        HttpEntity<MultiValueMap<String,String>> entity = new HttpEntity<>(param, headers);
        RestTemplate restTemplate = new RestTemplate();
        
        try {
        	System.out.println(entity);
        System.out.println("승인서비스끝 ");
        return restTemplate.postForObject("https://kapi.kakao.com/v1/payment/approve",entity, type);
        } catch (Exception e) {
            throw new RuntimeException("카카오 API 실행 오류!",e);
        }
    }

    
    //5. 복수 결제 api 
    @Override
    public <T> T pay(String accessToken, Class<T> type, String oneArr, String sum) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        headers.setAccept(Arrays.asList(new MediaType[]{MediaType.ALL}));
        headers.set("Authorization", "Bearer " + accessToken);
       
        
        System.out.println("oneArr서비스 "+ oneArr);
        java.util.StringTokenizer  st = new java.util.StringTokenizer(oneArr,",");
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
   	    
      	MultiValueMap<String,String> param = new LinkedMultiValueMap<>();
      	param.add("cid", "TC0ONETIME");
        param.add("partner_order_id", sto_name);
        param.add("partner_user_id", bas_memno);
        param.add("item_name", bas_proname+" 등");
        param.add("quantity", bas_prostock);
        param.add("total_amount",sum);
        param.add("tax_free_amount", "0"); 
  
  
        param.add("approval_url", "http://localhost:8080/gotThem/approve.gt");
        param.add("cancel_url", "http://localhost:8080/gotThem/index.jsp");
        param.add("fail_url", "http://localhost:8080/gotThem/index.jsp");
        
       /* System.out.println("파람 : " + param + "\n헤더 : " + headers);*/
     	
     	
        HttpEntity<MultiValueMap<String,String>> entity = new HttpEntity<>(param, headers);
        System.out.println("엔티티 : "+entity);
        System.out.println("파람 : " + param );
        RestTemplate restTemplate = new RestTemplate();
        
        try {
        	System.out.println("zzx고 ");
        return restTemplate.postForObject("https://kapi.kakao.com/v1/payment/ready",entity, type);
        } catch (Exception e) {
            throw new RuntimeException("카카오 API 실행 오류!",e);
        }
    }
 	 
    
    //5.1  복수 승인 api 
    @Override
    public <T> T approve(String pg_Token, HttpSession session, Class<T> type, String oneArr) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        headers.setAccept(Arrays.asList(new MediaType[]{MediaType.ALL}));
        headers.set("Authorization", "Bearer " + session.getAttribute("accessToken"));
        
        System.out.println("oneArr서비스 "+ oneArr);
        java.util.StringTokenizer  st = new java.util.StringTokenizer(oneArr,",");
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
      	
        MultiValueMap<String,String> param = new LinkedMultiValueMap<>();
        param.add("cid", "TC0ONETIME");
        param.add("tid", (String)session.getAttribute("tid"));
        param.add("partner_order_id", sto_name);
        param.add("partner_user_id", bas_memno);
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
