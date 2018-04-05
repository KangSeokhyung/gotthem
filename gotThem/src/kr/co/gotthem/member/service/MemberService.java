package kr.co.gotthem.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gotthem.member.bean.MemberBean;

public interface MemberService {
	
	public MemberBean memberInfo(String mem_id);
	
	public int join(MemberBean memberBean);
	
	public int stjoin(MemberBean memberBean);

	public MemberBean login(String id);
	
	public int duplCheck(String mem_id);
	
	public void memberModifi(MemberBean memberBean);
	
	public void storeModi(MemberBean memberBean);
	
	public int passCheck(MemberBean memberBean);
	
	public int memberDelete(MemberBean memberBean);
	
	public MemberBean findAccount(MemberBean memberBean);
	
	public int changePassword(MemberBean memberBean);

	public List<MemberBean> mlist(int begin, int end);
	
	public List<MemberBean> stlist(int begin);	

	public int changePasswordReal(MemberBean memberBean);

	public void memModi(MemberBean memberBean);

	public int countRow();

	public int stcountRow();

	public MemberBean storeInfo(int mem_no);
	
	public void kakaoJoin(MemberBean memberBean);

	public String selectStoName(int pro_memno);

	public List<MemberBean> selectSearch(int begin, String select, String search, String gubun);

	public int selectSearchCount(int begin, String select, String search, String gubun);

}
