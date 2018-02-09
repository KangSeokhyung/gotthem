package kr.co.gotthem.member.service;

import java.util.List;

import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.store.bean.StoreBean;

public interface MemberService {
	public List<StoreBean> list();
	
	public void insert(MemberBean memberBean);

	public MemberBean login(String id);
}
