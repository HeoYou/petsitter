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

		if (session.getAttribute("user") == null) { // �α��� ���ο� ���� ���� �޴� ����
			model.addAttribute("menu1", "�α���");
			model.addAttribute("menu1addr", "user/login");
			model.addAttribute("menu2", "����� ����");
			model.addAttribute("menu2addr", "user/login");
			model.addAttribute("menu3", "����� ���");
			model.addAttribute("menu3addr", "petsitter/list");
			model.addAttribute("menu4", "����� ã��");
			model.addAttribute("menu4addr", "views/petsitter/petsearch.jsp");
			model.addAttribute("menu5", "�Խ���");
			model.addAttribute("menu5addr", "/article/list");

		} else {
			model.addAttribute("menu1", "���� ������");
			model.addAttribute("menu1addr", "/user/userinfo");
			model.addAttribute("menu2", "����� ����");
			model.addAttribute("menu2addr", "/views/petsitter/petsitterjoin.jsp");
			model.addAttribute("menu3", "����� ���");
			model.addAttribute("menu3addr", "/petsitter/list");
			model.addAttribute("menu4", "����� ã��");
			model.addAttribute("menu4addr", "/views/petsitter/petsearch.jsp");
			model.addAttribute("menu5", "�α׾ƿ�");
			model.addAttribute("menu5addr", "/user/logout");
			model.addAttribute("menu6", "�Խ���");
			model.addAttribute("menu6addr", "/article/list");
		}
		return "views/main";

	}

	@RequestMapping(value = "header")
	public String header(HttpSession session, Model model) {

		if (session.getAttribute("user") == null) { // �α��� ���ο� ���� ���� �޴� ����
			model.addAttribute("menu1", "�α���");
			model.addAttribute("menu1addr", "/user/login");
			model.addAttribute("menu2", "����� ����");
			model.addAttribute("menu2addr", "/user/login");
			model.addAttribute("menu3", "����� ���");
			model.addAttribute("menu3addr", "/petsitter/list");
			model.addAttribute("menu4", "����� ã��");
			model.addAttribute("menu4addr", "/views/petsitter/petsearch.jsp");
			model.addAttribute("menu5", "�Խ���");
			model.addAttribute("menu5addr", "/article/list");

		} else {
			model.addAttribute("menu1", "���� ������");
			model.addAttribute("menu1addr", "/user/userinfo");
			model.addAttribute("menu2", "����� ����");
			model.addAttribute("menu2addr", "/views/petsitter/petsitterjoin.jsp");
			model.addAttribute("menu3", "����� ���");
			model.addAttribute("menu3addr", "/petsitter/list");
			model.addAttribute("menu4", "����� ã��");
			model.addAttribute("menu4addr", "/views/petsitter/petsearch.jsp");
			model.addAttribute("menu5", "�α׾ƿ�");
			model.addAttribute("menu5addr", "/user/logout");
			model.addAttribute("menu6", "�Խ���");
			model.addAttribute("menu6addr", "/article/list");
		}

		return "views/header";

	}

}
