package kr.ac.bu.domain;

public class User {
	private String uId;
	private String uName;
	private String uPhone;
	private String uAddress;
	private String uPw;
	
	public User() {}
	
	public User(String uId, String uName, String uPhone, String uAddress, String uPw) {
		this.uId = uId;
		this.uName = uName;
		this.uPhone = uPhone;
		this.uAddress = uAddress;
		this.uPw = uPw;
	}
	
	public String getUId() {
		return uId;
	}
	public void setUId(String uId) {
		this.uId = uId;
	}
	public String getUName() {
		return uName;
	}
	public void setUName(String uName) {
		this.uName = uName;
	}
	public String getUPhone() {
		return uPhone;
	}
	public void setUPhone(String uPhone) {
		this.uPhone = uPhone;
	}
	public String getUAddress() {
		return uAddress;
	}
	public void setUAddress(String uAddress) {
		this.uAddress = uAddress;
	}
	public String getUPw() {
		return uPw;
	}
	public void setUPw(String uPw) {
		this.uPw = uPw;
	}

	@Override
	public String toString() {
		return "User [uId=" + uId + ", uName=" + uName + ", uPhone=" + uPhone + ", uAddress=" + uAddress + ", uPw="
				+ uPw + "]";
	}
	
}