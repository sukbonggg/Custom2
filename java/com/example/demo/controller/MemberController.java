package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CusTomSoft.service.MemberService;



@Controller
@RequestMapping("/usr/member/")
public class MemberController {


	
	@RequestMapping("login")
	public String ShowLogin() {
		return "/usr/member/login";
	}
	@RequestMapping("join")
	public String ShowJoin() {
		return "/usr/member/join";
	}
	@RequestMapping(value="idcheck",method = {RequestMethod.POST})
	@ResponseBody
	public int dojoin(@RequestBody String custom_user_nick) {
		int cnt =MemberService.idcheck(custom_user_nick);
		return cnt;
		
	}
}
