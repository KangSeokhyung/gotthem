package kr.co.gotthem.member.dao;

import java.util.List;
import kr.co.gotthem.member.bean.MemberBean;

public interface MemberDao {
	public MemberBean login(String id);
}
