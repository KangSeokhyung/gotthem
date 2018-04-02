package kr.co.gotthem.order.bean;

import java.sql.Date;
import java.sql.Timestamp;

public class OrderpayBean {
  private int ord_no; 
  private int ord_procode;
  private String ord_proname;
  private int ord_memno;
  private int ord_stock;
  private int ord_price;
  private Timestamp ord_findtime;
  private String ord_status;
  private int ord_basno;
  private String ord_proimg;
  private int ord_proprice;
  private String sto_name;
  private int pro_memno;
  private String mem_phone;
  
  public OrderpayBean() {	
  }

public int getOrd_no() {
	return ord_no;
}

public void setOrd_no(int ord_no) {
	this.ord_no = ord_no;
}

public int getOrd_procode() {
	return ord_procode;
}

public void setOrd_procode(int ord_procode) {
	this.ord_procode = ord_procode;
}

public String getOrd_proname() {
	return ord_proname;
}

public void setOrd_proname(String ord_proname) {
	this.ord_proname = ord_proname;
}

public int getOrd_memno() {
	return ord_memno;
}

public void setOrd_memno(int ord_memno) {
	this.ord_memno = ord_memno;
}

public int getOrd_stock() {
	return ord_stock;
}

public void setOrd_stock(int ord_stock) {
	this.ord_stock = ord_stock;
}

public int getOrd_price() {
	return ord_price;
}

public void setOrd_price(int ord_price) {
	this.ord_price = ord_price;
}

public Timestamp getOrd_findtime() {
	return ord_findtime;
}

public void setOrd_findtime(Timestamp ord_findtime) {
	this.ord_findtime = ord_findtime;
}

public String getOrd_status() {
	return ord_status;
}

public void setOrd_status(String ord_status) {
	this.ord_status = ord_status;
}

public int getOrd_basno() {
	return ord_basno;
}

public void setOrd_basno(int ord_basno) {
	this.ord_basno = ord_basno;
}

public String getOrd_proimg() {
	return ord_proimg;
}

public void setOrd_proimg(String ord_proimg) {
	this.ord_proimg = ord_proimg;
}

public int getOrd_proprice() {
	return ord_proprice;
}

public void setOrd_proprice(int ord_proprice) {
	this.ord_proprice = ord_proprice;
}

public String getSto_name() {
	return sto_name;
}

public void setSto_name(String sto_name) {
	this.sto_name = sto_name;
}

public int getPro_memno() {
	return pro_memno;
}

public void setPro_memno(int pro_memno) {
	this.pro_memno = pro_memno;
}

public String getMem_phone() {
	return mem_phone;
}

public void setMem_phone(String mem_phone) {
	this.mem_phone = mem_phone;
}

@Override
public String toString() {
	return "OrderpayBean [ord_no=" + ord_no + ", ord_procode=" + ord_procode + ", ord_proname=" + ord_proname
			+ ", ord_memno=" + ord_memno + ", ord_stock=" + ord_stock + ", ord_price=" + ord_price + ", ord_findtime="
			+ ord_findtime + ", ord_status=" + ord_status + ", ord_basno=" + ord_basno + ", ord_proimg=" + ord_proimg
			+ ", ord_proprice=" + ord_proprice + ", sto_name=" + sto_name + ", pro_memno=" + pro_memno + ", mem_phone="
			+ mem_phone + "]";
}
  
}