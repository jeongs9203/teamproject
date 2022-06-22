package com.springProject.subProject.vo;



	
/*
	CREATE TABLE PRODUCT(
		pd_code VARCHAR(50),
		pd_name VARCHAR(50),
		pd_img VARCHAR(200),
		pd_price VARCHAR(1000),
		pd_stock VARCHAR(1000),
		pd_detail VARCHAR(1000),
		pd_rdate VARCHAR(20),
		pd_state VARCHAR(30),
		pd_sales VARCHAR(1000),
		pd_re_avg VARCHAR(1000)
	);
*/
	

public class ProductVO {	
	
	
	private String pd_code;
	private String pd_name;
	private String pd_img;
	private String pd_price;
	private String pd_stock;
	private String pd_detail;
	private String pd_rdate;
	private String pd_state;
	private String pd_sales;
	private String pd_re_avg;
	
	
	
	
	public String getPd_code() {
		return pd_code;
	}
	public void setPd_code(String pd_code) {
		this.pd_code = pd_code;
	}
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}
	public String getPd_img() {
		return pd_img;
	}
	public void setPd_img(String pd_img) {
		this.pd_img = pd_img;
	}
	public String getPd_price() {
		return pd_price;
	}
	public void setPd_price(String pd_price) {
		this.pd_price = pd_price;
	}
	public String getPd_stock() {
		return pd_stock;
	}
	public void setPd_stock(String pd_stock) {
		this.pd_stock = pd_stock;
	}
	public String getPd_detail() {
		return pd_detail;
	}
	public void setPd_detail(String pd_detail) {
		this.pd_detail = pd_detail;
	}
	public String getPd_rdate() {
		return pd_rdate;
	}
	public void setPd_rdate(String pd_rdate) {
		this.pd_rdate = pd_rdate;
	}
	public String getPd_state() {
		return pd_state;
	}
	public void setPd_state(String pd_state) {
		this.pd_state = pd_state;
	}
	public String getPd_sales() {
		return pd_sales;
	}
	public void setPd_sales(String pd_sales) {
		this.pd_sales = pd_sales;
	}
	public String getPd_re_avg() {
		return pd_re_avg;
	}
	public void setPd_re_avg(String pd_re_avg) {
		this.pd_re_avg = pd_re_avg;
	}
	
	
	@Override
	public String toString() {
		return "ProductDTO [pd_code=" + pd_code + ", pd_name=" + pd_name + ", pd_img=" + pd_img + ", pd_price="
				+ pd_price + ", pd_stock=" + pd_stock + ", pd_detail=" + pd_detail + ", pd_rdate=" + pd_rdate
				+ ", pd_state=" + pd_state + ", pd_sales=" + pd_sales + ", pd_re_avg=" + pd_re_avg + "]";
	}
	
	
	
	
	
}
