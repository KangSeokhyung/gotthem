package kr.co.gotthem.product.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.gotthem.product.bean.ProductBean;

public interface ProductDao {
	public List<ProductBean> plist(HashMap<String, Object> map);
	
	public int plistCount(int pro_memno);
	
	public ProductBean findCode(int pro_code);
	
	public void updatePro(ProductBean bean);

	public void deletePro(int pro_code);

	public void insertPro(ProductBean bean);
	
	public List searchList(HashMap<String, Object> map);
	
	public List productInfo(int mem_no);

	public List productSearchList(Map<String, Object> productSearch);
	
	public int searchListCount(String search);

	public ProductBean detailProduct(int pro_code);

	public List<ProductBean> listProduct();
}
