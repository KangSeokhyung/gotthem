package kr.co.gotthem.admin.service;

import java.util.List;

import kr.co.gotthem.store.bean.StoreBean2;
import kr.co.gotthem.store.dao.StoreDao;

public class AdminServiceImpl implements AdminService {
	
	private StoreDao storeDao;

	public void setStoreDao(StoreDao storeDao) {
		this.storeDao = storeDao;
	}

	@Override
	public List<StoreBean2> list() {
		return null;
	}

}
