package kr.co.gotthem.admin.service;

import java.util.List;
import kr.co.gotthem.admin.dao.AdminDao;
import kr.co.gotthem.store.bean.StoreBean;

public class AdminServiceImpl implements AdminService {
	
	private AdminDao adminDao;

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	@Override
	public List<StoreBean> list() {
		return null;
	}
	
}
