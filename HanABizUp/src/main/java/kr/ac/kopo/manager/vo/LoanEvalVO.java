package kr.ac.kopo.manager.vo;

public class LoanEvalVO {

	private int evalLoan;
	private int evalAmount;
	private int evalSum;
	private int step1;
	private int step2;
	private int step3;
	private int step4;

	public int getEvalLoan() {
		return evalLoan;
	}

	public void setEvalLoan(int evalLoan) {
		this.evalLoan = evalLoan;
	}

	public int getEvalAmount() {
		return evalAmount;
	}

	public void setEvalAmount(int evalAmount) {
		this.evalAmount = evalAmount;
	}

	public int getEvalSum() {
		return evalSum;
	}

	public void setEvalSum(int evalSum) {
		this.evalSum = evalSum;
	}

	public int getStep1() {
		return step1;
	}

	public void setStep1(int step1) {
		this.step1 = step1;
	}

	public int getStep2() {
		return step2;
	}

	public void setStep2(int step2) {
		this.step2 = step2;
	}

	public int getStep3() {
		return step3;
	}

	public void setStep3(int step3) {
		this.step3 = step3;
	}

	public int getStep4() {
		return step4;
	}

	public void setStep4(int step4) {
		this.step4 = step4;
	}

	@Override
	public String toString() {
		return "LoanEvalVO [evalLoan=" + evalLoan + ", evalAmount=" + evalAmount + ", evalSum=" + evalSum + ", step1="
				+ step1 + ", step2=" + step2 + ", step3=" + step3 + ", step4=" + step4 + "]";
	}

}
