package com.CusTomSoft.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.CusTomSoft.demo.dto.MemberDto;
import com.CusTomSoft.demo.service.MemberService;

@Controller
@RequestMapping("/usr/jqgrid/")
public class JqGridController {

	@Autowired
	private MemberService memberservice;
	
   	// json 형태로 데이터를 가져옴
   
	  // 데이터를 view에 매핑 // http://localhost:8180/test
	  
		@GetMapping("jqgrid")
		public String jqGrid(ModelAndView mav) {
			
			return "usr/jqgrid/jqgrid";
		}
	
	@RequestMapping(value = "jqgrid.do")
	@ResponseBody 
	public List<MemberDto> jqlist() {
		List<MemberDto> dataList = memberservice.getGrid();
		System.out.println("gggggggg"+dataList);
		
	
		return dataList;
	}

	
	
	 
	}