package kr.co.gotthem.order.dao;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import kr.co.gotthem.basket.bean.BasketBean;
import kr.co.gotthem.order.bean.OrderpayBean;
import kr.co.gotthem.product.bean.ProductBean;


public interface OrderDao {
	
	// 1. 장바구니에서 결제 추가
    public void orderInsert(OrderpayBean orderBean);
    
    //1.1. 결제 되면, 상품에서 결제된 수량만큼  수량 빼기
    public void orderUpdateBasket(OrderpayBean orderBean);
   
    // 1.2 결제되면, 장바구니 삭제
    public void orderDeleteBasket(OrderpayBean orderBean);
     
    // 3. 아이디별 전체 결제 목록
    public List<OrderpayBean> listOrder(int userNo);
   
    // 3.1 사장님 아이디별 전체 결제 목록 
    public List<OrderpayBean> storeListOrder(HashMap<String, Object> map);
    
    public int storeListOrderCount(String sto_name);
    
    // 3.2 사장님 아이디별 기간  결제 목록 
    public List<OrderpayBean> storeListOrderTime(int userNo, Timestamp begin, Timestamp end);

	public void statusChange(int ord_no);
	
	public List<OrderpayBean> orderSelectSearch(int begin, String select, String search, String sto_name);

	public int orderSelectSearchCount(String select, String search, String sto_name);
}
