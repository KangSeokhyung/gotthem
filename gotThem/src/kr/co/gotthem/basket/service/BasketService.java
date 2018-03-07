package kr.co.gotthem.basket.service;

import java.util.List;

import kr.co.gotthem.basket.bean.BasketBean;

public interface BasketService {
	
	public List<BasketBean> list();
	
	public BasketBean FindByNo(int bas_no);
	
    public void insert(BasketBean basketBean);
	
	public int totalCount();
	
	public int update(int bas_no);
		
    // 1. 장바구니 추가
    public void insertBasket(BasketBean basketBean);

    // 2. 장바구니 목록
    public List<BasketBean> listBasket(int bas_memno);
    
    // 3. 장바구니 삭제
    public void deleteBasket(BasketBean basketBean);
    
    // 4. 장바구니 수정
    public void modifyBasket(BasketBean basketBean);
    
    // 5. 장바구니 금액 합계
    public int sumMoney(int bas_memno);
    
	// 6. 장바구니 상품 확인
	public int countBasket(int bas_procode, int bas_memno);
	
	// 7. 장바구니 상품 수량 변경
    public void updateBasket(BasketBean basketBean);
	
/*	public MemberBean login(String id);*/
}
