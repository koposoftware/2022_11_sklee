package kr.ac.kopo.financial.vo;

public class CalFirmEtcVO {

	private String compName;
	private float taxRate;
	private float kd;
	private float ke;
	private float growthRate;

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public float getTaxRate() {
		return taxRate;
	}

	public void setTaxRate(float taxRate) {
		this.taxRate = taxRate;
	}

	public float getKd() {
		return kd;
	}

	public void setKd(float kd) {
		this.kd = kd;
	}

	public float getKe() {
		return ke;
	}

	public void setKe(float ke) {
		this.ke = ke;
	}

	public float getGrowthRate() {
		return growthRate;
	}

	public void setGrowthRate(float growthRate) {
		this.growthRate = growthRate;
	}

	@Override
	public String toString() {
		return "CalFirmEtcVO [compName=" + compName + ", taxRate=" + taxRate + ", kd=" + kd + ", ke=" + ke
				+ ", growthRate=" + growthRate + "]";
	}

}
