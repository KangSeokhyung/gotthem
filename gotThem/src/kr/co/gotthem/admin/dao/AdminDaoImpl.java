package kr.co.gotthem.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;




public class AdminDaoImpl implements AdminDao {

	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	
}
