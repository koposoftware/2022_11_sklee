package kr.ac.kopo.business.vo;

public class SalesVO {

	private int monthlySales;
	private int monthlyCost;
	private int yearlySales;
	private int salesDiff;
	private int costDiff;
	private int yearlyDiff;

	public int getMonthlySales() {
		return monthlySales;
	}

	public void setMonthlySales(int monthlySales) {
		this.monthlySales = monthlySales;
	}

	public int getMonthlyCost() {
		return monthlyCost;
	}

	public void setMonthlyCost(int monthlyCost) {
		this.monthlyCost = monthlyCost;
	}

	public int getYearlySales() {
		return yearlySales;
	}

	public void setYearlySales(int yearlySales) {
		this.yearlySales = yearlySales;
	}

	public int getSalesDiff() {
		return salesDiff;
	}

	public void setSalesDiff(int salesDiff) {
		this.salesDiff = salesDiff;
	}

	public int getCostDiff() {
		return costDiff;
	}

	public void setCostDiff(int costDiff) {
		this.costDiff = costDiff;
	}

	public int getYearlyDiff() {
		return yearlyDiff;
	}

	public void setYearlyDiff(int yearlyDiff) {
		this.yearlyDiff = yearlyDiff;
	}

	@Override
	public String toString() {
		return "SalesVO [monthlySales=" + monthlySales + ", monthlyCost=" + monthlyCost + ", yearlySales=" + yearlySales
				+ ", salesDiff=" + salesDiff + ", costDiff=" + costDiff + ", yearlyDiff=" + yearlyDiff + "]";
	}

}
