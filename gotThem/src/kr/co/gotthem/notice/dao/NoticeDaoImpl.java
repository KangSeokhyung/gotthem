package kr.co.gotthem.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import kr.co.gotthem.member.bean.MemberBean;
import kr.co.gotthem.notice.bean.NoticeBean;

public class NoticeDaoImpl implements NoticeDao {
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public List<NoticeBean> noticeListSelect(int begin, int end) {
		return sqlSessionTemplate.selectList("noticeListSelect", begin);
	}
	
	public int countRow() {
		return sqlSessionTemplate.selectOne("noticeCount");
	}
	
	public void createContent(NoticeBean bean) {
		int result = sqlSessionTemplate.insert("createContent", bean);
		if(result==0) {
			System.out.println("글 등록 실패");
		}else{
			System.out.println("글 등록 성공");
		}
	}
	
	public NoticeBean selectContent(int not_no) {
		return sqlSessionTemplate.selectOne("selectContent", not_no);
	}
	
	public void addHit(int not_no) {
		sqlSessionTemplate.update("hit", not_no);
	}
	
	public void contentDelete(int not_no) {
		int result = sqlSessionTemplate.delete("contentDelete",not_no);
		if(result==1) {
			System.out.println("게시물 삭제 성공");
		}else {
			System.out.println("게시물 삭제 실패");
		}
	}
	
	public void contentUpdate(NoticeBean bean) {
		int result = sqlSessionTemplate.update("contentUpdate",bean);
		if(result==1) {
			System.out.println("수정 성공");
		}else {
			System.out.println("수정 실패");
		}
	}
}
