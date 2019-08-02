package net.member.db;

import java.util.Date;

public class MemberBillBean {
	String MEMBER_ID;
	int MEMBER_BILL	;
	Date BILL_DATE;
	
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public int getMEMBER_BILL() {
		return MEMBER_BILL;
	}
	public void setMEMBER_BILL(int mEMBER_BILL) {
		MEMBER_BILL = mEMBER_BILL;
	}
	public Date getBILL_DATE() {
		return BILL_DATE;
	}
	public void setBILL_DATE(Date bILL_DATE) {
		BILL_DATE = bILL_DATE;
	}
	
	
}
