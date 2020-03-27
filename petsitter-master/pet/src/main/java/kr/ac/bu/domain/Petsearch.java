package kr.ac.bu.domain;

import java.util.Date;

public class Petsearch {
	private Date Sdate;
	private Date Edate;
	private boolean psOption10;
	private String Address;
	private int sizes;
	private int sizem;
	private int sizel;
	
	
	public Date getSdate() {
		return Sdate;
	}
	public void setSdate(Date sdate) {
		Sdate = sdate;
	}
	public Date getEdate() {
		return Edate;
	}
	public void setEdate(Date edate) {
		Edate = edate;
	}
	public boolean isPsOption10() {
		return psOption10;
	}
	public void setPsOption10(boolean psOption10) {
		this.psOption10 = psOption10;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public int getSizes() {
		return sizes;
	}
	public void setSizes(int sizes) {
		this.sizes = sizes;
	}
	public int getSizem() {
		return sizem;
	}
	public void setSizem(int sizem) {
		this.sizem = sizem;
	}
	public int getSizel() {
		return sizel;
	}
	public void setSizel(int sizel) {
		this.sizel = sizel;
	}
	
	
	@Override
	public String toString() {
		return "Petsearch [Sdate=" + Sdate + ", Edate=" + Edate + ", psOption10=" + psOption10 + ", Address=" + Address
				+ ", sizes=" + sizes + ", sizem=" + sizem + ", sizel=" + sizel + "]";
	}
	
	
	}
