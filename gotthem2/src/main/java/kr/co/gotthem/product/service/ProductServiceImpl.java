package kr.co.gotthem.product.service;

import java.util.List;
import java.util.Map;

import kr.co.gotthem.product.dao.ProductDao;

public class ProductServiceImpl implements ProductService {
	
	private ProductDao productDao;

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	@Override
	public List searchList(String search) {
		return productDao.searchList(search);
	}

	@Override
	public List productInfo(int mem_no) {
		return productDao.productInfo(mem_no);
	}

	@Override
	public List productSearchList(Map<String, Object> map) {
		return productDao.productSearchList(map);
	}


}
