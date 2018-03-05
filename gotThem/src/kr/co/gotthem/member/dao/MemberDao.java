package kr.co.gotthem.member.dao;

import java.util.List;
import kr.co.gotthem.member.bean.MemberBean;

public interface MemberDao {
	public MemberBean memberInfo(String mem_id);
	
	public int join(MemberBean memberBean);
	
	public int stjoin(MemberBean memberBean);
	
	public MemberBean login(String id);
	
	public int duplCheck(String mem_id);
	
	public void memberModifi(MemberBean memberBean);
	
	public int passCheck(MemberBean memberBean);
	
	public void memberDelete(MemberBean memberBean);
	
	public MemberBean findAccount(String email);
	
	public void changePassword(MemberBean memberBean);

	public List<MemberBean> mlist();

	public List<MemberBean> stlist();
	
	public MemberBean storeInfo(int mem_no);

	public void storeModi(MemberBean memberBean);
	
	public void memModi(MemberBean memberBean);
}
