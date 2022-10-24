package kr.ac.kopo.business.vo;

import java.util.List;

public class SellingExpensesVO {

	private String ledgerDate;
	private String debitCode;
	private String compName;
	private int totalAmount;
	private String paymentCode;
	private String detail;
	private List<SellingExpensesVO> SellingExpensesList;

	public String getLedgerDate() {
		return ledgerDate;
	}

	public void setLedgerDate(String ledgerDate) {
		this.ledgerDate = ledgerDate;
	}

	public String getDebitCode() {
		return debitCode;
	}

	public void setDebitCode(String debitCode) {
		this.debitCode = debitCode;
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

	public String getPaymentCode() {
		return paymentCode;
	}

	public void setPaymentCode(String paymentCode) {
		this.paymentCode = paymentCode;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public List<SellingExpensesVO> getSellingExpensesList() {
		return SellingExpensesList;
	}

	public void setSellingExpensesList(List<SellingExpensesVO> sellingExpensesList) {
		SellingExpensesList = sellingExpensesList;
	}

	@Override
	public String toString() {
		return "SellingExpensesVO [ledgerDate=" + ledgerDate + ", debitCode=" + debitCode + ", compName=" + compName
				+ ", totalAmount=" + totalAmount + ", paymentCode=" + paymentCode + ", detail=" + detail + "]";
	}

}
