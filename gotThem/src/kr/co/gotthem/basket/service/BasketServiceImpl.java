package kr.co.gotthem.basket.service;

import java.util.List;

import kr.co.gotthem.basket.bean.BasketBean;
import kr.co.gotthem.basket.dao.BasketDao;


public class BasketServiceImpl implements BasketService {
	
	private BasketDao basketDao;

	public void setBasketDao(BasketDao basketDao) {
		this.basketDao = basketDao;
	}

	@Override
	public List<BasketBean> list() {
		return basketDao.list();
	}

	@Override
	public BasketBean FindByNo(int bas_no) {
		
		return basketDao.FindByNo(bas_no);
	}
	
	@Override
	public void insert(BasketBean basketBean) {		
	}
	
	@Override
	public int totalCount() {
		return basketDao.totalCount();
	}
	
	@Override
	public int update(int bas_no) {
		return basketDao.update(bas_no);
	}
	
	/*@Override
	public void delete(int bas_no) {
	}*/

	// 1. 장바구니 추가
    @Override
    public void insertBasket(BasketBean basketBean) {
    	basketDao.insertBasket(basketBean);
    }
    // 1.1 상품 삭제
    @Override
    public void deleteproduct(int bas_no) {
    	basketDao.deleteproduct(bas_no);
    }
    
    
  /*  @Override
    public void insertBasket(int code, int userNo,int stock) {
    	basketDao.insertBasket(code,  userNo, stock);
    }*/
	// 2. 장바구니 목록
    @Override
    public List<BasketBean> listBasket(int bas_memno) {
        return basketDao.listBasket(bas_memno);
    }
    
    // 3. 장바구니 삭제
    @Override
    public void deleteBasket(BasketBean basketBean) {
    	basketDao.deleteBasket(basketBean);
    }
    
    // 4. 장바구니 수정
    @Override
    public void modifyBasket(BasketBean basketBean) {
    	basketDao.modifyBasket(basketBean);
    }
    
    // 5. 장바구니 금액 합계
    @Override
    public int sumMoney(int bas_memno) {
        return basketDao.sumMoney(bas_memno);
    }
    
    // 6. 장바구니 상품 확인
    @Override
    public int countBasket(int bas_procode, int bas_memno) {
        return basketDao.countBasket(bas_procode, bas_memno);
    }
  
    // 7. 장바구니 상품 수량 변경
    @Override
    public void updateBasket(BasketBean basketBean) {
    	basketDao.updateBasket(basketBean);
    }
  
     
	/*@Override
	public MemberBean login(String id) {
		return basketDao.login(id);
	}*/
		
}
