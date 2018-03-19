package kr.co.gotthem.basket.dao;

import java.util.List;
import kr.co.gotthem.basket.bean.BasketBean;
import kr.co.gotthem.member.bean.MemberBean;


public interface BasketDao {	
	
	// 1. 장바구니 추가
    public void insertBasket(BasketBean basketBean);

    // 1.1 상품 삭제
    public void deleteproduct(int bas_no);
    
    // 2. 장바구니 목록
    public List<BasketBean> listBasket(int userNo);
    
    // 3. 장바구니 삭제
    public void deleteBasket(BasketBean basketBean);
    
    // 4. 장바구니 수정   
    public void modifyBasket(BasketBean basketBean);
    
    // 5. 장바구니 금액 합계
    public int sumMoney(int bas_memno);

    // 6. 장바구니 동일한 상품 레코드 확인
	public int countBasket(int bas_procode, int bas_memno);
	
	// 7. 장바구니 상품수량 변경
	public void updateBasket(BasketBean basketBean);
	
	// 8. 장바구니 all삭제
    public void deleteBasketAll();
	
	
	/*public MemberBean login(String id);*/
}
