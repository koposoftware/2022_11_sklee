package kr.ac.kopo.business.vo;

public class AccountingPeriodVO {

	String compName;
	String accountingPeriod;
	String startDate;
	String endDate;

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public String getAccountingPeriod() {
		return accountingPeriod;
	}

	public void setAccountingPeriod(String accountingPeriod) {
		this.accountingPeriod = accountingPeriod;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "AccountingPeriodVO [compName=" + compName + ", accountingPeriod=" + accountingPeriod + ", startDate="
				+ startDate + ", endDate=" + endDate + "]";
	}

	
}
