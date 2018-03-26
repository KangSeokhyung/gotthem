package kr.co.gotthem.order.dao;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import kr.co.gotthem.basket.bean.BasketBean;
import kr.co.gotthem.order.bean.OrderpayBean;
import kr.co.gotthem.product.bean.ProductBean;

public class OrderDaoImpl implements OrderDao {

	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}


	
	// 1.장바구니에서 결제 추가
    @Override
    public void orderInsert(OrderpayBean orderBean) {
    	sqlSessionTemplate.insert("orderInsert", orderBean);
    }    
    //1.1. 결제 되면, 상품에서 결제된 수량만큼  수량 빼기
    @Override
    public void orderUpdateBasket(OrderpayBean orderBean) {
    	sqlSessionTemplate.update("orderUpdateBasket", orderBean);
    }
    // 1.2 결제되면, 장바구니 삭제
    @Override
    public void orderDeleteBasket(OrderpayBean orderBean) {
    	sqlSessionTemplate.delete("orderDeleteBasket", orderBean);
    }

    
   // 2. 결제 취소 삭제
    @Override
    public void orderDelete(int ord_no) {
    	sqlSessionTemplate.delete("orderDelete", ord_no);
    }
    //2.1. 결제 취소되면, 결제된 수량만큼  상품에 수량 더하기
    @Override
    public void orderUpdateProduct(OrderpayBean orderBean) {
    	sqlSessionTemplate.update("orderUpdateProduct", orderBean);
    }    
    
    
	// 3. 아이디별 전체 결제 목록
    @Override
    public List<OrderpayBean> listOrder(int userNo) {
        return sqlSessionTemplate.selectList("listOrder",userNo);
    }
   
    
	// 3.1 사장님 아이디별 전체 결제 목록
	@Override
	public List<OrderpayBean> storeListOrder(String userName) {
		return sqlSessionTemplate.selectList("storeListOrder", userName);
	}

	// 3.2 사장님 아이디별 기간 결제 목록
	@Override
	public List<OrderpayBean> storeListOrderTime(int userNo, Timestamp begin, Timestamp end) {
/*		List<OrderpayBean> storeListOrderTime = null;
*/		HashMap<String, Object> count = new HashMap<String, Object>();
		count.put("userNo", userNo);
		count.put("begin", begin);
		count.put("end", end);

		return sqlSessionTemplate.selectList("storeListOrderTime", count);
	}
    
}
