package kr.co.gotthem.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
		System.out.println(memberBean);
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
	public MemberBean findAccount(MemberBean memberBean) {
		return sqlSessionTemplate.selectOne("findAccount",memberBean);
	}
	
	@Override
	public int changePassword(MemberBean memberBean){
		System.out.println(memberBean);
		int result = sqlSessionTemplate.update("changePassword",memberBean);
		System.out.println("비밀번호 변경 결과는 " + result);
		return result;
	}
	
	@Override
	public int changePasswordReal(MemberBean memberBean) {
		int result = sqlSessionTemplate.update("changePasswordReal",memberBean);
		return result;
	}
	
	@Override
	public List<MemberBean> mlist(int begin, int end) {
		return sqlSessionTemplate.selectList("mlist", begin);
	}
	
	@Override
	public List<MemberBean> stlist(int begin){
		return sqlSessionTemplate.selectList("stlist", begin);
	}
	
<<<<<<< HEAD
	@Override
	public int countRow() {
		return sqlSessionTemplate.selectOne("memCount");
	}
=======
>>>>>>> branch 'sungwoo' of https://github.com/KangSeokhyung/gotthem.git
	
	@Override
	public int stcountRow() {
		return sqlSessionTemplate.selectOne("stoCount");
	}
}
