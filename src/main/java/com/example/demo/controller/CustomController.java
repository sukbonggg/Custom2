package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/usr/member/")
public class CustomController {

	
	@GetMapping("login")
	public String ShowLogin() {
		return "/usr/member/login";
	}
	@GetMapping("join")
	public String ShowJoin() {
		return "/usr/member/join";
	}
	@GetMapping("test")
	public String ShowJ() {
		
		return "/usr/member/test";
	}
}
