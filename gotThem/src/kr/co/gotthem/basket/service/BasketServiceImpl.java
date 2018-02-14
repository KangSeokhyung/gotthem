package kr.co.gotthem.basket.service;

import java.util.List;

import kr.co.gotthem.basket.bean.BasketBean;
import kr.co.gotthem.basket.dao.BasketDao;
import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.member.dao.MemberDao;

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
	
	@Override
	public void delete(int bas_no) {
	}

	  // 2. 장바구니 목록
    @Override
    public List<BasketBean> listCart(int bas_memno) {
        return basketDao.listCart(bas_memno);
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
    public void updateCart(BasketBean basketBean) {
    	basketDao.updateCart(basketBean);
    }
  
     
	/*@Override
	public MemberBean login(String id) {
		return basketDao.login(id);
	}*/
		
}
