package kr.co.gotthem.basket.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import kr.co.gotthem.basket.bean.BasketBean;

public class BasketDaoImpl implements BasketDao {

	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	// 1. 장바구니 추가
    @Override
    public void insertBasket(BasketBean basketBean) {
    	sqlSessionTemplate.insert("insertBasket", basketBean);
    }    
    // 1.1 상품 삭제
    @Override
    public void deleteproduct(int bas_no) {
    	sqlSessionTemplate.insert("deleteproduct", bas_no);
    }
 	
	// 2. 장바구니 목록
    @Override
    public List<BasketBean> listBasket(int userNo) {
        return sqlSessionTemplate.selectList("listBasket", userNo);
    }
    
    // 3. 장바구니 삭제
    @Override
    public void deleteBasket(BasketBean basketBean) {
    	sqlSessionTemplate.delete("deleteBasket", basketBean);
    }
    
    // 4. 장바구니 수정
    @Override
    public void modifyBasket(BasketBean basketBean) {
    	sqlSessionTemplate.update("modifyBasket", basketBean);
    }
    
    // 5. 장바구니 금액 합계
    @Override
    public int sumMoney(int bas_memno) {
    	sqlSessionTemplate.selectOne("sumMoney", bas_memno);
        return sqlSessionTemplate.selectOne("sumMoney", bas_memno);
    }

	// 6. 장바구니 동일한 상품 레코드 확인
	@Override
    public int countBasket(int bas_procode, int bas_memno) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("bas_procode", bas_procode);
        map.put("bas_memno", bas_memno);
        return sqlSessionTemplate.selectOne("countBasket", map);
    }
	
	// 7. 장바구니 상품수량 변경
    @Override
    public void updateBasket(BasketBean basketBean) {
    	sqlSessionTemplate.update("updateBasket", basketBean);
    }
    
   // 8. 장바구니  All 삭제
    @Override
    public void deleteBasketAll(int a) {
    	sqlSessionTemplate.delete("deleteBasketAll", a);
    }	
}
