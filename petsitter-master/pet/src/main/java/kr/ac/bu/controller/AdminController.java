package kr.ac.bu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.bu.domain.PetSitterList;

//

import kr.ac.bu.service.AdminService;

@Controller
@RequestMapping(value = "admin")
public class AdminController {

		@Autowired
		AdminService adminService;

		@RequestMapping(value = "list")
		public ModelAndView adminlist(HttpSession session) {

			List<PetSitterList> testList = adminService.psList();

			ModelAndView modelAndView = new ModelAndView("views/admin/reglist");
			modelAndView.addObject("petSitters", adminService.psList());

			return modelAndView;

		}
		
		@RequestMapping(value = "accept")
		public String petsitterAccept(HttpSession session, int psId) {
			System.out.println(psId);
			
			adminService.accept(psId);
			
			return "redirect:/admin/list";
		}
		
		@RequestMapping(value = "deny")
		public String petsitterDeny(HttpSession session, int psId) {

			adminService.deny(psId);

			return "redirect:/admin/list";
		}
}
