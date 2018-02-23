package kr.co.gotthem.order.service;

import java.util.List;

import kr.co.gotthem.basket.bean.BasketBean;
import kr.co.gotthem.order.bean.OrderpayBean;
import kr.co.gotthem.order.dao.OrderDao;


public class OrderServiceImpl implements OrderService {
	
	private OrderDao orderDao;
	
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	// 1. 결제 추가.
    @Override
    public void insertOrder(OrderpayBean orderBean) {
    	orderDao.insertOrder(orderBean);
    }
    // 1.1 상품 삭제
    @Override
    public void deleteproduct(int bas_no) {
    	orderDao.deleteproduct(bas_no);
    }
    
    
  /*  @Override
    public void insertBasket(int code, int userNo,int stock) {
    	basketDao.insertBasket(code,  userNo, stock);
    }*/
	// 2. 장바구니 목록
    @Override
    public List<BasketBean> listBasket(int bas_memno) {
        return orderDao.listBasket(bas_memno);
    }
    
    // 3. 장바구니 삭제
    @Override
    public void deleteBasket(int bas_no) {
    	orderDao.deleteBasket(bas_no);
    }
    
    // 4. 장바구니 수정
    @Override
    public void modifyBasket(BasketBean basketBean) {
    	orderDao.modifyBasket(basketBean);
    }
    
    // 5. 장바구니 금액 합계
    @Override
    public int sumMoney(int bas_memno) {
        return orderDao.sumMoney(bas_memno);
    }
    
    // 6. 장바구니 상품 확인
    @Override
    public int countBasket(int bas_procode, int bas_memno) {
        return orderDao.countBasket(bas_procode, bas_memno);
    }
  
    // 7. 장바구니 상품 수량 변경
    @Override
    public void updateBasket(BasketBean basketBean) {
    	orderDao.updateBasket(basketBean);
    }
  
     
	/*@Override
	public MemberBean login(String id) {
		return basketDao.login(id);
	}*/
		
}
