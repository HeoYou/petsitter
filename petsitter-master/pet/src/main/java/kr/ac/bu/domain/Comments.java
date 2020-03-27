package kr.ac.bu.domain;

import java.sql.Date;

public class Comments {
	String uId;
	int cmtId;
	String uName;
	String comment;
	Date cmtDate;
	int articleId;
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public int getCmtId() {
		return cmtId;
	}
	public void setCmtId(int cmtId) {
		this.cmtId = cmtId;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getCmtDate() {
		return cmtDate;
	}
	public void setCmtDate(Date cmtDate) {
		this.cmtDate = cmtDate;
	}
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	
	@Override
	public String toString() {
		return "Comments [uId=" + uId + ", cmtId=" + cmtId + ", uName=" + uName + ", comment=" + comment + ", cmtDate="
				+ cmtDate + ", articleId=" + articleId + "]";
	}
	
	
	
		
}
 