package kr.co.gotthem.product.dao;

import java.util.List;

import kr.co.gotthem.store.bean.StoreBean;

public interface ProductDao {
	public List<StoreBean> list();
}
