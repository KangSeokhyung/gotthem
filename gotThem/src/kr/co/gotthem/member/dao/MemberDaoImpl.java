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
	public MemberBean memberInfo(String mem_id) {
		return sqlSessionTemplate.selectOne("memberInfo", mem_id);
	}
	
	@Override
	public int join(MemberBean memberBean) {
		int result = sqlSessionTemplate.insert("join", memberBean);
		return result;
	}

	@Override
	public MemberBean login(String id) {
		return sqlSessionTemplate.selectOne("login", id);
	}
	
	@Override
	public int duplCheck(String mem_id) {
		return sqlSessionTemplate.selectOne("duplCheck", mem_id);
	}

}
