package kr.co.gotthem.product.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.gotthem.product.bean.ProductBean;

public interface ProductDao {
	public List<ProductBean> plist(int pro_memno);
	
	public ProductBean findCode(int pro_code);
	
	public void updatePro(ProductBean bean);

	public void deletePro(int pro_code);

	public void insertPro(ProductBean bean);

	public ProductBean detailProduct(int pro_code);

	public List<ProductBean> listProduct();

	List productInfo(int mem_no, String category);

	List searchList(HashMap<String, Object> map);

	List productSearchList(Map<String, Object> map);

	int searchListCount(String search);

}
