package kr.co.gotthem.order.service;

import java.sql.Timestamp;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.ui.Model;
import kr.co.gotthem.order.bean.OrderpayBean;

public interface OrderService {
	
   // 1. 장바구니에서 결제 추가
   public void orderInsert(OrderpayBean orderBean);
   
   //1.1. 결제 되면, 상품에서 결제된 수량만큼  수량 빼기
   public void orderUpdateBasket(OrderpayBean orderBean);
   
   // 1.2. 결제되면, 장바구니 삭제
   public void orderDeleteBasket(OrderpayBean orderBean);
   
   // 3. 아이디별 전체 결제 목록
   public List<OrderpayBean> listOrder(int userNo);
 
   // 3.1 사장님 아이디별 전체 결제 목록
   public List<OrderpayBean> storeListOrder(Model model, String sto_name, int pageNo);
   
   // 3.2 사장님 아이디별 기간  결제 목록 
   public List<OrderpayBean> storeListOrderTime(int userNo, Timestamp begin, Timestamp end );
   
   // 4. 단건 결제 api 
   public <T> T payOne(String accessToken, Class<T> type, String orderOne);
   
   // 4.1 단건 승인 api 
   public <T> T approveOne(String pg_Token, HttpSession session, Class<T> type,String orderOne);
  
   // 5. 복수 결제 api 
   public <T> T pay(String accessToken, Class<T> type, String oneArr, String sum);
   
   // 5.1 복수 승인 api 
   public <T> T approve(String pg_Token, HttpSession session, Class<T> type, String oneArr);
   
   

}