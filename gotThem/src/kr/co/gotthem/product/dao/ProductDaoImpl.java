package kr.co.gotthem.product.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import kr.co.gotthem.product.bean.ProductBean;

public class ProductDaoImpl implements ProductDao {

	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public List<ProductBean> plist(int pro_stono) {
		return sqlSessionTemplate.selectList("plist", pro_stono);
	}


}
