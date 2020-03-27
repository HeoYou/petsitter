package kr.ac.bu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.bu.service.logic.FileUploadService;

@Controller
public class FileUploadControllerTest {
	@Autowired
	FileUploadService fileUploadService;
	
	@RequestMapping( "/form" )
	public String form() {
		return "form";
	}
	
	@RequestMapping( "/upload" )
	public String upload(Model model, MultipartFile file1) {
		System.out.println("1");
		String url = fileUploadService.restore(file1);
		model.addAttribute("url", url);
		return "redirect:/main";
	}
}