package kr.ac.bu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.bu.domain.Petsitter;
import kr.ac.bu.domain.User;
import kr.ac.bu.domain.User2;
import kr.ac.bu.service.PetsitterService;
import kr.ac.bu.service.UserService;

@Controller
@RequestMapping(value = "user")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private PetsitterService psService;

	private String uId;

	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {

		return "views/user/join";
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(User user, Model model) {
		int state = userService.join(user);

		System.out.println(user.toString());

		if (state == 1) {
			return "views/user/check";
		} else if (state == 0) {
			model.addAttribute("joinFail", "이미 등록 되어 있는 계정이 있습니다.");
			return "views/user/join";
		} else {

			model.addAttribute("joinFail", "형식에 맞지 않는 정보입니다.");
			return "views/user/join";
		}

	}

	@RequestMapping(value = "check")
	@ResponseBody
	public int checkId(@RequestParam("userId") String uId) {

		return userService.checkId(uId);

	}

	@RequestMapping(value = "login")
	public String login() {

		return "views/user/login";

	}

//	@RequestMapping(value = "login", method = RequestMethod.POST)
//	public ModelAndView login(User user, Model model, HttpSession session) {
//
//		User dbUser = userService.login(user);
//		ModelAndView modelAndView = new ModelAndView();
//
//		if (dbUser != null && dbUser.getUPw().equals(user.getUPw())) {
//			session.setAttribute("user", dbUser);
//			modelAndView.setViewName("redirect:/main");
//		} else {
//			model.addAttribute("loginFail", "ID또는 PW가 일치하지 않습니다.");
//			modelAndView.setViewName("views/user/loginfail");
//		}
//		return modelAndView;
//	}
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public ModelAndView login(User user, Model model, HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();

		if (user.getUId().equals("admin") && user.getUPw().equals("1234")) {
			session.setAttribute("user", user);
			modelAndView.setViewName("redirect:/admin/list");
		} else {
			User dbUser = userService.login(user);

			if (dbUser != null && dbUser.getUPw().equals(user.getUPw())) {
				session.setAttribute("user", dbUser);
				modelAndView.setViewName("redirect:/main");
			} else {
				model.addAttribute("loginFail", "ID또는 PW가 일치하지 않습니다.");
				modelAndView.setViewName("views/user/login");
			}
		}
		return modelAndView;
	}

	@RequestMapping(value = "logout")
	public String logout(HttpSession session) {

		session.removeValue("user");

		return "redirect:/main";
	}

//   @RequestMapping(value = "modify.do", method = RequestMethod.GET)
//   public ModelAndView modify(Integer articleId) {
//
//      ModelAndView modelAndView = new ModelAndView("user/modify");
//
//      User user = userService.findUser(uId);
//      modelAndView.addObject("user", user);
//
//      return modelAndView;
//   }
//
//   @RequestMapping(value = "modify.do", method = RequestMethod.POST)
//   public String modify(User user) {
//      userService.modifyUser(user);
//
//      System.out.println("test");
//
//      return "views/main";
//   }

	@RequestMapping("edit.do")
	public String Edit(User user, String uId) {

		userService.EditUser(user, uId);

		return "redirect:/main";
	}

	@RequestMapping("delete.do")
	public String Delete(String uId) {

		userService.DeleteUser(uId);

		return "views/main";
	}

	@RequestMapping(value = "sitterjoin")
	public String sitterJoin(HttpSession session, Petsitter ps, List<MultipartFile> pictures) {
		User user = (User) session.getAttribute("user");
		ps.setuId(user.getUId());

		System.out.println(ps.getPsAddress());

		userService.sitterJoin(ps, pictures);

		return "redirect:/main";

	}

	@RequestMapping(value = "sitterModify", method = RequestMethod.GET)
	public String sitterModify(HttpSession session, Model model) {
		System.out.println("우우");
		User user = (User) session.getAttribute("user");

		Petsitter ps = userService.selectSitter(user.getUId());

		if (ps == null) {
			model.addAttribute("petsitter", ps);

		} else {
			model.addAttribute("images", psService.images(ps.getPsId()));
			model.addAttribute("petsitter", ps);
		}

		return "views/mypage/pspage";

	}

	@RequestMapping(value = "sitterModify", method = RequestMethod.POST)
	public String sitterModify(HttpSession session, Petsitter ps, List<MultipartFile> pictures) {

		User user = (User) session.getAttribute("user");
		ps.setuId(user.getUId());
		System.out.println(ps.toString());
		userService.sitterModify(ps, pictures);

		return "redirect:/main";

	}

	@RequestMapping(value = "userinfo", method = RequestMethod.GET)
	public ModelAndView userinfo(HttpSession session, Model model) {

		User user = (User) session.getAttribute("user");
		ModelAndView modelAndView = new ModelAndView("views/mypage/mainpage");

		modelAndView.addObject("userinfo", userService.userInfo(user.getUId()));

		return modelAndView;

	}

}