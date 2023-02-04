package com.CusTomSoft.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CusTomSoft.demo.dto.MemberDto;
import com.CusTomSoft.demo.service.MemberService;

@Controller
@RequestMapping("/usr/member/")
public class MemberController {

	@Autowired
	private MemberService memberservice;
	
	@GetMapping("login")
	public String showLogin() {
		return "/usr/member/login";
	}
	
	@GetMapping("join")
	public String showJoin() {
		return "/usr/member/join";
	}
	
	
	//아이디 중복체크
	@PostMapping("idcheck")
	@ResponseBody
	public int idcheck( String custom_user_nick) {
		int cnt = memberservice.idcheck(custom_user_nick);
		return cnt;
		
	}
	
	//회원가입 
	@PostMapping("doJoin")
	@ResponseBody

	public String doJoin(@RequestBody MemberDto memberdto ) {
		System.out.println(memberdto);
		int success = memberservice.doJoin(memberdto);
		System.out.println("성공:" +success);
		return null;
		
	
		
		
	 }
}
