package com.springProject.subProject.vo;

public class PayInfoVO {
	private String pd_name;
	private String amount;
	private String mem_email;
	private String mem_name;
	private String mem_phoneNum;
	private String order_address;
	private String order_postcode;
	
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_phoneNum() {
		return mem_phoneNum;
	}
	public void setMem_phoneNum(String mem_phoneNum) {
		this.mem_phoneNum = mem_phoneNum;
	}
	public String getOrder_address() {
		return order_address;
	}
	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}
	public String getOrder_postcode() {
		return order_postcode;
	}
	public void setOrder_postcode(String order_postcode) {
		this.order_postcode = order_postcode;
	}
	
	@Override
	public String toString() {
		return "payInfoDTO [pd_name=" + pd_name + ", amount=" + amount + ", mem_email=" + mem_email + ", mem_name="
				+ mem_name + ", mem_phoneNum=" + mem_phoneNum + ", order_address=" + order_address + ", order_postcode="
				+ order_postcode + "]";
	}
	
}
