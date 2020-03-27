package kr.ac.bu.domain;

import java.sql.Date;

public class Review {
	
	private int rvId;
	private String rvIntro;
	private Date rvDate;
	private int rvScore;
	private int psId;
	private String uId;
	private String uName;
	public int getRvId() {
		return rvId;
	}
	public void setRvId(int rvId) {
		this.rvId = rvId;
	}
	public String getRvIntro() {
		return rvIntro;
	}
	public void setRvIntro(String rvIntro) {
		this.rvIntro = rvIntro;
	}
	public Date getRvDate() {
		return rvDate;
	}
	public void setRvDate(Date rvDate) {
		this.rvDate = rvDate;
	}
	public int getRvScore() {
		return rvScore;
	}
	public void setRvScore(int rvScore) {
		this.rvScore = rvScore;
	}
	public int getPsId() {
		return psId;
	}
	public void setPsId(int psId) {
		this.psId = psId;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	@Override
	public String toString() {
		return "Review [rvId=" + rvId + ", rvIntro=" + rvIntro + ", rvDate=" + rvDate + ", rvScore=" + rvScore
				+ ", psId=" + psId + ", uId=" + uId + ", uName=" + uName + "]";
	}
	
	
	
	
}
