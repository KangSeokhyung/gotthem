package kr.co.gotthem.member.bean;

import java.sql.Date;

public class MemberBean {

	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_email;
	private String mem_phone;
	private String mem_post;
	private String mem_address1;
	private String mem_address2;
	private Date mem_regdate;
	private String mem_status;
	
	
	public MemberBean() {
		super();
	}


	public String getMem_id() {
		return mem_id;
	}


	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}


	public String getMem_pw() {
		return mem_pw;
	}


	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}


	public String getMem_name() {
		return mem_name;
	}


	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}


	public String getMem_email() {
		return mem_email;
	}


	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}


	public String getMem_phone() {
		return mem_phone;
	}


	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}


	public String getMem_post() {
		return mem_post;
	}


	public void setMem_post(String mem_post) {
		this.mem_post = mem_post;
	}


	public String getMem_address1() {
		return mem_address1;
	}


	public void setMem_address1(String mem_address1) {
		this.mem_address1 = mem_address1;
	}


	public String getMem_address2() {
		return mem_address2;
	}


	public void setMem_address2(String mem_address2) {
		this.mem_address2 = mem_address2;
	}


	public Date getMem_regdate() {
		return mem_regdate;
	}


	public void setMem_regdate(Date mem_regdate) {
		this.mem_regdate = mem_regdate;
	}


	public String getMem_status() {
		return mem_status;
	}


	public void setMem_status(String mem_status) {
		this.mem_status = mem_status;
	}


	@Override
	public String toString() {
		return "MemberBean [mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_name=" + mem_name + ", mem_email="
				+ mem_email + ", mem_phone=" + mem_phone + ", mem_post=" + mem_post + ", mem_address1=" + mem_address1
				+ ", mem_address2=" + mem_address2 + ", mem_regdate=" + mem_regdate + ", mem_grade=" + mem_status + "]";
	}


	public MemberBean(String mem_id, String mem_pw, String mem_name, String mem_email, String mem_phone,
			String mem_post, String mem_address1, String mem_address2, Date mem_regdate, String mem_status) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_email = mem_email;
		this.mem_phone = mem_phone;
		this.mem_post = mem_post;
		this.mem_address1 = mem_address1;
		this.mem_address2 = mem_address2;
		this.mem_regdate = mem_regdate;
		this.mem_status = mem_status;
	}
	
}
