package kr.co.gotthem.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import kr.co.gotthem.product.bean.ProductBean;

public interface ProductService {
	public List<ProductBean> plist(Model model, int pro_memno, int pageNo);
	
	public ProductBean findCode(int pro_code);

	public void updatePro(ProductBean bean);

	public void deletePro(int pro_code);
	
	public void insertPro(ProductBean bean);

	public ProductBean detailProduct(int pro_code);
	
    public List<ProductBean> listProduct();

    public List productInfo(int mem_no, String category);

    public List productSearchList(Map<String, Object> map);

	public List searchList(Model model, String search, int pageNo);

	public ProductBean productDetail(int pro_code);
	
}
