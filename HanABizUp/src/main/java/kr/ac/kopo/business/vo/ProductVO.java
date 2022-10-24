package kr.ac.kopo.business.vo;

import java.util.List;

public class ProductVO {

	private String compName;
	private String productName;
	private String productCost;
	private String inventory;
	private String productSold;
	private List<ProductVO> productList;

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductCost() {
		return productCost;
	}

	public void setProductCost(String productCost) {
		this.productCost = productCost;
	}

	public String getInventory() {
		return inventory;
	}

	public void setInventory(String inventory) {
		this.inventory = inventory;
	}

	public String getProductSold() {
		return productSold;
	}

	public void setProductSold(String productSold) {
		this.productSold = productSold;
	}

	public List<ProductVO> getProductList() {
		return productList;
	}

	public void setProductList(List<ProductVO> productList) {
		this.productList = productList;
	}

	@Override
	public String toString() {
		return "ProductVO [compName=" + compName + ", productName=" + productName + ", productCost=" + productCost
				+ ", inventory=" + inventory + ", productSold=" + productSold + "]";
	}

}
