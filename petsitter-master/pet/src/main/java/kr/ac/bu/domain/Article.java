package kr.ac.bu.domain;

import java.sql.Date;

/**
 * @author USER
 *
 */
public class Article {

	private int articleId;
	private String articleTitle;
	private Date articleDate;
	private String articleInfo;
	private String uName;
	private int articleCount;
	private String uId;


	@Override
	public String toString() {
		return "Article [articleId=" + articleId + ", articleTitle=" + articleTitle + ", articleDate=" + articleDate
				+ ", articleInfo=" + articleInfo + ", uName=" + uName + ", articleCount=" + articleCount + ", uId="
				+ uId + "]";
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public String getArticleTitle() {
		return articleTitle;
	}

	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}

	public Date getArticleDate() {
		return articleDate;
	}

	public void setArticleDate(Date articleDate) {
		this.articleDate = articleDate;
	}

	public String getArticleInfo() {
		return articleInfo;
	}

	public void setArticleInfo(String articleInfo) {
		this.articleInfo = articleInfo;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public int getArticleCount() {
		return articleCount;
	}

	public void setArticleCount(int articleCount) {
		this.articleCount = articleCount;
	}

}
