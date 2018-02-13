package kr.co.gotthem.member.bean;

public class MemberBean {

	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_email;
	private String mem_phone;
	private String mem_address;
	private String mem_regdate;
	
	
	public MemberBean() {
		super();
	}
	
	public MemberBean(String mem_id, String mem_pw, String mem_name, String mem_email, String mem_phone,
			String mem_address, String mem_regdate) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_email = mem_email;
		this.mem_phone = mem_phone;
		this.mem_address = mem_address;
		this.mem_regdate = mem_regdate;
	}
	
	@Override
	public String toString() {
		return "MemberBean [mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_name=" + mem_name + ", mem_email="
				+ mem_email + ", mem_phone=" + mem_phone + ", mem_address=" + mem_address + ", mem_regdate="
				+ mem_regdate + "]";
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
	public String getMem_address() {
		return mem_address;
	}
	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}
	public String getMem_regdate() {
		return mem_regdate;
	}
	public void setMem_regdate(String mem_regdate) {
		this.mem_regdate = mem_regdate;
	}


}
