package kr.co.gotthem.member.dao;

import java.util.List;
import kr.co.gotthem.member.bean.MemberBean;

public interface MemberDao {
	public List<MemberBean> mlist();
	
	public void insert(MemberBean memberBean);
	
	public MemberBean login(String id);
}
