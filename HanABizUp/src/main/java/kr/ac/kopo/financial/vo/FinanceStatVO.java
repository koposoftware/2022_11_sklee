package kr.ac.kopo.financial.vo;

public class FinanceStatVO {

	private int currentRatio;
	private int debtRatio;
	private int totalAssetReturn;
	private int sales;
	private int costOfSales;
	private int netIncome;
	private int salesDiff;
	private int costOfSalesDiff;
	private int netIncomeDiff;

	public int getCurrentRatio() {
		return currentRatio;
	}

	public void setCurrentRatio(int currentRatio) {
		this.currentRatio = currentRatio;
	}

	public int getDebtRatio() {
		return debtRatio;
	}

	public void setDebtRatio(int debtRatio) {
		this.debtRatio = debtRatio;
	}

	public int getTotalAssetReturn() {
		return totalAssetReturn;
	}

	public void setTotalAssetReturn(int totalAssetReturn) {
		this.totalAssetReturn = totalAssetReturn;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public int getCostOfSales() {
		return costOfSales;
	}

	public void setCostOfSales(int costOfSales) {
		this.costOfSales = costOfSales;
	}

	public int getNetIncome() {
		return netIncome;
	}

	public void setNetIncome(int netIncome) {
		this.netIncome = netIncome;
	}

	public int getSalesDiff() {
		return salesDiff;
	}

	public void setSalesDiff(int salesDiff) {
		this.salesDiff = salesDiff;
	}

	public int getCostOfSalesDiff() {
		return costOfSalesDiff;
	}

	public void setCostOfSalesDiff(int costOfSalesDiff) {
		this.costOfSalesDiff = costOfSalesDiff;
	}

	public int getNetIncomeDiff() {
		return netIncomeDiff;
	}

	public void setNetIncomeDiff(int netIncomeDiff) {
		this.netIncomeDiff = netIncomeDiff;
	}

	@Override
	public String toString() {
		return "FinanceStatVO [currentRatio=" + currentRatio + ", debtRatio=" + debtRatio + ", totalAssetReturn="
				+ totalAssetReturn + ", sales=" + sales + ", costOfSales=" + costOfSales + ", netIncome=" + netIncome
				+ ", salesDiff=" + salesDiff + ", costOfSalesDiff=" + costOfSalesDiff + ", netIncomeDiff="
				+ netIncomeDiff + "]";
	}

}
