package kr.co.gotthem.basket.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import kr.co.gotthem.basket.bean.BasketBean;
import kr.co.gotthem.member.bean.MemberBean;

public class BasketDaoImpl implements BasketDao {

	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public List<BasketBean> list() {
		return sqlSessionTemplate.selectList("list");
	}

	@Override
	public BasketBean FindByNo(int bas_no) {
		return (BasketBean)sqlSessionTemplate.selectOne("FindByNo", bas_no);
	}

	@Override
	public void insert(BasketBean basketBean) {
		sqlSessionTemplate.insert("insert", basketBean);
	}
	
	@Override
	public int totalCount() {
		return (int)sqlSessionTemplate.selectOne("totalCount");
	}

	@Override
	public int update(int bas_no) {
		return (int)sqlSessionTemplate.update("update", bas_no);
	}
	
	@Override
	public void delete(int bas_no) {
		sqlSessionTemplate.delete("delete", bas_no);
	}
	
	/*@Override
	public MemberBean login(String id) {
		return sqlSessionTemplate.selectOne("login", id);
	}*/
	
}
