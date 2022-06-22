package com.springProject.subProject.vo;
/*
	CREATE TABLE cart(
		bk_order_num VARCHAR(100),
		bk_mem_id VARCHAR(20),
		bk_pd_code VARCHAR(50),
		bk_qty int(100),
		bk_price int(100)
	);
 */
public class CartVO {
	private String bk_order_num;
	private String bk_mem_id;
	private String bk_pd_code;
	private String  bk_qty;
	
	public String getBk_order_num() {
		return bk_order_num;
	}
	public void setBk_order_num(String bk_order_num) {
		this.bk_order_num = bk_order_num;
	}
	public String getBk_mem_id() {
		return bk_mem_id;
	}
	public void setBk_mem_id(String bk_mem_id) {
		this.bk_mem_id = bk_mem_id;
	}
	public String getBk_pd_code() {
		return bk_pd_code;
	}
	public void setBk_pd_code(String bk_pd_code) {
		this.bk_pd_code = bk_pd_code;
	}
	public String getBk_qty() {
		return bk_qty;
	}
	public void setBk_qty(String bk_qty) {
		this.bk_qty = bk_qty;
	}
	@Override
	public String toString() {
		return "CartDTO [bk_order_num=" + bk_order_num + ", bk_mem_id=" + bk_mem_id + ", bk_pd_code=" + bk_pd_code
				+ ", bk_qty=" + bk_qty + "]";
	}
}
