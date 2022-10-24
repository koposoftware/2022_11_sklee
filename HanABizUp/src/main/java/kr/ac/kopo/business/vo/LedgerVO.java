package kr.ac.kopo.business.vo;

import java.util.List;

public class LedgerVO {

	private int ledgerNo;
	private int ledgerSubNo;
	private String compName;
	private int totalAmount;
	private String detail;
	private String debit;
	private String credit;
	private String ledgerDate;
	private List<LedgerVO> LedgerList;

	public int getLedgerNo() {
		return ledgerNo;
	}

	public void setLedgerNo(int ledgerNo) {
		this.ledgerNo = ledgerNo;
	}

	public int getLedgerSubNo() {
		return ledgerSubNo;
	}

	public void setLedgerSubNo(int ledgerSubNo) {
		this.ledgerSubNo = ledgerSubNo;
	}

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public int getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getDebit() {
		return debit;
	}

	public void setDebit(String debit) {
		this.debit = debit;
	}

	public String getCredit() {
		return credit;
	}

	public void setCredit(String credit) {
		this.credit = credit;
	}

	public String getLedgerDate() {
		return ledgerDate;
	}

	public void setLedgerDate(String ledgerDate) {
		this.ledgerDate = ledgerDate;
	}

	public List<LedgerVO> getLedgerList() {
		return LedgerList;
	}

	public void setLedgerList(List<LedgerVO> ledgerList) {
		LedgerList = ledgerList;
	}

	@Override
	public String toString() {
		return "LedgerVO [ledgerNo=" + ledgerNo + ", ledgerSubNo=" + ledgerSubNo + ", compName=" + compName
				+ ", totalAmount=" + totalAmount + ", detail=" + detail + ", debit=" + debit + ", credit=" + credit
				+ ", ledgerDate=" + ledgerDate + "]";
	}

}
