package kr.co.gotthem.member.service;

import java.util.List;

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
}
