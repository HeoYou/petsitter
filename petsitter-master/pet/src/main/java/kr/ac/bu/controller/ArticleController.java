package kr.ac.bu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.bu.domain.Article;
import kr.ac.bu.domain.ArticleList;
import kr.ac.bu.domain.Comments;
import kr.ac.bu.service.ArticleService;

@Controller
@RequestMapping(value = "article")
public class ArticleController {

	@Autowired
	ArticleService artService;

	// list
	@RequestMapping(value = "list")
	public ModelAndView artList(HttpSession session) {

		System.out.println("artlist");
		List<ArticleList> articles = artService.artList();

		ModelAndView modelAndView = new ModelAndView("views/board/articleList");
		modelAndView.addObject("articles", articles);

		return modelAndView;
	}

	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public String artRegist(HttpSession session, Article article) {
		System.out.println(article.toString());

		artService.insert(article);

		return "redirect:/article/list";

	}

	@RequestMapping(value = "detail")
	public ModelAndView artDetail(HttpSession session, int articleId) {
		System.out.println("detail");
		System.out.println(articleId);
		Article detail = artService.detail(articleId);
		System.out.println(detail.toString());
		
		List<Comments> comments = artService.cmt(articleId);
		

		ModelAndView modelAndView = new ModelAndView("views/board/articleDetail");
		
		modelAndView.addObject("detail", detail);
		modelAndView.addObject("comments", comments);

		return modelAndView;
	}

	@RequestMapping(value = "userdetail")
	public ModelAndView artuserDetail(HttpSession session, int articleId) {
		System.out.println("detail");
		System.out.println(articleId);
		Article userdetail = artService.userdetail(articleId);
		System.out.println(userdetail.toString());

		ModelAndView modelAndView = new ModelAndView("views/user/userinfo");
		modelAndView.addObject("userdetail", userdetail);

		return modelAndView;
	}
	
	// search
	// modify
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String artModify(HttpSession session, int articleId, Model model) {
		Article article = artService.detail(articleId);
		model.addAttribute("article", article);
		return "views/board/articleModify";
	}

	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String artModify(HttpSession session, Article article) {
		System.out.println(article.toString());

		artService.modify(article);

		return "redirect:/article/detail?articleId="+article.getArticleId();
	}

	// remove
	
	@RequestMapping(value="delete")
	public String artDelete(HttpSession session, int articleId) {
		System.out.println("delete");
		
		artService.delete(articleId);
		
		return "redirect:/article/list";
	}


	@RequestMapping(value="cmtRegist")
	public String cmtRegist(HttpSession session, Comments comment, int articleId) {
		
		System.out.println("cmtRegist");
		
		artService.cmtRegist(comment);
		
		
		
		return "redirect:/article/detail?articleId="+articleId;
	}
	
	@RequestMapping(value="cmtrmv")
	public String cmtrmv(int cmtId, int articleId) {
		
		System.out.println("cmtRemove");
		
		artService.cmtRmv(cmtId);
		
		
		return "redirect:/article/detail?articleId="+articleId;
	}
	
}
