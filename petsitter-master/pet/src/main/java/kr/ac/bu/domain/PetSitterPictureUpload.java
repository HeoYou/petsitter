package kr.ac.bu.domain;

public class PetSitterPictureUpload {
	
	private String imgId;
	private String uId;
	
	public PetSitterPictureUpload(String imgId, String uId)	{
		
		this.imgId = imgId;
		this.uId = uId;
	}
	
	
	public String getImgId() {
		return imgId;
	}
	public void setImgId(String imgId) {
		this.imgId = imgId;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}

}
