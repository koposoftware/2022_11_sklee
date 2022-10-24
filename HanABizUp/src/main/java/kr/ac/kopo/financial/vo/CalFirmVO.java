package kr.ac.kopo.financial.vo;

import java.util.List;

public class CalFirmVO {

	private String compName;
	private int fiscalYear;
	private int sales;
	private int costOfSales;
	private int depreciation;
	private int currentAssets;
	private int longTermAssets;
	private int currentLiabilities;
	private int longTermLiabilities;
	private List<CalFirmVO> calFirmList;

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public int getFiscalYear() {
		return fiscalYear;
	}

	public void setFiscalYear(int fiscalYear) {
		this.fiscalYear = fiscalYear;
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

	public int getDepreciation() {
		return depreciation;
	}

	public void setDepreciation(int depreciation) {
		this.depreciation = depreciation;
	}

	public int getCurrentAssets() {
		return currentAssets;
	}

	public void setCurrentAssets(int currentAssets) {
		this.currentAssets = currentAssets;
	}

	public int getLongTermAssets() {
		return longTermAssets;
	}

	public void setLongTermAssets(int longTermAssets) {
		this.longTermAssets = longTermAssets;
	}

	public int getCurrentLiabilities() {
		return currentLiabilities;
	}

	public void setCurrentLiabilities(int currentLiabilities) {
		this.currentLiabilities = currentLiabilities;
	}

	public int getLongTermLiabilities() {
		return longTermLiabilities;
	}

	public void setLongTermLiabilities(int longTermLiabilities) {
		this.longTermLiabilities = longTermLiabilities;
	}

	public List<CalFirmVO> getCalFirmList() {
		return calFirmList;
	}

	public void setCalFirmList(List<CalFirmVO> calFirmList) {
		this.calFirmList = calFirmList;
	}

	@Override
	public String toString() {
		return "CalFirmVO [compName=" + compName + ", fiscalYear=" + fiscalYear + ", sales=" + sales + ", costOfSales="
				+ costOfSales + ", depreciation=" + depreciation + ", currentAssets=" + currentAssets
				+ ", longTermAssets=" + longTermAssets + ", currentLiabilities=" + currentLiabilities
				+ ", longTermLiabilities=" + longTermLiabilities + ", calFirmList=" + calFirmList + "]";
	}

}
