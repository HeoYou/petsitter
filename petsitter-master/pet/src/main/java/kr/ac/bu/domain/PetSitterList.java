package kr.ac.bu.domain;
 
public class PetSitterList {

	private int psId;
	private String psAddress;
	private String psIntro;
	private String uName;
	private int sittinCount;
	private String imgId;
	private int psflag;
	
	public int getPsId() {
		return psId;
	}
	public void setPsId(int psId) {
		this.psId = psId;
	}
	public String getPsAddress() {
		return psAddress;
	}
	public void setPsAddress(String psAddress) {
		this.psAddress = psAddress;
	}
	public String getPsIntro() {
		return psIntro;
	}
	public void setPsIntro(String psIntro) {
		this.psIntro = psIntro;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public int getSittinCount() {
		return sittinCount;
	}
	public void setSittinCount(int sittinCount) {
		this.sittinCount = sittinCount;
	}
	public String getImgId() {
		return imgId;
	}
	public void setImgId(String imgId) {
		this.imgId = imgId;
	}
	public int getPsflag() {
		return psflag;
	}
	public void setPsflag(int psflag) {
		this.psflag = psflag;
	}
	

}