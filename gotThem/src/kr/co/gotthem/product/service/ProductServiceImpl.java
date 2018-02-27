package kr.co.gotthem.product.service;

import java.util.List;
import java.util.Map;

import kr.co.gotthem.product.bean.ProductBean;
import kr.co.gotthem.product.dao.ProductDao;

public class ProductServiceImpl implements ProductService {
	
	private ProductDao productDao;

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	@Override
	public List<ProductBean> plist(int pro_stono) {
		return productDao.plist(pro_stono);
	}

	@Override
	public ProductBean findCode(int pro_code) {
		return productDao.findCode(pro_code);
	}

	@Override
	public void updatePro(ProductBean bean) {
		productDao.updatePro(bean);
	}
	
	@Override
	public void deletePro(int pro_code) {
		productDao.deletePro(pro_code);
	}

	@Override
	public void insertPro(ProductBean bean) {
		productDao.insertPro(bean);
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
	
	@Override
		public ProductBean detailProduct(int pro_code) {
		return productDao.detailProduct(pro_code);
		}

	@Override
	public List<ProductBean> listProduct() {
			return productDao.listProduct();
	}
	
}
