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

	@Override
	public ProductBean findCode(int pro_code) {
		return (ProductBean)sqlSessionTemplate.selectOne("findCode", pro_code);
	}

	@Override
	public void updatePro(ProductBean bean) {
		System.out.println("dao임플안의 bean = " + bean);
		sqlSessionTemplate.update("updatePro", bean);
	}
	
	@Override
	public void deletePro(int pro_code) {
		sqlSessionTemplate.delete("deletePro", pro_code);
	}
	
	@Override
	public void insertPro(ProductBean bean) {
		sqlSessionTemplate.insert("insertPro", bean);
	}
	
}
