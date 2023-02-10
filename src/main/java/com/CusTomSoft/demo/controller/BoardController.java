package com.CusTomSoft.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CusTomSoft.demo.dto.BoardDto;
import com.CusTomSoft.demo.service.BoardService;

@Controller
@RequestMapping("/usr/board/")
public class BoardController {
	
	@Autowired
	private BoardService boardservice;
	
	
	@GetMapping("writeBoard")
	public String showBoard() {
		return "/usr/board/writeBoard";
	}
	
	
	//게시물 작성
	@PostMapping("writeBoard")
	@ResponseBody
	public  String writeBoard(Model model, HttpServletRequest request) throws Exception {
		
		BoardDto dto = new BoardDto();
		dto.setBoard_text(request.getParameter("board_text"));
		dto.setBoard_title(request.getParameter("board_title"));
		dto.setBoard_writer(request.getParameter("board_writer"));
		
		 System.out.println(dto);
		if(boardservice.writeBoard(dto) ==1 ) {
			return "true";
		}else {
			return "false";
		}
	}
	//게시물 리스팅
	//게시물 검색기능
	 @GetMapping("listBoard")
     public String listBoard(String searchKeyword, Model model) {
         List<BoardDto> listBoard = boardservice.listBoard(searchKeyword);
         model.addAttribute("listBoard", listBoard);
         return "/usr/board/listBoard";
     }
}
