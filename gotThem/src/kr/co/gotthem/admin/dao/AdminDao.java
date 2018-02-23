package kr.co.gotthem.admin.dao;

import java.util.List;
import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.store.bean.StoreBean;

public interface AdminDao {
	public List<StoreBean> list();
}
