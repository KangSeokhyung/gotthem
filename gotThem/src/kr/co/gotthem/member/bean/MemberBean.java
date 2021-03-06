package kr.co.gotthem.member.bean;

import java.sql.Date;

public class MemberBean {
	private int mem_no;
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String sto_name;
	private String mem_email;
	private String mem_phone;
	private String mem_address;
	private String mem_img;
	private Date mem_regdate;
	private String sto_img;
	private String sto_comment;
	private String mem_status;
	private int enabled;
	
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
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
	public String getSto_name() {
		return sto_name;
	}
	public void setSto_name(String sto_name) {
		this.sto_name = sto_name;
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
	public String getMem_address() {
		return mem_address;
	}
	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}
	public String getMem_img() {
		return mem_img;
	}
	public void setMem_img(String mem_img) {
		this.mem_img = mem_img;
	}
	public Date getMem_regdate() {
		return mem_regdate;
	}
	public void setMem_regdate(Date mem_regdate) {
		this.mem_regdate = mem_regdate;
	}
	public String getSto_img() {
		return sto_img;
	}
	public void setSto_img(String sto_img) {
		this.sto_img = sto_img;
	}
	public String getSto_comment() {
		return sto_comment;
	}
	public void setSto_comment(String sto_comment) {
		this.sto_comment = sto_comment;
	}
	public String getMem_status() {
		return mem_status;
	}
	public void setMem_status(String mem_status) {
		this.mem_status = mem_status;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	
	public MemberBean() {
		super();
	}
	
	@Override
	public String toString() {
		return "MemberBean [mem_no=" + mem_no + ", mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_name=" + mem_name
				+ ", sto_name=" + sto_name + ", mem_email=" + mem_email + ", mem_phone=" + mem_phone + ", mem_address="
				+ mem_address + ", mem_img=" + mem_img + ", mem_regdate=" + mem_regdate + ", sto_img=" + sto_img
				+ ", sto_comment=" + sto_comment + ", mem_status=" + mem_status + ", enabled=" + enabled + "]";
	}
	
	
	
}
