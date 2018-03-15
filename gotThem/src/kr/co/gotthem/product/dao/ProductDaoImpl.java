package kr.co.gotthem.product.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import kr.co.gotthem.product.bean.ProductBean;

public class ProductDaoImpl implements ProductDao {

	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public List<ProductBean> plist(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectList("plist", map);
	}
	
	@Override
	public int plistCount(int pro_memno) {
		return sqlSessionTemplate.selectOne("plistCount", pro_memno);
	}

	@Override
	public ProductBean findCode(int pro_code) {
		return (ProductBean)sqlSessionTemplate.selectOne("findCode", pro_code);
	}

	@Override
	public void updatePro(ProductBean bean) {
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

	@Override
	public ProductBean detailProduct(int pro_code) {
		return	(ProductBean) sqlSessionTemplate.selectOne("detailProduct1", pro_code);
	}
	
	@Override
	public List<ProductBean> listProduct() {
			return sqlSessionTemplate.selectList("listProduct");
	}

	@Override
	public List searchList(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectList("searchList", map);
	}
	
	@Override
	public List productInfo(int mem_no, String category) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_no", mem_no);
		map.put("category", category);
		
		return sqlSessionTemplate.selectList("productInfo", map);
	}

	@Override
	public List productSearchList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("productSearchList", map);
	}

	@Override
	public int searchListCount(String search) {
		return sqlSessionTemplate.selectOne("searchListCount", search);
	}

	@Override
	public ProductBean productDetail(int pro_code) {
		return sqlSessionTemplate.selectOne("productDetail", pro_code);
	}
	
	@Override
	public int productSearchStock(int pro_code) {
		return sqlSessionTemplate.selectOne("productSearchStock", pro_code);
	}

}
