package kr.co.gotthem.notice.bean;

import java.sql.Date;

public class NoticeBean {
	private int not_no;
	private String not_title;
	private String not_date;
	private int not_hit;
	private String not_writer;
	private String not_content;
	public int getNot_no() {
		return not_no;
	}
	public void setNot_no(int not_no) {
		this.not_no = not_no;
	}
	public String getNot_title() {
		return not_title;
	}
	public void setNot_title(String not_title) {
		this.not_title = not_title;
	}
	public String getNot_date() {
		return not_date;
	}
	public void setNot_date(String not_date) {
		this.not_date = not_date;
	}
	public int getNot_hit() {
		return not_hit;
	}
	public void setNot_hit(int not_hit) {
		this.not_hit = not_hit;
	}
	public String getNot_writer() {
		return not_writer;
	}
	public void setNot_writer(String not_writer) {
		this.not_writer = not_writer;
	}
	public String getNot_content() {
		return not_content;
	}
	public void setNot_content(String not_content) {
		this.not_content = not_content;
	}
	@Override
	public String toString() {
		return "NoticeBean [not_no=" + not_no + ", not_title=" + not_title + ", not_date=" + not_date + ", not_hit="
				+ not_hit + ", not_writer=" + not_writer + ", not_content=" + not_content + "]";
	}
	
	
}
