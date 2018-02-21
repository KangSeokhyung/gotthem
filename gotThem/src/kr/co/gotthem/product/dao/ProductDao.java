package kr.co.gotthem.product.dao;

import java.util.List;

import kr.co.gotthem.product.bean.ProductBean;

public interface ProductDao {
	public List<ProductBean> productList();

	// 01. 상품목록
    public List<ProductBean> listProduct();
    
    // 02. 상품상세
    public ProductBean detailProduct(int pro_code);
}
