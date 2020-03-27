package kr.ac.bu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.bu.service.UserService;

@Controller

public class MainController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "main")
	public String join(HttpSession session, Model model) {

		if (session.getAttribute("user") == null) { // 로그인 여부에 따른 우측 메뉴 변경
			model.addAttribute("menu1", "로그인");
			model.addAttribute("menu1addr", "user/login");
			model.addAttribute("menu2", "펫시터 가입");
			model.addAttribute("menu2addr", "user/login");
			model.addAttribute("menu3", "펫시터 목록");
			model.addAttribute("menu3addr", "petsitter/list");
			model.addAttribute("menu4", "펫시터 찾기");
			model.addAttribute("menu4addr", "views/petsitter/petsearch.jsp");
			model.addAttribute("menu5", "게시판");
			model.addAttribute("menu5addr", "/article/list");

		} else {
			model.addAttribute("menu1", "마이 페이지");
			model.addAttribute("menu1addr", "/user/userinfo");
			model.addAttribute("menu2", "펫시터 가입");
			model.addAttribute("menu2addr", "/views/petsitter/petsitterjoin.jsp");
			model.addAttribute("menu3", "펫시터 목록");
			model.addAttribute("menu3addr", "/petsitter/list");
			model.addAttribute("menu4", "펫시터 찾기");
			model.addAttribute("menu4addr", "/views/petsitter/petsearch.jsp");
			model.addAttribute("menu5", "로그아웃");
			model.addAttribute("menu5addr", "/user/logout");
			model.addAttribute("menu6", "게시판");
			model.addAttribute("menu6addr", "/article/list");
		}
		return "views/main";

	}

	@RequestMapping(value = "header")
	public String header(HttpSession session, Model model) {

		if (session.getAttribute("user") == null) { // 로그인 여부에 따른 우측 메뉴 변경
			model.addAttribute("menu1", "로그인");
			model.addAttribute("menu1addr", "/user/login");
			model.addAttribute("menu2", "펫시터 가입");
			model.addAttribute("menu2addr", "/user/login");
			model.addAttribute("menu3", "펫시터 목록");
			model.addAttribute("menu3addr", "/petsitter/list");
			model.addAttribute("menu4", "펫시터 찾기");
			model.addAttribute("menu4addr", "/views/petsitter/petsearch.jsp");
			model.addAttribute("menu5", "게시판");
			model.addAttribute("menu5addr", "/article/list");

		} else {
			model.addAttribute("menu1", "마이 페이지");
			model.addAttribute("menu1addr", "/user/userinfo");
			model.addAttribute("menu2", "펫시터 가입");
			model.addAttribute("menu2addr", "/views/petsitter/petsitterjoin.jsp");
			model.addAttribute("menu3", "펫시터 목록");
			model.addAttribute("menu3addr", "/petsitter/list");
			model.addAttribute("menu4", "펫시터 찾기");
			model.addAttribute("menu4addr", "/views/petsitter/petsearch.jsp");
			model.addAttribute("menu5", "로그아웃");
			model.addAttribute("menu5addr", "/user/logout");
			model.addAttribute("menu6", "게시판");
			model.addAttribute("menu6addr", "/article/list");
		}

		return "views/header";

	}

}
