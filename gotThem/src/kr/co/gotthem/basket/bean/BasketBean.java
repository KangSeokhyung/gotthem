package kr.co.gotthem.basket.bean;

import java.sql.Date;
//
public class BasketBean {
  private int bas_no;
  private int bas_memno;
  private int bas_procode;
  private String bas_proname;
  private int bas_stono;
  private int bas_prostock;
  private int bas_proprice;
  private String bas_procategory;
  private Date bas_proexdate;
  private int money;
public int getBas_no() {
	return bas_no;
}
public void setBas_no(int bas_no) {
	this.bas_no = bas_no;
}
public int getBas_memno() {
	return bas_memno;
}
public void setBas_memno(int bas_memno) {
	this.bas_memno = bas_memno;
}
public int getBas_procode() {
	return bas_procode;
}
public void setBas_procode(int bas_procode) {
	this.bas_procode = bas_procode;
}
public String getBas_proname() {
	return bas_proname;
}
public void setBas_proname(String bas_proname) {
	this.bas_proname = bas_proname;
}
public int getBas_stono() {
	return bas_stono;
}
public void setBas_stono(int bas_stono) {
	this.bas_stono = bas_stono;
}
public int getBas_prostock() {
	return bas_prostock;
}
public void setBas_prostock(int bas_prostock) {
	this.bas_prostock = bas_prostock;
}
public int getBas_proprice() {
	return bas_proprice;
}
public void setBas_proprice(int bas_proprice) {
	this.bas_proprice = bas_proprice;
}
public String getBas_procategory() {
	return bas_procategory;
}
public void setBas_procategory(String bas_procategory) {
	this.bas_procategory = bas_procategory;
}
public Date getBas_proexdate() {
	return bas_proexdate;
}
public void setBas_proexdate(Date bas_proexdate) {
	this.bas_proexdate = bas_proexdate;
}
public int getMoney() {
	return money;
}
public void setMoney(int money) {
	this.money = money;
}
@Override
public String toString() {
	return "BasketBean [bas_no=" + bas_no + ", bas_memno=" + bas_memno + ", bas_procode=" + bas_procode
			+ ", bas_proname=" + bas_proname + ", bas_stono=" + bas_stono + ", bas_prostock=" + bas_prostock
			+ ", bas_proprice=" + bas_proprice + ", bas_procategory=" + bas_procategory + ", bas_proexdate="
			+ bas_proexdate + ", money=" + money + "]";
}

}