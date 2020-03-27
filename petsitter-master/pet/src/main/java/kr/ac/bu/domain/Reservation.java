package kr.ac.bu.domain;

import java.sql.Date;

public class Reservation {
	private int rId;
	private int psId;
	private Date rSdate;
	private Date rEdate;
	private String rStation;
	private Integer rPrice;
	private String uId;
	private int rStatus;
	private String uName;
	public int getrId() {
		return rId;
	}
	public void setrId(int rId) {
		this.rId = rId;
	}
	public int getPsId() {
		return psId;
	}
	public void setPsId(int psId) {
		this.psId = psId;
	}
	public Date getrSdate() {
		return rSdate;
	}
	public void setrSdate(Date rSdate) {
		this.rSdate = rSdate;
	}
	public Date getrEdate() {
		return rEdate;
	}
	public void setrEdate(Date rEdate) {
		this.rEdate = rEdate;
	}
	public String getrStation() {
		return rStation;
	}
	public void setrStation(String rStation) {
		this.rStation = rStation;
	}
	public Integer getrPrice() {
		return rPrice;
	}
	public void setrPrice(Integer rPrice) {
		this.rPrice = rPrice;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public int getrStatus() {
		return rStatus;
	}
	public void setrStatus(int rStatus) {
		this.rStatus = rStatus;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	
	@Override
	public String toString() {
		return "Reservation [rId=" + rId + ", psId=" + psId + ", rSdate=" + rSdate + ", rEdate=" + rEdate
				+ ", rStation=" + rStation + ", rPrice=" + rPrice + ", uId=" + uId + ", rStatus=" + rStatus + ", uName="
				+ uName + "]";
	}
	

	
	
}
