package kr.ac.bu.domain;

public class Admin {
	private String uId;
	private String uPw;
	private String uName;


	public Admin(String uId, String uName, String uPw) {
		this.uId = uId;
		this.uName = uName;
		this.uPw = uPw;
	}


	public String getuId() {
		return uId;
	}


	public void setuId(String uId) {
		this.uId = uId;
	}


	public String getuPw() {
		return uPw;
	}


	public void setuPw(String uPw) {
		this.uPw = uPw;
	}


	public String getuName() {
		return uName;
	}


	public void setuName(String uName) {
		this.uName = uName;
	}


	@Override
	public String toString() {
		return "Admin [uId=" + uId + ", uPw=" + uPw + ", uName=" + uName + "]";
	}
	
	
}
