﻿package net.basket.db;

import java.util.Date;

public class BasketBean {
	private int BASKET_NUM;
	private String BASKET_MEMBER_ID;
	private int BASKET_GOODS_NUM;
	private int BASKET_GOODS_AMOUNT;
	private Date BASKET_DATE;
	
	public int getBASKET_NUM() {
		return BASKET_NUM;
	}
	public void setBASKET_NUM(int basket_num) {
		BASKET_NUM = basket_num;
	}
	public String getBASKET_MEMBER_ID() {
		return BASKET_MEMBER_ID;
	}
	public void setBASKET_MEMBER_ID(String basket_member_id) {
		BASKET_MEMBER_ID = basket_member_id;
	}
	public int getBASKET_GOODS_NUM() {
		return BASKET_GOODS_NUM;
	}
	public void setBASKET_GOODS_NUM(int basket_goods_num) {
		BASKET_GOODS_NUM = basket_goods_num;
	}
	public int getBASKET_GOODS_AMOUNT() {
		return BASKET_GOODS_AMOUNT;
	}
	public void setBASKET_GOODS_AMOUNT(int basket_goods_amount) {
		BASKET_GOODS_AMOUNT = basket_goods_amount;
	}
	public Date getBASKET_DATE() {
		return BASKET_DATE;
	}
	public void setBASKET_DATE(Date basket_date) {
		BASKET_DATE = basket_date;
	}
}
