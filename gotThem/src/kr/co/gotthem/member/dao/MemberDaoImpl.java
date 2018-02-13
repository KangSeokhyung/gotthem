package kr.co.gotthem.member.dao;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;

import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.store.bean.StoreBean;

public class MemberDaoImpl implements MemberDao{
	
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public List<MemberBean> mlist() {
		return sqlSessionTemplate.selectList("mlist");
	}
	
	@Override
	public void insert(MemberBean memberBean) {
		sqlSessionTemplate.insert("join", memberBean);
	}

	@Override
	public MemberBean login(String id) {
		return sqlSessionTemplate.selectOne("login", id);
	}

}
