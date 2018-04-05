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
		int result = sqlSessionTemplate.update("memModi", memberBean);
		System.out.println("회원정보 관리자 수정 후 결과는 : " + result);
	}
	
	@Override
	public int passCheck(MemberBean memberBean) {
		return sqlSessionTemplate.selectOne("passCheck", memberBean);
	}
	
	@Override
	public int memberDelete(MemberBean memberBean) {
		System.out.println(memberBean);
		int result = sqlSessionTemplate.update("memberDelete",memberBean);
		System.out.println("회원탈퇴 결과는 " + result);
		return result;
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
	
	@Override
	public int countRow() {
		return sqlSessionTemplate.selectOne("memCount");
	}
	
	@Override
	public int stcountRow() {
		return sqlSessionTemplate.selectOne("stoCount");
	}
	
	@Override
	public MemberBean storeInfo(int mem_no) {
		return sqlSessionTemplate.selectOne("storeInfo", mem_no);
	}
	
	@Override
	public void kakaoJoin(MemberBean memberBean) {
		int result = sqlSessionTemplate.insert("kakaoJoin",memberBean);
		if(result > 0) {
			System.out.println("카톡으로 회원가입 성공");
		}
	}

	@Override
	public String selectStoName(int pro_memno) {
		return sqlSessionTemplate.selectOne("selectStoName", pro_memno);
	}

	@Override
	public List<MemberBean> selectSearch(int begin, String select, String search, String gubun) {
		Map map = new HashMap();
		map.put("begin", begin);
		map.put("select", select);
		map.put("search", search);
		
		if (gubun.equals("회원")) {
			return sqlSessionTemplate.selectList("selectSearch", map);
		}
		return sqlSessionTemplate.selectList("selectSearch_j", map);
	}

	@Override
	public int selectSearchCount(int begin, String select, String search, String gubun) {
		Map map = new HashMap();
		map.put("begin", begin);
		map.put("select", select);
		map.put("search", search);
		
		if (gubun.equals("회원")) {
			return sqlSessionTemplate.selectOne("selectSearchCount", map);
		}
		return sqlSessionTemplate.selectOne("selectSearchCount_j", map);
	}
	
}
