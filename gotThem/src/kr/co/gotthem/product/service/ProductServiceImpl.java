package kr.co.gotthem.product.service;

import java.util.List;

import kr.co.gotthem.product.bean.ProductBean;
import kr.co.gotthem.product.dao.ProductDao;

public class ProductServiceImpl implements ProductService {
	
	private ProductDao productDao;

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	@Override
	public List<ProductBean> plist() {
		return productDao.plist();
	}

}
