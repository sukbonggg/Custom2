package com.CusTomSoft.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.CusTomSoft.demo.service.BatchService;


@Controller
@EnableScheduling
@RequestMapping("/usr/member/")
public class BatchController {
	
	@Autowired
	private BatchService batchservice;

	@GetMapping("batch") // api 화면 메인 보여주기
	public String show() {
		System.out.println("dddd");
		batchservice.show();
		
		return "/usr/member/main";
	}
	
	
}
