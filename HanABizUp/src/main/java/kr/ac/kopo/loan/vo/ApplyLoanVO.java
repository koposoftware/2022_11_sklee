package kr.ac.kopo.loan.vo;

public class ApplyLoanVO {

	private int loanNo;
	private String compName;
	private String managerName;
	private String managerPhone;
	private String managerEmail;
	private String loanCode;
	private int loanAmount;
	private String accountNo;
	private String loanTerm;
	private int interestPaydate;
	private String loanPayType;
	private String loanAccount;
	private float interestRate;
	private String loanStartDate;
	private String loanEndDate;
	private String loanStatus;
	private String bankerEmpNo;
	private String applyDate;
	private String updateDate;

	public int getLoanNo() {
		return loanNo;
	}

	public void setLoanNo(int loanNo) {
		this.loanNo = loanNo;
	}

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	public String getManagerPhone() {
		return managerPhone;
	}

	public void setManagerPhone(String managerPhone) {
		this.managerPhone = managerPhone;
	}

	public String getManagerEmail() {
		return managerEmail;
	}

	public void setManagerEmail(String managerEmail) {
		this.managerEmail = managerEmail;
	}

	public String getLoanCode() {
		return loanCode;
	}

	public void setLoanCode(String loanCode) {
		this.loanCode = loanCode;
	}

	public int getLoanAmount() {
		return loanAmount;
	}

	public void setLoanAmount(int loanAmount) {
		this.loanAmount = loanAmount;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getLoanTerm() {
		return loanTerm;
	}

	public void setLoanTerm(String loanTerm) {
		this.loanTerm = loanTerm;
	}

	public int getInterestPaydate() {
		return interestPaydate;
	}

	public void setInterestPaydate(int interestPaydate) {
		this.interestPaydate = interestPaydate;
	}

	public String getLoanPayType() {
		return loanPayType;
	}

	public void setLoanPayType(String loanPayType) {
		this.loanPayType = loanPayType;
	}

	public String getLoanAccount() {
		return loanAccount;
	}

	public void setLoanAccount(String loanAccount) {
		this.loanAccount = loanAccount;
	}

	public float getInterestRate() {
		return interestRate;
	}

	public void setInterestRate(float interestRate) {
		this.interestRate = interestRate;
	}

	public String getLoanStartDate() {
		return loanStartDate;
	}

	public void setLoanStartDate(String loanStartDate) {
		this.loanStartDate = loanStartDate;
	}

	public String getLoanEndDate() {
		return loanEndDate;
	}

	public void setLoanEndDate(String loanEndDate) {
		this.loanEndDate = loanEndDate;
	}

	public String getLoanStatus() {
		return loanStatus;
	}

	public void setLoanStatus(String loanStatus) {
		this.loanStatus = loanStatus;
	}

	public String getBankerEmpNo() {
		return bankerEmpNo;
	}

	public void setBankerEmpNo(String bankerEmpNo) {
		this.bankerEmpNo = bankerEmpNo;
	}

	public String getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	@Override
	public String toString() {
		return "ApplyLoanVO [loanNo=" + loanNo + ", compName=" + compName + ", managerName=" + managerName
				+ ", managerPhone=" + managerPhone + ", managerEmail=" + managerEmail + ", loanCode=" + loanCode
				+ ", loanAmount=" + loanAmount + ", accountNo=" + accountNo + ", loanTerm=" + loanTerm
				+ ", interestPaydate=" + interestPaydate + ", loanPayType=" + loanPayType + ", loanAccount="
				+ loanAccount + ", interestRate=" + interestRate + ", loanStartDate=" + loanStartDate + ", loanEndDate="
				+ loanEndDate + ", loanStatus=" + loanStatus + ", bankerEmpNo=" + bankerEmpNo + ", applyDate="
				+ applyDate + ", updateDate=" + updateDate + "]";
	}

}
