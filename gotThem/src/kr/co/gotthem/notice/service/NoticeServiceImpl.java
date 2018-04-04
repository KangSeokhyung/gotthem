package kr.co.gotthem.notice.service;

import java.util.List;

import kr.co.gotthem.notice.bean.NoticeBean;
import kr.co.gotthem.notice.dao.NoticeDao;

public class NoticeServiceImpl implements NoticeService {
	
	private NoticeDao noticeDao;
	
	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}
	
	public List<NoticeBean> noticeListSelect(int begin, int end){
		return noticeDao.noticeListSelect(begin, end);
	}

	public int countRow() {
		return noticeDao.countRow();
	}
	
	public void createContent(NoticeBean bean) {
		noticeDao.createContent(bean);
	}
	
	public NoticeBean selectContent(int not_no) {
		return noticeDao.selectContent(not_no);
	}
	
	public void addHit(int not_no) {
		noticeDao.addHit(not_no);
	}
	
	public void contentDelete(int not_no) {
		noticeDao.contentDelete(not_no);
	}
	
	public void contentUpdate(NoticeBean bean) {
		noticeDao.contentUpdate(bean);
	}
}
