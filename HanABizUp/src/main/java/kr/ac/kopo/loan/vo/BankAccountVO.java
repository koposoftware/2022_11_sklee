package kr.ac.kopo.loan.vo;

public class BankAccountVO {

	private String accountNo;
	private String compName;
	private String bankCode;
	private String accountAlias;
	private int accountPw;
	private int balance;
	private String accountRegDate;
	private String accountType;

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public String getBankCode() {
		return bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}

	public String getAccountAlias() {
		return accountAlias;
	}

	public void setAccountAlias(String accountAlias) {
		this.accountAlias = accountAlias;
	}

	public int getAccountPw() {
		return accountPw;
	}

	public void setAccountPw(int accountPw) {
		this.accountPw = accountPw;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	public String getAccountRegDate() {
		return accountRegDate;
	}

	public void setAccountRegDate(String accountRegDate) {
		this.accountRegDate = accountRegDate;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	@Override
	public String toString() {
		return "BankAccountVO [accountNo=" + accountNo + ", compName=" + compName + ", bankCode=" + bankCode
				+ ", accountAlias=" + accountAlias + ", accountPw=" + accountPw + ", balance=" + balance
				+ ", accountRegDate=" + accountRegDate + ", accountType=" + accountType + "]";
	}

}
