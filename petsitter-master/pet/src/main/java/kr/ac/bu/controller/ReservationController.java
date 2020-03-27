package kr.ac.bu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.bu.domain.Petsitter;
import kr.ac.bu.domain.Reservation;
import kr.ac.bu.domain.User;
import kr.ac.bu.service.RsvService;
import kr.ac.bu.service.UserService;

@Controller
@RequestMapping(value = "rsv")
public class ReservationController {

	@Autowired
	private RsvService rsvService;

	@Autowired
	private UserService userService;

	@RequestMapping(value = "reservation")
	public String reservationInfo(Reservation rsv) {

		System.out.println("1 " + rsv.toString());
		rsvService.reservation(rsv);

		return "redirect:/main";
	}

	@RequestMapping(value = "list.do")
	public ModelAndView list() {

		List<Reservation> list = rsvService.readAll();
		ModelAndView mav = new ModelAndView("views/reservation/rlog");
		mav.addObject("Reservation", list);

		return mav;
	}

	@RequestMapping(value = "mylist.do", method = RequestMethod.GET)
	public ModelAndView mylist(HttpSession session) {

		User user = (User) session.getAttribute("user");
		List<Reservation> list = rsvService.readMe(user.getUId());
		ModelAndView mav = new ModelAndView("views/reservation/reservationinfo");
		mav.addObject("Reservation", list);

		for(Reservation rsv : list) {
			System.out.println(rsv.toString());
		}
		
		return mav;
	}

	@RequestMapping(value = "pslist.do", method = RequestMethod.GET)
	public ModelAndView petsitterReservationLinst(HttpSession session) {

		System.out.println("快.");
		
		User user = (User) session.getAttribute("user");
		System.out.println("快.");
		
		List<Reservation> list = rsvService.psReservationList(user.getUId());
		
		System.out.println("快.");
		Petsitter ps = userService.selectSitter(user.getUId());
		System.out.println("快.");

		ModelAndView mav = new ModelAndView("views/reservation/petreservationinfo");
		mav.addObject("Reservation", list);
		mav.addObject("petsitter", ps);
	
		return mav;
	}

	@RequestMapping(value = "myread.do", method = RequestMethod.GET)
	public ModelAndView myread(int rId) {

		ModelAndView mav = new ModelAndView("views/reservation/petreservationdetail");
		
		mav.addObject("Reservation", rsvService.detail(rId));
		mav.addObject("psName", rsvService.psName(rId));

		mav.addObject("Reservation" );

 
		return mav;
	}
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public ModelAndView reservationDetail(int rId) {
		
		ModelAndView mav = new ModelAndView("views/reservation/reservationdetail");
		
		mav.addObject("Reservation", rsvService.detail(rId));
		mav.addObject("psName", rsvService.psName(rId));


 
		return mav;
	}
	@RequestMapping(value = "accept", method = RequestMethod.GET)
	public String reservationAccept(int rId) {
		
		rsvService.accept(rId);
		 
		return "redirect:/rsv/pslist.do";
	}
	@RequestMapping(value = "deny", method = RequestMethod.GET)
	public String reservationDeny(int rId) {
		 
		rsvService.deny(rId);
		
		return "redirect:/rsv/pslist.do";
	}
	@RequestMapping(value = "success", method = RequestMethod.GET)
	public String reservationSuccess(int rId) {
		 
		rsvService.success(rId);
		
		return "redirect:/rsv/pslist.do";
	}
	
	

}