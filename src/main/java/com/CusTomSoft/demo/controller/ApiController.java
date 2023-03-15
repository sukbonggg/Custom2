package com.CusTomSoft.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CusTomSoft.demo.dto.ApiDto;
import com.CusTomSoft.demo.service.ApiService;

@Controller
@RequestMapping("/usr/api/")
public class ApiController {

	@Autowired
	private ApiService apiservice;

	@GetMapping("api") // api 화면 메인 보여주기
	public String show() {
		return "/usr/api/api";
	}

	   @RequestMapping(value ="chinese",produces = "application/text; charset=UTF-8" )
	   @ResponseBody
		public String Chinese(
				/* @RequestParam(value = "korean", defaultValue = "-") */String korean, // ajax 중국어 번역 기능 
	                           Model model) throws Exception{      
	      ApiDto dd = new ApiDto(); // dto에는 한국어, 영어, 중국어 
	      dd.setKorean(korean);      
	      
	      String china = apiservice.getChinese(dd); // 서비스 끝 
	      System.out.println(china);
	      String result; 
	      result = china;
	      
	      return result;
	   }
	   
	   @RequestMapping("english" )
	   @ResponseBody
	   public String English(@RequestParam(value = "korean", defaultValue = "-")String korean, // ajax 영어 번역 기능 
	                           Model model) throws Exception{      
	      ApiDto tt = new ApiDto(); // dto에는 한국어, 영어, 중국어 
	      tt.setKorean(korean);      
	      System.out.println(korean);
	      String eng = apiservice.getEnglish(tt); // 서비스 끝 
	      System.out.println(eng);
	     
	     
	      String result; 
	      result = eng;
	      System.out.println(result);
	      return result;
	   }


	}

