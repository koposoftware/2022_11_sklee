package kr.ac.kopo.business.vo;

public class TrialBalanceVO {

	private String accountingCode;
	private String accountingDetail;
	private int debitAmount;
	private int debitSum;
	private int creditAmount;
	private int creditSum;

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

	public int getDebitAmount() {
		return debitAmount;
	}

	public void setDebitAmount(int debitAmount) {
		this.debitAmount = debitAmount;
	}

	public int getDebitSum() {
		return debitSum;
	}

	public void setDebitSum(int debitSum) {
		this.debitSum = debitSum;
	}

	public int getCreditAmount() {
		return creditAmount;
	}

	public void setCreditAmount(int creditAmount) {
		this.creditAmount = creditAmount;
	}

	public int getCreditSum() {
		return creditSum;
	}

	public void setCreditSum(int creditSum) {
		this.creditSum = creditSum;
	}

	@Override
	public String toString() {
		return "TrialBalanceVO [accountingCode=" + accountingCode + ", accountingDetail=" + accountingDetail
				+ ", debitAmount=" + debitAmount + ", debitSum=" + debitSum + ", creditAmount=" + creditAmount
				+ ", creditSum=" + creditSum + "]";
	}

}
