package kr.co.gotthem.admin.service;

import java.util.List;
import kr.co.gotthem.admin.dao.AdminDao;


public class AdminServiceImpl implements AdminService {
	
	private AdminDao adminDao;

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	
	
}
