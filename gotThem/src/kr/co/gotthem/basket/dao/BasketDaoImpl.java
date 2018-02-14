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
	
	@Override
	public void delete(int bas_no) {
		sqlSessionTemplate.delete("delete", bas_no);
	}
	
	 // 2. 장바구니 목록
    @Override
    public List<BasketBean> listCart(int bas_memno) {
        return sqlSessionTemplate.selectList("listCart", bas_memno);
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
    public void updateCart(BasketBean basketBean) {
    	sqlSessionTemplate.update("updateCart", basketBean);
    }
	/*@Override
	public MemberBean login(String id) {
		return sqlSessionTemplate.selectOne("login", id);
	}*/
	
}
