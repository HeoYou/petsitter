package kr.ac.bu.store;

import java.util.List;

import kr.ac.bu.domain.Article;
import kr.ac.bu.domain.ArticleList;
import kr.ac.bu.domain.Comments;

public interface ArticleStore {
	
	List<ArticleList> artList();
	int insert(Article article);
	Article detail(int articleId);
	void modify(Article article);
	void delete(int articleId);
	List<Comments> cmt(int articleId);
	Article userdetail(int articleId);
	void cmtRegist(Comments comment);
	void cmtRmv(int cmtId);
}
