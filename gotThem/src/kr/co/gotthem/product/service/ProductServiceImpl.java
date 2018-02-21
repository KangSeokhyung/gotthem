package kr.co.gotthem.product.service;

import java.util.List;

import kr.co.gotthem.product.bean.ProductBean;
import kr.co.gotthem.product.dao.ProductDao;


public class ProductServiceImpl implements ProductService {
	
	private ProductDao productDao;

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

/*	@Override
	public List<ProductBean> productList() {
		System.out.println( "productDao는"+ productDao);
		return productDao.productList();
	}*/
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
}
