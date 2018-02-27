package kr.co.gotthem.product.service;

import java.util.List;
import java.util.Map;

public interface ProductService {

	public List searchList(String search);
	
	public List productInfo(int mem_no);

	public List productSearchList(Map<String, Object> map);
}
