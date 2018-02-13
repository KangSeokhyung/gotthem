package kr.co.gotthem.store.dao;

import java.util.List;

import kr.co.gotthem.store.bean.StoreBean;

public interface StoreDao {
	public List<StoreBean> list();

	public StoreBean FindById(String sto_id);
}
