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
	public int stjoin(MemberBean memberBean) {
		int result = sqlSessionTemplate.insert("stjoin", memberBean);
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
	
	@Override
	public void memberModifi(MemberBean memberBean) {
		int result = sqlSessionTemplate.update("memberModi", memberBean);
		System.out.println("회원정보 수정 업데이트 후 결과는 : " + result);
	}
	
	@Override
	public void storeModi(MemberBean memberBean) {
	   int result = sqlSessionTemplate.update("storeModi", memberBean);
	   System.out.println("점포 수정 업데이트 후 결과는 : " + result);
	}
	
	@Override
	public void memModi(MemberBean memberBean) {
		int result = sqlSessionTemplate.update("memModi", memberBean);
		System.out.println("회원정보 관리자 수정 후 결과는 : " + result);
	}
	
	@Override
	public int passCheck(MemberBean memberBean) {
		return sqlSessionTemplate.selectOne("passCheck", memberBean);
	}
	
	@Override
	public void memberDelete(MemberBean memberBean) {
		System.out.println(memberBean);
		int result = sqlSessionTemplate.update("memberDelete",memberBean);
		System.out.println("회원탈퇴 결과는 " + result);
	}
	
	@Override
	public List<MemberBean> mlist() {
		System.out.println("회원 리스트 뽑아옴");
		return sqlSessionTemplate.selectList("mlist");
	}
	
	@Override
	public List<MemberBean> stlist(){
		System.out.println("점포 리스트 뽑아옴");
		return sqlSessionTemplate.selectList("stlist");
	}

}
