package kr.co.gotthem.member.service;

import java.util.List;
import kr.co.gotthem.member.bean.MemberBean;

public interface MemberService {
	public MemberBean memberInfo(String mem_id);
	
	public int join(MemberBean memberBean);

	public MemberBean login(String id);
	
	public int duplCheck(String mem_id);
	
	public void memberModifi(MemberBean memberBean);
	
	public int passCheck(MemberBean memberBean);
	
	public void memberDelete(MemberBean memberBean);
}
