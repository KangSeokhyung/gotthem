package kr.co.gotthem.product.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;


public class ProductDaoImpl implements ProductDao {

	private SqlSessionTemplate sqlSessionTemplate;
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public List searchList(String search) {
		return sqlSessionTemplate.selectList("searchList", search);
	}

	@Override
	public List productInfo(int mem_no) {
		return sqlSessionTemplate.selectList("productInfo", mem_no);
	}

	@Override
	public List productSearchList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("productSearchList", map);
	}

}
