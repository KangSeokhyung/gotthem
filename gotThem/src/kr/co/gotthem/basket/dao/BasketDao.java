package kr.co.gotthem.basket.dao;

import java.util.List;
import kr.co.gotthem.basket.bean.BasketBean;
import kr.co.gotthem.member.bean.MemberBean;


public interface BasketDao {
	public List<BasketBean> list();
	
	public BasketBean FindByNo(int bas_no);
	
	public void insert(BasketBean basketBean);
	
	public int totalCount();
	
	public int update(int bas_no);
	
	public void delete(int bas_no);
	
	// 2. 장바구니 목록
    public List<BasketBean> listCart(int bas_memno);
    
    // 5. 장바구니 금액 합계
    public int sumMoney(int bas_memno);
	
	// 6. 장바구니 동일한 상품 레코드 확인
	public int countBasket(int bas_procode, int bas_memno);
	
	// 7. 장바구니 상품수량 변경
	public void updateCart(BasketBean basketBean);
	
	/*public MemberBean login(String id);*/
}
