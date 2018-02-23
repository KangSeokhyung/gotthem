package kr.co.gotthem.order.bean;

import java.sql.Date;

public class OrderpayBean {
  private int ord_no; 
  private int ord_procode;
  private String ord_proname;
  private int ord_memno;
  private int ord_stock;
  private int ord_price;
  private Date ord_findtime;
  private String ord_status;
  private int money;
  
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
public Date getOrd_findtime() {
	return ord_findtime;
}
public void setOrd_findtime(Date ord_findtime) {
	this.ord_findtime = ord_findtime;
}
public String getOrd_status() {
	return ord_status;
}
public void setOrd_status(String ord_status) {
	this.ord_status = ord_status;
}
public int getMoney() {
	return money;
}
public void setMoney(int money) {
	this.money = money;
}
@Override
public String toString() {
	return "OrderBean [ord_no=" + ord_no + ", ord_procode=" + ord_procode + ", ord_proname=" + ord_proname
			+ ", ord_memno=" + ord_memno + ", ord_stock=" + ord_stock + ", ord_price=" + ord_price + ", ord_findtime="
			+ ord_findtime + ", ord_status=" + ord_status + ", money=" + money + "]";
}

}

  