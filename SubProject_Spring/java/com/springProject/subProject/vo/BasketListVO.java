package com.springProject.subProject.vo;

import java.util.List;

/**
 * @author rudbe
 *
 * CREATE VIEW BASKET_LIST AS
SELECT pd_name,pd_price,bk_qty,(pd_price*bk_qty) totalprice,bk_order_num,bk_mem_id,
bk_pd_code
FROM basket, product
WHERE bk_pd_code = pd_code;

 */
public class BasketListVO {
	private String pd_name;
	private String pd_price;
	private String bk_qty;
	private String totalprice;
	private String bk_order_num;
	private String bk_mem_id;
	private String bk_pd_code;
	
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}
	public String getPd_price() {
		return pd_price;
	}
	public void setPd_price(String pd_price) {
		this.pd_price = pd_price;
	}
	public String getBk_qty() {
		return bk_qty;
	}
	public void setBk_qty(String bk_qty) {
		this.bk_qty = bk_qty;
	}
	public String getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(String totalprice) {
		this.totalprice = totalprice;
	}
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
	
	@Override
	public String toString() {
		return "BasketListVO [pd_name=" + pd_name + ", pd_price=" + pd_price + ", bk_qty=" + bk_qty + ", totalprice="
				+ totalprice + ", bk_order_num=" + bk_order_num + ", bk_mem_id=" + bk_mem_id + ", bk_pd_code="
				+ bk_pd_code + "]";
	}
	
	
}
