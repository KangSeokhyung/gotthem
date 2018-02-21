package kr.co.gotthem.product.service;

import java.util.List;

import kr.co.gotthem.product.bean.ProductBean;

public interface ProductService {
	public List<ProductBean> plist(int pro_stono);
	
	public ProductBean findCode(int pro_code);

	public void updatePro(ProductBean bean);

	public void deletePro(int pro_code);
}
