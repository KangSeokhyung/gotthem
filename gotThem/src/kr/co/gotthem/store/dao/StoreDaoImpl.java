package kr.co.gotthem.store.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import kr.co.gotthem.store.bean.StoreBean;

public class StoreDaoImpl implements StoreDao {

	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public List<StoreBean> list() {
		return sqlSessionTemplate.selectList("list");
	}

}
