package com.springProject.subProject.vo;

/*
 * CREATE TABLE ORDER_PAD(
order_num VARCHAR(100),
order_mem_id VARCHAR(20),
order_pd_code VARCHAR(50),
order_status VARCHAR(1),
order_qty VARCHAR(20),
order_postcode VARCHAR(6),
order_address VARCHAR(300),
order_phonenum VARCHAR(20),
PRIMARY KEY(order_num,order_mem_id,order_pd_code)
);

CREATE TABLE ORDER_DETAIL(
od_order_num VARCHAR(1000),
od_mem_id VARCHAR(20),
od_pd_code VARCHAR(50),
od_qty VARCHAR(1000)
);

 */
public class Order_padVO {
	private String order_num;
	private String order_mem_id;
	private String order_pd_code;
	private String order_qty;
	private String order_status;
	private String order_postcode;
	private String order_address;
	private String order_phoneNum;
	
	
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public String getOrder_mem_id() {
		return order_mem_id;
	}
	public void setOrder_mem_id(String order_mem_id) {
		this.order_mem_id = order_mem_id;
	}
	public String getOrder_pd_code() {
		return order_pd_code;
	}
	public void setOrder_pd_code(String order_pd_code) {
		this.order_pd_code = order_pd_code;
	}
	public String getOrder_qty() {
		return order_qty;
	}
	public void setOrder_qty(String order_qty) {
		this.order_qty = order_qty;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public String getOrder_postcode() {
		return order_postcode;
	}
	public void setOrder_postcode(String order_postcode) {
		this.order_postcode = order_postcode;
	}
	public String getOrder_address() {
		return order_address;
	}
	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}
	public String getOrder_phoneNum() {
		return order_phoneNum;
	}
	public void setOrder_phoneNum(String order_phoneNum) {
		this.order_phoneNum = order_phoneNum;
	}
	
	@Override
	public String toString() {
		return "Order_padDTO [order_num=" + order_num + ", order_mem_id=" + order_mem_id + ", order_pd_code="
				+ order_pd_code + ", order_qty=" + order_qty + ", order_status=" + order_status + ", order_postcode="
				+ order_postcode + ", order_address=" + order_address + ", order_phoneNum=" + order_phoneNum + "]";
	}

	
	
	
	
}
