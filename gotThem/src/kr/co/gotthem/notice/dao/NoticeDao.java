package kr.co.gotthem.notice.dao;

import java.util.List;

import kr.co.gotthem.notice.bean.NoticeBean;

public interface NoticeDao {
	public List<NoticeBean> noticeListSelect(int begin, int end);
	
	public int countRow();

	public void createContent(NoticeBean bean);
	
	public NoticeBean selectContent(int not_no);
	
	public void addHit(int not_no);
	
	public void contentDelete(int not_no);
	
	public void contentUpdate(NoticeBean bean);
}
