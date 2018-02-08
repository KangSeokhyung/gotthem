package kr.co.gotthem.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import kr.co.gotthem.store.bean.StoreBean2;

public class AdminDaoImpl implements AdminDao {

	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public List<StoreBean2> list() {
		return sqlSessionTemplate.selectList("list");
	}

}
