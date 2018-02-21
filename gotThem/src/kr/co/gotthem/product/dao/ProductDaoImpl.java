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
	public List<ProductBean> productList() {
		System.out.println("dddd");
		return sqlSessionTemplate.selectList("list");
		
	}
	 // 01. 상품목록
    @Override
    public List<ProductBean> listProduct() {
        return sqlSessionTemplate.selectList("listProduct");
    }
    // 02. 상품상세
    @Override
    public ProductBean detailProduct(int pro_code) {
        return sqlSessionTemplate.selectOne("detailProduct", pro_code);
    }
	
	
	
}
