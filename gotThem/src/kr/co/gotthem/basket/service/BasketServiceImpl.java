package kr.co.gotthem.basket.service;

import java.util.List;

import kr.co.gotthem.basket.bean.BasketBean;
import kr.co.gotthem.basket.dao.BasketDao;
import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.member.dao.MemberDao;

public class BasketServiceImpl implements BasketService {
	
	private BasketDao basketDao;

	public void setBasketDao(BasketDao basketDao) {
		this.basketDao = basketDao;
	}

	@Override
	public List<BasketBean> list() {
		return basketDao.list();
	}

	@Override
	public BasketBean FindByNo(int bas_no) {
		
		return basketDao.FindByNo(bas_no);
	}
	
	@Override
	public void insert(BasketBean basketBean) {		
	}
	
	@Override
	public int totalCount() {
		return basketDao.totalCount();
	}
	
	@Override
	public int update(int bas_no) {
		return basketDao.update(bas_no);
	}
	
	@Override
	public void delete(int bas_no) {
	}
	
	/*@Override
	public MemberBean login(String id) {
		return basketDao.login(id);
	}*/
		
}
