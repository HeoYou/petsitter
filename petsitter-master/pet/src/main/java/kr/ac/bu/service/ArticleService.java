package kr.ac.bu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.ac.bu.domain.Article;
import kr.ac.bu.domain.ArticleList;
import kr.ac.bu.domain.Comments;

@Service
public interface ArticleService {
	
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
