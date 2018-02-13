package kr.co.gotthem.member.service;

import java.util.List;

import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.member.dao.MemberDao;
import kr.co.gotthem.store.bean.StoreBean;
import kr.co.gotthem.store.dao.StoreDao;

public class MemberServiceImpl implements MemberService{
	
	private MemberDao memberDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public List<StoreBean> list() {
		return memberDao.list();
	}
	
	@Override
	public void insert(MemberBean memberBean) {
		memberDao.insert(memberBean);
	}

	@Override
	public MemberBean login(String id) {
		return memberDao.login(id);
	}
	

}
