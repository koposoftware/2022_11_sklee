package kr.ac.kopo.loan.vo;

public class LoanProductVO {

	private String loanProductCode;
	private String detail;
	private String summary;
	private String qualification;
	private float interestHigh;
	private float interestLow;
	private int loanTermA;
	private int loanTermB;

	public String getLoanProductCode() {
		return loanProductCode;
	}

	public void setLoanProductCode(String loanProductCode) {
		this.loanProductCode = loanProductCode;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public float getInterestHigh() {
		return interestHigh;
	}

	public void setInterestHigh(float interestHigh) {
		this.interestHigh = interestHigh;
	}

	public float getInterestLow() {
		return interestLow;
	}

	public void setInterestLow(float interestLow) {
		this.interestLow = interestLow;
	}

	public int getLoanTermA() {
		return loanTermA;
	}

	public void setLoanTermA(int loanTermA) {
		this.loanTermA = loanTermA;
	}

	public int getLoanTermB() {
		return loanTermB;
	}

	public void setLoanTermB(int loanTermB) {
		this.loanTermB = loanTermB;
	}

	@Override
	public String toString() {
		return "LoanProductVO [loanProductCode=" + loanProductCode + ", detail=" + detail + ", summary=" + summary
				+ ", qualification=" + qualification + ", interestHigh=" + interestHigh + ", interestLow=" + interestLow
				+ ", loanTermA=" + loanTermA + ", loanTermB=" + loanTermB + "]";
	}

}
