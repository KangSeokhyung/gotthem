package kr.co.gotthem.product.service;

import java.util.List;
import kr.co.gotthem.product.bean.ProductBean;

public interface ProductService {

	// 01. 상품목록
    public List<ProductBean> listProduct();
    // 02. 상품상세
    public ProductBean detailProduct(int pro_code);

	public List<ProductBean> plist(int pro_stono);
	
	public ProductBean findCode(int pro_code);

	public void updatePro(ProductBean bean);

	public void deletePro(int pro_code);

}
