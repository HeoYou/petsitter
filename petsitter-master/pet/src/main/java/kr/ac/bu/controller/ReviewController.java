package kr.ac.bu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.bu.domain.Review;
import kr.ac.bu.domain.User;
import kr.ac.bu.service.ReviewService;

@Controller
@RequestMapping(value="rv")
public class ReviewController {

	@Autowired
	private ReviewService rvService;

	@RequestMapping(value="write")
	public String join(HttpSession session, Review rv) {
		User user = (User)session.getAttribute("user");
		rv.setuId(user.getUId());
		System.out.println(rv.toString());
		rvService.rvWrite(rv);
		
		return "redirect:/main";
	}

}
