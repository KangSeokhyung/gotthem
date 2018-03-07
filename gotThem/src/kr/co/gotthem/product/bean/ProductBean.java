package kr.co.gotthem.product.bean;

import java.sql.Date;

public class ProductBean {
	
	private int pro_code;
	private String pro_name;
	private int pro_memno;
	private String pro_category;
	private String pro_img;
	private String pro_comment;
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
	public int getPro_memno() {
		return pro_memno;
	}
	public void setPro_memno(int pro_memno) {
		this.pro_memno = pro_memno;
	}
	public String getPro_category() {
		return pro_category;
	}
	public void setPro_category(String pro_category) {
		this.pro_category = pro_category;
	}
	public String getPro_img() {
		return pro_img;
	}
	public void setPro_img(String pro_img) {
		this.pro_img = pro_img;
	}
	public String getPro_comment() {
		return pro_comment;
	}
	public void setPro_comment(String pro_comment) {
		this.pro_comment = pro_comment;
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
		return "ProductBean [pro_code=" + pro_code + ", pro_name=" + pro_name + ", pro_memno=" + pro_memno
				+ ", pro_category=" + pro_category + ", pro_img=" + pro_img + ", pro_comment=" + pro_comment
				+ ", pro_stock=" + pro_stock + ", pro_price=" + pro_price + "]";
	}

}
