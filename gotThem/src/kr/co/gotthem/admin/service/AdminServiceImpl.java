package kr.co.gotthem.admin.service;

import java.util.List;

import kr.co.gotthem.admin.dao.AdminDao;
import kr.co.gotthem.member.bean.MemberBean;

public class AdminServiceImpl implements AdminService {
	
	private AdminDao adminDao;

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	@Override
	public List<MemberBean> list() {
		return null;
	}
	
}
