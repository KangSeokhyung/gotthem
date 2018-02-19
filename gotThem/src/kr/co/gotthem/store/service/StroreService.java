package kr.co.gotthem.store.service;

import java.util.List;

import kr.co.gotthem.store.bean.StoreBean;

public interface StroreService {
	public List<StoreBean> list();
	
	public StoreBean FindById(String sto_id);
	public int joinStore(StoreBean bean);
}
