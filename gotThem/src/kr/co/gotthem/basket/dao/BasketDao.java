package kr.co.gotthem.basket.dao;

import java.util.List;
import kr.co.gotthem.basket.bean.BasketBean;
import kr.co.gotthem.member.bean.MemberBean;


public interface BasketDao {
	public List<BasketBean> list();
	
	public BasketBean FindByNo(int bas_no);
	
	public void insert(BasketBean basketBean);
	
	public int totalCount();
	
	public int update(int bas_no);
	
	public void delete(int bas_no);
	
	/*public MemberBean login(String id);*/
}
