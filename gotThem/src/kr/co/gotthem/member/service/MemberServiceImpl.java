package kr.co.gotthem.member.service;

import java.util.List;
import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.member.dao.MemberDao;

public class MemberServiceImpl implements MemberService {
	
	private MemberDao memberDao;
	
	@Override
	public MemberBean memberInfo(String mem_id) {
		return memberDao.memberInfo(mem_id);
	}
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public int join(MemberBean memberBean) {
		int result = memberDao.join(memberBean);
		return result;
	}
	
	@Override
	public int stjoin(MemberBean memberBean) {
		int reuslt = memberDao.join(memberBean);
		return reuslt;
	}

	@Override
	public MemberBean login(String id) {
		return memberDao.login(id);
	}
	
	@Override
	public int duplCheck(String mem_id) {
		return memberDao.duplCheck(mem_id);
	}
	
	@Override
	public void memberModifi(MemberBean memberBean) {
		memberDao.memberModifi(memberBean);
	}
	
	@Override
	public int passCheck(MemberBean memberBean) {
		return memberDao.passCheck(memberBean);
	}

	@Override
	public void memberDelete(MemberBean memberBean) {
		memberDao.memberDelete(memberBean);
	}
	
	@Override
	public MemberBean findAccount(String email) {
		return memberDao.findAccount(email);
	}
	
	@Override
	public void changePassword(MemberBean memberBean) {
		memberDao.changePassword(memberBean);
	}
	
	public List<MemberBean> mlist(){
		return memberDao.mlist();
	}
	
	@Override
	public List<MemberBean> stlist(){
		return memberDao.stlist();
	}
}
