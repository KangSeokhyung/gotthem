package kr.co.gotthem.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public MemberBean findAccount(MemberBean memberBean);
	
	public int changePassword(MemberBean memberBean);

	public List<MemberBean> mlist(int begin, int end);

<<<<<<< HEAD
	public List<MemberBean> stlist(int begin);
	
=======
	public List<MemberBean> stlist();

>>>>>>> branch 'sungwoo' of https://github.com/KangSeokhyung/gotthem.git
	public int changePasswordReal(MemberBean memberBean);

	public void storeModi(MemberBean memberBean);
	
	public void memModi(MemberBean memberBean);

	public int countRow();
	
<<<<<<< HEAD
	public int stcountRow();
	
=======
>>>>>>> branch 'sungwoo' of https://github.com/KangSeokhyung/gotthem.git
}
