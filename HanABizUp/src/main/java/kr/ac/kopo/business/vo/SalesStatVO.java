package kr.ac.kopo.business.vo;

public class SalesStatVO {

	private int currentSales;
	private int recentSales;
	private int yearlySales;
	private int currentCost;
	private int recentCost;

	public int getCurrentSales() {
		return currentSales;
	}

	public void setCurrentSales(int currentSales) {
		this.currentSales = currentSales;
	}

	public int getRecentSales() {
		return recentSales;
	}

	public void setRecentSales(int recentSales) {
		this.recentSales = recentSales;
	}

	public int getYearlySales() {
		return yearlySales;
	}

	public void setYearlySales(int yearlySales) {
		this.yearlySales = yearlySales;
	}

	public int getCurrentCost() {
		return currentCost;
	}

	public void setCurrentCost(int currentCost) {
		this.currentCost = currentCost;
	}

	public int getRecentCost() {
		return recentCost;
	}

	public void setRecentCost(int recentCost) {
		this.recentCost = recentCost;
	}

	@Override
	public String toString() {
		return "SalesStatVO [currentSales=" + currentSales + ", recentSales=" + recentSales + ", yearlySales="
				+ yearlySales + ", currentCost=" + currentCost + ", recentCost=" + recentCost + "]";
	}

}
