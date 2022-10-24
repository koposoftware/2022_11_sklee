package kr.ac.kopo.manager.vo;

public class BankerVO {

	private String empNo;
	private String password;
	private String name;
	private String phone;
	private String email;
	private String addr;
	private String hireDate;
	private String rank;

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getHireDate() {
		return hireDate;
	}

	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	@Override
	public String toString() {
		return "BankerVO [empNo=" + empNo + ", password=" + password + ", name=" + name + ", phone=" + phone
				+ ", email=" + email + ", addr=" + addr + ", hireDate=" + hireDate + ", rank=" + rank + "]";
	}

}
