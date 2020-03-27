package kr.ac.bu.store.logic;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.bu.domain.Article;
import kr.ac.bu.domain.ArticleList;
import kr.ac.bu.domain.Comments;
import kr.ac.bu.store.ArticleStore;

@Repository
public class ArticleStoreLogic implements ArticleStore{
	
	private static final String namespace = "kr.ac.bu.mappers.article-mapper";

	@Autowired
	SqlSession session;

	@Override
	public List<ArticleList> artList() {
		
		return session.selectList(namespace + ".articleList");
	}
	
	@Override
	public int insert(Article article) {
		/*
		 * Map<String, Object> param = new HashMap<>();
		 * param.put("articleTitle",article.getArticleTitle()); param.put("articleInfo",
		 * article.getArticleInfo()); param.put("uId", article.getuId());
		 */
				
		 session.insert(namespace + ".insert", article);
		return 0;
	}

	@Override
	public Article detail(int articleId) {
		session.update(namespace+".count", articleId);
		
		return session.selectOne(namespace +".detail", articleId);
	}

	@Override
	public void modify(Article article) {
		session.update(namespace+".modify", article);
	}

	@Override
	public void delete(int articleId) {
		session.delete(namespace+".delete", articleId);
		
	}

	@Override
	public List<Comments> cmt(int articleId) {
		
		return session.selectList(namespace+".comments", articleId);
	}

	@Override
	public Article userdetail(int articleId) {
		session.update(namespace+".count", articleId);
		return session.selectOne(namespace +".userdetail", articleId);
	}

	@Override
	public void cmtRegist(Comments comment) {
		session.insert(namespace+".cmtRegist",comment);
		
	}

	@Override
	public void cmtRmv(int cmtId) {
		session.delete(namespace+".cmtRemove", cmtId);
	}

}
