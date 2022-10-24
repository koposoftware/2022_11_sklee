package kr.ac.kopo.business.vo;

public class KeywordSearchVO {

	private String accountingCode;
	private String searchKeyword;
	private String searchDetail;

	public String getAccountingCode() {
		return accountingCode;
	}

	public void setAccountingCode(String accountingCode) {
		this.accountingCode = accountingCode;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getSearchDetail() {
		return searchDetail;
	}

	public void setSearchDetail(String searchDetail) {
		this.searchDetail = searchDetail;
	}

	@Override
	public String toString() {
		return "KeywordSearchVO [accountingCode=" + accountingCode + ", searchKeyword=" + searchKeyword
				+ ", searchDetail=" + searchDetail + "]";
	}

}
