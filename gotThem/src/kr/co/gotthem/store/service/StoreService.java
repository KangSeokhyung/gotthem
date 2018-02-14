package kr.co.gotthem.store.service;

import java.util.List;

import kr.co.gotthem.store.bean.StoreBean;

public interface StoreService {
	public List<StoreBean> list();
	
	public StoreBean FindById(String sto_id);
}
