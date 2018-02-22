package kr.co.gotthem.product.dao;

import java.util.List;

import kr.co.gotthem.product.bean.ProductBean;
import kr.co.gotthem.store.bean.StoreBean;

public interface ProductDao {
	public List<ProductBean> plist(int pro_stono);
	
	public ProductBean findCode(int pro_code);
	
	public void updatePro(ProductBean bean);

	public void deletePro(int pro_code);

	public void insertPro(ProductBean bean);
}
