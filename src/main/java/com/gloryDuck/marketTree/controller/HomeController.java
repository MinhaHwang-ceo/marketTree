package com.gloryDuck.marketTree.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HomeController {
	
	//index
	@GetMapping("/index")
	public String getIndex() {
	    return "index";
	}
	
	//403 denied page
	@PostMapping("/denied")
	public String getError() {
	    return "denied";
	}

}