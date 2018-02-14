package kr.co.gotthem.store.service;

import java.util.List;

import kr.co.gotthem.store.bean.StoreBean;
import kr.co.gotthem.store.dao.StoreDao;

public class StoreServiceImpl implements StoreService {
	
	private StoreDao storeDao;

	public void setStoreDao(StoreDao storeDao) {
		this.storeDao = storeDao;
	}

	@Override
	public List<StoreBean> list() {
		return storeDao.list();
	}

	@Override
	public StoreBean FindById(String sto_id) {
		
		return storeDao.FindById(sto_id);
	}

}
