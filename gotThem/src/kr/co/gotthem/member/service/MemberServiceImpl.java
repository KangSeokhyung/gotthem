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
	public MemberBean memberInfo(String mem_id) {
		return memberDao.memberInfo(mem_id);
	}

	@Override
	public int join(MemberBean memberBean) {
		int result = memberDao.join(memberBean);
		return result;
	}
	
	@Override
	public int stjoin(MemberBean memberBean) {
		int reuslt = memberDao.stjoin(memberBean);
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
	public void storeModi(MemberBean memberBean) {
		memberDao.storeModi(memberBean);
	}
	
	@Override
	public void memModi(MemberBean memberBean) {
		memberDao.memModi(memberBean);
	}
	
	@Override
	public int passCheck(MemberBean memberBean) {
		return memberDao.passCheck(memberBean);
	}

	@Override
	public int memberDelete(MemberBean memberBean) {
		return memberDao.memberDelete(memberBean);
	}
	
	@Override
	public MemberBean findAccount(MemberBean memberBean) {
		return memberDao.findAccount(memberBean);
	}
	
	@Override
	public int changePassword(MemberBean memberBean) {
		int result = memberDao.changePassword(memberBean);
		return result;
	}
	
	public List<MemberBean> mlist(int begin, int end){
		return memberDao.mlist(begin, end);
	}
	
	@Override
	public List<MemberBean> stlist(int begin){
		return memberDao.stlist(begin);
	}
	
	@Override
	public int changePasswordReal(MemberBean memberBean) {
		int result = memberDao.changePasswordReal(memberBean);
		return result;
	}
	
	@Override
	public int countRow() {
		return memberDao.countRow();
	}
	
	@Override
	public int stcountRow() {
		return memberDao.stcountRow();
	}
	
	@Override
	public MemberBean storeInfo(int mem_no) {
		return memberDao.storeInfo(mem_no);
	}
	
	@Override
	public void kakaoJoin(MemberBean memberBean) {
		memberDao.kakaoJoin(memberBean);
	}

	@Override
	public String selectStoName(int pro_memno) {
		return memberDao.selectStoName(pro_memno);
	}

	@Override
	public List<MemberBean> selectSearch(int begin, String select, String search) {
		return memberDao.selectSearch(begin, select, search);
	}
}
