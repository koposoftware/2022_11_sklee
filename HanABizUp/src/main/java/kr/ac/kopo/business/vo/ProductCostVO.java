package kr.ac.kopo.business.vo;

import java.util.List;

public class ProductCostVO {

	private String compName;
	private String LedgerDate;
	private String productName;
	private int quantity;
	private String paymentCode;
	private String detail;
	private List<ProductCostVO> productCostList;

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public String getLedgerDate() {
		return LedgerDate;
	}

	public void setLedgerDate(String ledgerDate) {
		LedgerDate = ledgerDate;
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

	public List<ProductCostVO> getProductCostList() {
		return productCostList;
	}

	public void setProductCostList(List<ProductCostVO> productCostList) {
		this.productCostList = productCostList;
	}

	@Override
	public String toString() {
		return "ProductCostVO [compName=" + compName + ", LedgerDate=" + LedgerDate + ", productName=" + productName
				+ ", quantity=" + quantity + ", paymentCode=" + paymentCode + ", detail=" + detail + "]";
	}

}
