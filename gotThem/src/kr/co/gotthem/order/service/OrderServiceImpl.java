package kr.co.gotthem.order.service;

import java.util.List;

import kr.co.gotthem.basket.bean.BasketBean;
import kr.co.gotthem.order.bean.OrderpayBean;
import kr.co.gotthem.order.dao.OrderDao;
import kr.co.gotthem.product.bean.ProductBean;


public class OrderServiceImpl implements OrderService {
	
	private OrderDao orderDao;
	
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	// 1.장바구니에서 결제 추가
    @Override
    public void insertOrder(OrderpayBean orderBean) {
    	orderDao.insertOrder(orderBean);
    }
    
    //1.1. 결제 되면, 상품에서 결제된 수량만큼  수량 빼기
    @Override
    public void updateBasketOrder(OrderpayBean orderBean) {
    	orderDao.updateBasketOrder(orderBean);
    }
    
    // 1.2. 결제되면, 장바구니 삭제
    @Override
    public void deleteBasketOrder(int ord_basno) {
    	orderDao.deleteBasketOrder(ord_basno);
    }
   
    // 2. 결제 취소 삭제
    @Override
    public void deleteOrder(int ord_no) {
    	orderDao.deleteOrder(ord_no);
    }
  
    //2.1. 결제 취소되면, 결제된 수량만큼  상품에 수량 더하기
    @Override
    public void updateProductOrder(OrderpayBean orderBean) {
    	orderDao.updateProductOrder(orderBean);
    }
    
    
    // 3. 아이디별 전체 결제 목록
    @Override
    public List<OrderpayBean> listOrder(int userNo) {
        return orderDao.listOrder(userNo);
    }	
}
