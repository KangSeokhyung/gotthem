package kr.co.gotthem.product.service;

import java.util.List;

import kr.co.gotthem.product.bean.ProductBean;
import kr.co.gotthem.product.dao.ProductDao;


public class ProductServiceImpl implements ProductService {
	
	private ProductDao productDao;

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	// 01. 상품목록
    @Override
    public List<ProductBean> listProduct() {
        return productDao.listProduct();
    }
    // 02. 상품상세
    @Override
    public ProductBean detailProduct(int pro_code) {
        return productDao.detailProduct(pro_code);
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

}
