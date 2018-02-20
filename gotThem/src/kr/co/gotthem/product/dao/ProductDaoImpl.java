package kr.co.gotthem.product.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import kr.co.gotthem.product.bean.ProductBean;
import kr.co.gotthem.store.bean.StoreBean;

public class ProductDaoImpl implements ProductDao {

	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public List<ProductBean> plist(int pro_stono) {
		return sqlSessionTemplate.selectList("plist", pro_stono);
	}

	@Override
	public ProductBean findCode(int pro_code) {
		return (ProductBean)sqlSessionTemplate.selectOne("findCode", pro_code);
	}

	@Override
	public void updatePro(ProductBean bean) {
		System.out.println("dao임플안의 bean = " + bean);
		sqlSessionTemplate.update("updatePro", bean);
	}


}
