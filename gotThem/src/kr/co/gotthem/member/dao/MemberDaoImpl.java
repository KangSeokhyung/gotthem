package kr.co.gotthem.member.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import kr.co.gotthem.member.bean.MemberBean;

public class MemberDaoImpl implements MemberDao {

	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public MemberBean login(String id) {
		return sqlSessionTemplate.selectOne("login", id);
	}

}
