package kr.co.gotthem.admin.service;

import java.util.List;

import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.admin.dao.AdminDao;


public interface AdminService {
	public List<MemberBean> list();
	public void setAdminDao(AdminDao adminDao);
}
