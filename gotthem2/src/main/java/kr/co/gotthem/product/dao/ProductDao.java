package kr.co.gotthem.product.dao;


import java.util.List;
import java.util.Map;

public interface ProductDao {
	
	public List searchList(String search);
	
	public List productInfo(int mem_no);

	public List productSearchList(Map<String, Object> productSearch);
}
