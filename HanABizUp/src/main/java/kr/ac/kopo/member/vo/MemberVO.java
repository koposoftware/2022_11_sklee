package kr.ac.kopo.member.vo;

public class MemberVO {

	private String id;
	private String password;
	private String compName;
	private String ceo;
	private String ceoEmail;
	private String ceoPhone;
	private String compRegno;
	private String compAddr;
	private String compStartDate;
	private String regDate;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public String getCeo() {
		return ceo;
	}

	public void setCeo(String ceo) {
		this.ceo = ceo;
	}

	public String getCeoEmail() {
		return ceoEmail;
	}

	public void setCeoEmail(String ceoEmail) {
		this.ceoEmail = ceoEmail;
	}

	public String getCeoPhone() {
		return ceoPhone;
	}

	public void setCeoPhone(String ceoPhone) {
		this.ceoPhone = ceoPhone;
	}

	public String getCompRegno() {
		return compRegno;
	}

	public void setCompRegno(String compRegno) {
		this.compRegno = compRegno;
	}

	public String getCompAddr() {
		return compAddr;
	}

	public void setCompAddr(String compAddr) {
		this.compAddr = compAddr;
	}

	public String getCompStartDate() {
		return compStartDate;
	}

	public void setCompStartDate(String compStartDate) {
		this.compStartDate = compStartDate;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", compName=" + compName + ", ceo=" + ceo
				+ ", ceoEmail=" + ceoEmail + ", ceoPhone=" + ceoPhone + ", compRegno=" + compRegno + ", compAddr="
				+ compAddr + ", compStartDate=" + compStartDate + ", regDate=" + regDate + "]";
	}

}
