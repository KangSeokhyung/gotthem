package kr.co.gotthem.product.service;

import java.util.List;

import kr.co.gotthem.store.bean.StoreBean;
import kr.co.gotthem.store.dao.StoreDao;

public class ProductServiceImpl implements ProductService {
	
	private StoreDao storeDao;

	public void setStoreDao(StoreDao storeDao) {
		this.storeDao = storeDao;
	}

	@Override
	public List<StoreBean> list() {
		return storeDao.list();
	}

}
