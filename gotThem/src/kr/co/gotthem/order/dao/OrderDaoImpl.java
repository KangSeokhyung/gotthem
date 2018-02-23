package kr.co.gotthem.order.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import kr.co.gotthem.basket.bean.BasketBean;
import kr.co.gotthem.order.bean.OrderBean;

public class OrderDaoImpl implements OrderDao {

	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public List<BasketBean> list() {
		return sqlSessionTemplate.selectList("list");
	}

	@Override
	public BasketBean FindByNo(int bas_no) {
		return (BasketBean)sqlSessionTemplate.selectOne("FindByNo", bas_no);
	}

	@Override
	public void insert(BasketBean basketBean) {
		sqlSessionTemplate.insert("insert", basketBean);
	}
	
	@Override
	public int totalCount() {
		return (int)sqlSessionTemplate.selectOne("totalCount");
	}

	@Override
	public int update(int bas_no) {
		return (int)sqlSessionTemplate.update("update", bas_no);
	}
	
	/*@Override
	public void delete(int bas_no) {
		sqlSessionTemplate.delete("delete", bas_no);
	}*/
	
	// 1. 장바구니 추가
    @Override
    public void insertOrder(OrderBean orderBean) {
    	sqlSessionTemplate.insert("insertOrder", orderBean);
    }    
   // 1.1 상품 삭제
    @Override
    public void deleteproduct(int bas_no) {
    	sqlSessionTemplate.insert("deleteproduct", bas_no);
    }
 
	
/*	// 1. 장바구니 추가
    @Override
    public void insertBasket(int code, int userNo,int stock) {
    	sqlSessionTemplate.insert("insertBasket");
    }*/
	
	// 2. 장바구니 목록
    @Override
    public List<BasketBean> listBasket(int bas_memno) {
        return sqlSessionTemplate.selectList("listBasket", bas_memno);
    }
    
   // 3. 장바구니 삭제
    @Override
    public void deleteBasket(int bas_no) {
    	sqlSessionTemplate.delete("deleteBasket", bas_no);
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
	/*@Override
	public MemberBean login(String id) {
		return sqlSessionTemplate.selectOne("login", id);
	}*/
	
}
