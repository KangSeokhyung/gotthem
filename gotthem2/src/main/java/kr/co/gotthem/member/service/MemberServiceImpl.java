package kr.co.gotthem.member.service;

import java.util.List;
import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.member.dao.MemberDao;

public class MemberServiceImpl implements MemberService {
	
	private MemberDao memberDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public List<MemberBean> mlist() {
		return memberDao.mlist();
	}
	
	@Override
	public void insert(MemberBean memberBean) {
		memberDao.insert(memberBean);
	}

	@Override
	public MemberBean login(String id) {
		return memberDao.login(id);
	}

	@Override
	public MemberBean storeInfo(int mem_no) {
		return memberDao.storeInfo(mem_no);
	}

}
