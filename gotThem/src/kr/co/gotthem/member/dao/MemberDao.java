package kr.co.gotthem.member.dao;

import java.util.List;

import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.store.bean.StoreBean;

public interface MemberDao {

	public List<StoreBean> list();
	
	public void insert(MemberBean memberBean);
	
	public MemberBean login(String id);

}
