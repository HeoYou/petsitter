package kr.ac.bu.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.bu.domain.Article;
import kr.ac.bu.domain.ArticleList;
import kr.ac.bu.domain.Comments;
import kr.ac.bu.service.ArticleService;
import kr.ac.bu.store.ArticleStore;

@Service
public class ArticleServiceLogic implements ArticleService{

	@Autowired
	ArticleStore artStore;
	
	
	@Override
	public List<ArticleList> artList() {
		// TODO Auto-generated method stub
		return artStore.artList();
	}
	
	public int insert(Article article) {
		artStore.insert(article);
		return 0;
	}

	@Override
	public Article detail(int articleId) {
		
		return artStore.detail(articleId);
	}

	@Override
	public void modify(Article article) {
		artStore.modify(article);
		
	}
	
	@Override
	public void delete(int articleId) {
		artStore.delete(articleId);
	}

	@Override
	public List<Comments> cmt(int articleId) {
		// TODO Auto-generated method stub
		return artStore.cmt(articleId);
	}

	@Override
	public Article userdetail(int articleId) {

		return artStore.userdetail(articleId);
	}

	@Override
	public void cmtRegist(Comments comment) {
		artStore.cmtRegist(comment);
	}

	@Override
	public void cmtRmv(int cmtId) {
		artStore.cmtRmv(cmtId);
		
	}

}
