package kr.ac.kopo.business.vo;

import java.util.List;

public class RevenueVO {
	
	private String compName;
	private int totalAmount;
	private String detail;
	private String paymentCode;
	private String ledgerDate;
	private String productName;
	private int quantity;
	private List<RevenueVO> revenueList;

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

	public String getPaymentCode() {
		return paymentCode;
	}

	public void setPaymentCode(String paymentCode) {
		this.paymentCode = paymentCode;
	}

	public String getLedgerDate() {
		return ledgerDate;
	}

	public void setLedgerDate(String ledgerDate) {
		this.ledgerDate = ledgerDate;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public List<RevenueVO> getRevenueList() {
		return revenueList;
	}

	public void setRevenueList(List<RevenueVO> revenueList) {
		this.revenueList = revenueList;
	}

	@Override
	public String toString() {
		return "RevenueVO [compName=" + compName + ", totalAmount=" + totalAmount + ", detail=" + detail
				+ ", paymentCode=" + paymentCode + ", ledgerDate=" + ledgerDate + ", productName=" + productName
				+ ", quantity=" + quantity + "]";
	}

	
	
	
	
}
