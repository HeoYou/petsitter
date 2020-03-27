package kr.ac.bu.controller;
 
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.bu.domain.PetSitterList;
import kr.ac.bu.domain.Petsitter;
import kr.ac.bu.domain.Review;
import kr.ac.bu.service.PetsearchService;
import kr.ac.bu.service.PetsitterService;
import kr.ac.bu.store.ReviewStore;
 
@Controller
@RequestMapping(value = "petsitter")
public class PetSitterController {

	@Autowired
	PetsitterService psService;
	
	@Autowired
	ReviewStore rvStore;
	
	@Autowired
	PetsearchService psearchService;

	@RequestMapping(value = "list")
	public ModelAndView information(HttpSession session) {
		System.out.println("controller");

		List<PetSitterList> testList = psService.psList();

		ModelAndView modelAndView = new ModelAndView("views/petsitter/petsitters");
		modelAndView.addObject("petSitters", psService.psList());

		return modelAndView;

	}

	@RequestMapping(value = "list2")
	public ModelAndView petsitterRecognition(HttpSession session) {
		System.out.println("controller");

		List<PetSitterList> testList = psService.psList2();

		ModelAndView modelAndView = new ModelAndView("views/petsitter/petsitterRecognition");
		modelAndView.addObject("petSitters", psService.psList2());

		return modelAndView;

	}
	
	@RequestMapping(value = "detail")
	public ModelAndView petSitterDetail(HttpSession session, @RequestParam("psId") int psId) {

		Petsitter petsitter = psService.petsitter(psId);
		
		int complete = psService.rvCplt(psId);
		
		
		ModelAndView modelAndView = new ModelAndView("views/petsitter/div");
		modelAndView.addObject("reviews", rvStore.rvList(psId));
		System.out.println(rvStore.rvList(psId).toString());
		modelAndView.addObject("complete", complete);
		modelAndView.addObject("petsitter", petsitter);
		modelAndView.addObject("images", psService.images(psId));
		modelAndView.addObject("petsitterName", psService.petsitterName(psId));
		
		System.out.println(petsitter.toString());

		return modelAndView;

	}

	@RequestMapping(value = "myread2.do", method = RequestMethod.GET)
	public ModelAndView myread2(int psId) {

		ModelAndView mav = new ModelAndView("views/petsitter/petsitterRecDetail");
		
		mav.addObject("petSitters", psService.detail(psId));
//		mav.addObject("psName", psService.psName(psId));

		mav.addObject("petSitters" );

 
		return mav;
	}
	
	// 서취... 서취...
	@RequestMapping(value = "search")
	public ModelAndView Petsearch(HttpSession session, boolean psOption10) {
		System.out.println("search.. ");
		List<PetSitterList> psearchList = psearchService.PetsearchList(psOption10);
		
		
		ModelAndView modelAndView = new ModelAndView("views/petsitter/petsitters");
		modelAndView.addObject("petSitters", psearchList);
		System.out.println("검색");
		return modelAndView;
	}

	@RequestMapping("findByName.do")
	public ModelAndView searchByName(@RequestParam("sName") String sName) {
		
		
		List<PetSitterList> list = psService.findByName(sName);
		
		ModelAndView modelAndView = new ModelAndView("views/petsitter/petsitters");
		modelAndView.addObject("petSitters", list);
		
		return modelAndView;
	}
	 
	@RequestMapping("findByAddress.do")
	public ModelAndView searchByAddress(@RequestParam("sAddress") String sAddress) {
		
		
		List<PetSitterList> list = psService.findByAddress(sAddress);
		
		ModelAndView modelAndView = new ModelAndView("views/petsitter/petsitters");
		modelAndView.addObject("petSitters", list);
		
		return modelAndView;
	}
	
	@RequestMapping("findByPrice.do")
	public ModelAndView searchByPrice(@RequestParam("sPrice") int sPrice, @RequestParam("minPrice") int minPrice, @RequestParam("maxPrice") int maxPrice) {
		
		
		List<PetSitterList> list = psService.findByPrice(sPrice, minPrice, maxPrice);
		
		ModelAndView modelAndView = new ModelAndView("views/petsitter/petsitters");
		modelAndView.addObject("petSitters", list);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "accept1", method = RequestMethod.GET)
	public String petsitterAccept(int psId) {
		
		psService.accept1(psId);
		 
		return "redirect:/petsitter/list2";
	}
	@RequestMapping(value = "deny1", method = RequestMethod.GET)
	public String petsitterDeny(int psId) {
		 
		psService.deny1(psId);
		
		return "redirect:/petsitter/list2";
	}
	
}
