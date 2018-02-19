package kr.co.gotthem.product.dao;

import java.util.List;

import kr.co.gotthem.product.bean.ProductBean;

public interface ProductDao {
	public List<ProductBean> plist(int pro_stono);
}
