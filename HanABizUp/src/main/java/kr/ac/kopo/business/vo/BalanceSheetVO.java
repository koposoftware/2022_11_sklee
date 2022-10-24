package kr.ac.kopo.business.vo;

public class BalanceSheetVO {

	private int currentAssets;
	private int cash;
	private int tradeReceivables;
	private int shortTermFinancial;
	private int inventories;
	private int longTermAssets;
	private int longTermFinancial;
	private int tangibleAssets;
	private int investmentProperties;
	private int intangibleAssets;
	private int otherLongTermAssets;
	private int liabilities;
	private int currentLiabilities;
	private int tradePayables;
	private int shortTermBorrowings;
	private int incomeTaxesPayables;
	private int accuredExpenses;
	private int longTermLiabilities;
	private int longTermBorrowings;
	private int equity;
	private int capitalStock;
	private int capitalSurplus;
	private int retainedEarning;

	public int getCurrentAssets() {
		return currentAssets;
	}

	public void setCurrentAssets(int currentAssets) {
		this.currentAssets = currentAssets;
	}

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}

	public int getTradeReceivables() {
		return tradeReceivables;
	}

	public void setTradeReceivables(int tradeReceivables) {
		this.tradeReceivables = tradeReceivables;
	}

	public int getShortTermFinancial() {
		return shortTermFinancial;
	}

	public void setShortTermFinancial(int shortTermFinancial) {
		this.shortTermFinancial = shortTermFinancial;
	}

	public int getInventories() {
		return inventories;
	}

	public void setInventories(int inventories) {
		this.inventories = inventories;
	}

	public int getLongTermAssets() {
		return longTermAssets;
	}

	public void setLongTermAssets(int longTermAssets) {
		this.longTermAssets = longTermAssets;
	}

	public int getLongTermFinancial() {
		return longTermFinancial;
	}

	public void setLongTermFinancial(int longTermFinancial) {
		this.longTermFinancial = longTermFinancial;
	}

	public int getTangibleAssets() {
		return tangibleAssets;
	}

	public void setTangibleAssets(int tangibleAssets) {
		this.tangibleAssets = tangibleAssets;
	}

	public int getInvestmentProperties() {
		return investmentProperties;
	}

	public void setInvestmentProperties(int investmentProperties) {
		this.investmentProperties = investmentProperties;
	}

	public int getIntangibleAssets() {
		return intangibleAssets;
	}

	public void setIntangibleAssets(int intangibleAssets) {
		this.intangibleAssets = intangibleAssets;
	}

	public int getOtherLongTermAssets() {
		return otherLongTermAssets;
	}

	public void setOtherLongTermAssets(int otherLongTermAssets) {
		this.otherLongTermAssets = otherLongTermAssets;
	}

	public int getLiabilities() {
		return liabilities;
	}

	public void setLiabilities(int liabilities) {
		this.liabilities = liabilities;
	}

	public int getCurrentLiabilities() {
		return currentLiabilities;
	}

	public void setCurrentLiabilities(int currentLiabilities) {
		this.currentLiabilities = currentLiabilities;
	}

	public int getTradePayables() {
		return tradePayables;
	}

	public void setTradePayables(int tradePayables) {
		this.tradePayables = tradePayables;
	}

	public int getShortTermBorrowings() {
		return shortTermBorrowings;
	}

	public void setShortTermBorrowings(int shortTermBorrowings) {
		this.shortTermBorrowings = shortTermBorrowings;
	}

	public int getIncomeTaxesPayables() {
		return incomeTaxesPayables;
	}

	public void setIncomeTaxesPayables(int incomeTaxesPayables) {
		this.incomeTaxesPayables = incomeTaxesPayables;
	}

	public int getAccuredExpenses() {
		return accuredExpenses;
	}

	public void setAccuredExpenses(int accuredExpenses) {
		this.accuredExpenses = accuredExpenses;
	}

	public int getLongTermLiabilities() {
		return longTermLiabilities;
	}

	public void setLongTermLiabilities(int longTermLiabilities) {
		this.longTermLiabilities = longTermLiabilities;
	}

	public int getLongTermBorrowings() {
		return longTermBorrowings;
	}

	public void setLongTermBorrowings(int longTermBorrowings) {
		this.longTermBorrowings = longTermBorrowings;
	}

	public int getEquity() {
		return equity;
	}

	public void setEquity(int equity) {
		this.equity = equity;
	}

	public int getCapitalStock() {
		return capitalStock;
	}

	public void setCapitalStock(int capitalStock) {
		this.capitalStock = capitalStock;
	}

	public int getCapitalSurplus() {
		return capitalSurplus;
	}

	public void setCapitalSurplus(int capitalSurplus) {
		this.capitalSurplus = capitalSurplus;
	}

	public int getRetainedEarning() {
		return retainedEarning;
	}

	public void setRetainedEarning(int retainedEarning) {
		this.retainedEarning = retainedEarning;
	}

	@Override
	public String toString() {
		return "BalanceSheetVO [currentAssets=" + currentAssets + ", cash=" + cash + ", tradeReceivables="
				+ tradeReceivables + ", shortTermFinancial=" + shortTermFinancial + ", inventories=" + inventories
				+ ", longTermAssets=" + longTermAssets + ", longTermFinancial=" + longTermFinancial
				+ ", tangibleAssets=" + tangibleAssets + ", investmentProperties=" + investmentProperties
				+ ", intangibleAssets=" + intangibleAssets + ", otherLongTermAssets=" + otherLongTermAssets
				+ ", liabilities=" + liabilities + ", currentLiabilities=" + currentLiabilities + ", tradePayables="
				+ tradePayables + ", shortTermBorrowings=" + shortTermBorrowings + ", incomeTaxesPayables="
				+ incomeTaxesPayables + ", accuredExpenses=" + accuredExpenses + ", longTermLiabilities="
				+ longTermLiabilities + ", longTermBorrowings=" + longTermBorrowings + ", equity=" + equity
				+ ", capitalStock=" + capitalStock + ", capitalSurplus=" + capitalSurplus + ", retainedEarning="
				+ retainedEarning + "]";
	}
}
