package kr.ac.kopo.business.vo;

public class IncomeStatementVO {

	private int sales;
	private int costOfSales;
	private int grossProfit;
	private int sellingExpenses;
	private int operatingIncome;
	private int nonOperatingIncome;
	private int nonOperatingExpenses;
	private int incomeTax;
	private int netIncome;

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

	public int getGrossProfit() {
		return grossProfit;
	}

	public void setGrossProfit(int grossProfit) {
		this.grossProfit = grossProfit;
	}

	public int getSellingExpenses() {
		return sellingExpenses;
	}

	public void setSellingExpenses(int sellingExpenses) {
		this.sellingExpenses = sellingExpenses;
	}

	public int getOperatingIncome() {
		return operatingIncome;
	}

	public void setOperatingIncome(int operatingIncome) {
		this.operatingIncome = operatingIncome;
	}

	public int getNonOperatingIncome() {
		return nonOperatingIncome;
	}

	public void setNonOperatingIncome(int nonOperatingIncome) {
		this.nonOperatingIncome = nonOperatingIncome;
	}

	public int getNonOperatingExpenses() {
		return nonOperatingExpenses;
	}

	public void setNonOperatingExpenses(int nonOperatingExpenses) {
		this.nonOperatingExpenses = nonOperatingExpenses;
	}

	public int getIncomeTax() {
		return incomeTax;
	}

	public void setIncomeTax(int incomeTax) {
		this.incomeTax = incomeTax;
	}

	public int getNetIncome() {
		return netIncome;
	}

	public void setNetIncome(int netIncome) {
		this.netIncome = netIncome;
	}

	@Override
	public String toString() {
		return "IncomeStatementVO [sales=" + sales + ", costOfSales=" + costOfSales + ", grossProfit=" + grossProfit
				+ ", sellingExpenses=" + sellingExpenses + ", operatingIncome=" + operatingIncome
				+ ", nonOperatingIncome=" + nonOperatingIncome + ", nonOperatingExpenses=" + nonOperatingExpenses
				+ ", incomeTax=" + incomeTax + ", netIncome=" + netIncome + "]";
	}

}
