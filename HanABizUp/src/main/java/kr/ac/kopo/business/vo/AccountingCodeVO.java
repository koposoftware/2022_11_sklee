package kr.ac.kopo.business.vo;

public class AccountingCodeVO {

	private String accountingCode;
	private String accountingDetail;

	public String getAccountingCode() {
		return accountingCode;
	}

	public void setAccountingCode(String accountingCode) {
		this.accountingCode = accountingCode;
	}

	public String getAccountingDetail() {
		return accountingDetail;
	}

	public void setAccountingDetail(String accountingDetail) {
		this.accountingDetail = accountingDetail;
	}

	@Override
	public String toString() {
		return "AccountingCodeVO [accountingCode=" + accountingCode + ", accountingDetail=" + accountingDetail + "]";
	}

}
