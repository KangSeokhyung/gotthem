package kr.co.gotthem.store.bean;

import java.sql.Date;

public class StoreBean {
	private int sto_no;
	private String sto_id;
	private String sto_pw;
	private String sto_owner;
	private String sto_name;
	private String sto_address;
	private String sto_registno;
	private String sto_img;
	private String sto_phone;
	private String sto_email;
	private Date sto_regdate;
	private String sto_comment;
	private String sto_status;
	
	public StoreBean() {
	}
	
	public int getSto_no() {
		return sto_no;
	}
	public void setSto_no(int sto_no) {
		this.sto_no = sto_no;
	}
	public String getSto_id() {
		return sto_id;
	}
	public void setSto_id(String sto_id) {
		this.sto_id = sto_id;
	}
	public String getSto_pw() {
		return sto_pw;
	}
	public void setSto_pw(String sto_pw) {
		this.sto_pw = sto_pw;
	}
	public String getSto_owner() {
		return sto_owner;
	}
	public void setSto_owner(String sto_owner) {
		this.sto_owner = sto_owner;
	}
	public String getSto_name() {
		return sto_name;
	}
	public void setSto_name(String sto_name) {
		this.sto_name = sto_name;
	}
	public String getSto_address() {
		return sto_address;
	}
	public void setSto_address(String sto_address) {
		this.sto_address = sto_address;
	}
	public String getSto_registno() {
		return sto_registno;
	}
	public void setSto_registno(String sto_registno) {
		this.sto_registno = sto_registno;
	}
	public String getSto_img() {
		return sto_img;
	}
	public void setSto_img(String sto_img) {
		this.sto_img = sto_img;
	}
	public String getSto_phone() {
		return sto_phone;
	}
	public void setSto_phone(String sto_phone) {
		this.sto_phone = sto_phone;
	}
	public String getSto_email() {
		return sto_email;
	}
	public void setSto_email(String sto_email) {
		this.sto_email = sto_email;
	}
	public Date getSto_regdate() {
		return sto_regdate;
	}
	public void setSto_regdate(Date sto_regdate) {
		this.sto_regdate = sto_regdate;
	}
	public String getSto_comment() {
		return sto_comment;
	}
	public void setSto_comment(String sto_comment) {
		this.sto_comment = sto_comment;
	}
	public String getSto_status() {
		return sto_status;
	}
	public void setSto_status(String sto_status) {
		this.sto_status = sto_status;
	}
	
	@Override
	public String toString() {
		return "StoreBean [sto_no=" + sto_no + ", sto_id=" + sto_id + ", sto_pw=" + sto_pw + ", sto_owner=" + sto_owner
				+ ", sto_name=" + sto_name + ", sto_address=" + sto_address + ", sto_registno=" + sto_registno
				+ ", sto_img=" + sto_img + ", sto_phone=" + sto_phone + ", sto_email=" + sto_email + ", sto_regdate="
				+ sto_regdate + ", sto_comment=" + sto_comment + ", sto_status=" + sto_status + "]";
	}
	
}
