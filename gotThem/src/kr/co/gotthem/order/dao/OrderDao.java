package kr.co.gotthem.order.dao;

import java.util.List;

import kr.co.gotthem.basket.bean.BasketBean;
import kr.co.gotthem.order.bean.OrderpayBean;


public interface OrderDao {
	
	// 1. 장바구니에서 결제 추가
    public void insertOrder(OrderpayBean orderBean);
    
    //1.1. 결제 되면, 상품에서 결제된 수량만큼  수량 빼기
    public void updateBasketOrder(OrderpayBean orderBean);
   
    // 1.2 결제되면, 장바구니 삭제
    public void deleteBasketOrder(int ord_basno);
   
   
    // 2. 결제 취소 삭제
    public void deleteOrder(int ord_no);
    
    //2.1. 결제 취소되면, 결제된 수량만큼  상품에 수량 더하기

    public void updateProductOrder(OrderpayBean orderBean);
    
    
    // 3. 아이디별 전체 결제 목록
    public List<OrderpayBean> listOrder(int userNo);

}
