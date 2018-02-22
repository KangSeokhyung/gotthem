package kr.co.gotthem.product.bean;

public class ProductBean {
	private int pro_code;
	private String pro_name;
	private int pro_stono;
	private String pro_category;
	private int pro_income;
	private int pro_release;
	private int pro_stock;
	private int pro_price;
	public int getPro_code() {
		return pro_code;
	}
	public void setPro_code(int pro_code) {
		this.pro_code = pro_code;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public int getPro_stono() {
		return pro_stono;
	}
	public void setPro_stono(int pro_stono) {
		this.pro_stono = pro_stono;
	}
	public String getPro_category() {
		return pro_category;
	}
	public void setPro_category(String pro_category) {
		this.pro_category = pro_category;
	}
	public int getPro_income() {
		return pro_income;
	}
	public void setPro_income(int pro_income) {
		this.pro_income = pro_income;
	}
	public int getPro_release() {
		return pro_release;
	}
	public void setPro_release(int pro_release) {
		this.pro_release = pro_release;
	}
	public int getPro_stock() {
		return pro_stock;
	}
	public void setPro_stock(int pro_stock) {
		this.pro_stock = pro_stock;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	@Override
	public String toString() {
		return "ProductBean [pro_code=" + pro_code + ", pro_name=" + pro_name + ", pro_stono=" + pro_stono
				+ ", pro_category=" + pro_category + ", pro_income=" + pro_income + ", pro_release=" + pro_release
				+ ", pro_stock=" + pro_stock + ", pro_price=" + pro_price + "]";
	}
	
	
}
