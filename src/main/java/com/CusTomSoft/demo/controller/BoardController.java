package com.CusTomSoft.demo.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CusTomSoft.demo.dto.BoardDto;
import com.CusTomSoft.demo.dto.CommentDto;
import com.CusTomSoft.demo.page.Criteria;
import com.CusTomSoft.demo.page.Paging;
import com.CusTomSoft.demo.service.BoardService;

@Controller
@RequestMapping("/usr/board/")
public class BoardController {

	@Autowired
	private BoardService boardservice;
	private Paging paging;
	@Autowired
	 ServletContext context;
	

	@GetMapping("writeBoard")
	public String showBoard() {
		return "/usr/board/writeBoard";
	}
	//게시글 작성
	@PostMapping("writeBoard")
	public String writeBoard(BoardDto dto) throws Exception {
	      String board_img_path = null;

	     
		  File savefile = new File(context.getRealPath("/img/")+dto.getImgfile().getOriginalFilename());
		    try {
		         dto.getImgfile().transferTo(savefile);
		      } catch (Exception e) { 
		      }

	
		 board_img_path = dto.getImgfile().getOriginalFilename() ;
		 dto.setBoard_img_path(board_img_path);
		 System.out.println(dto.getBoard_img_path()+dto.getBoard_title());
		 
		 boardservice.writeBoard(dto);
		
		 return "redirect:listBoard";
	}
	// 게시물 리스팅
	// 게시물 검색기능 + 페이징 추가
	@GetMapping("listBoard")
	public String listBoard(Criteria cri,String searchKeyword, Model model) {
		
		  // 전체 글 개수
        int boardListCnt = boardservice.boardListCnt();
        
        // 페이징 객체
        Paging paging = new Paging();
        paging.setCri(cri);
        paging.setTotalCount(boardListCnt);    
		
        List<Map<String, Object>> listBoard = boardservice.listBoard(searchKeyword,cri);
        
		model.addAttribute("listBoard", listBoard);
		model.addAttribute("paging",paging);
 

		return "/usr/board/listBoard";
	}
	// 게시물 상세보기
	@GetMapping("detail")
	public String detail(@RequestParam("board_seq") int board_seq, Model model) {
		BoardDto detailBoard = boardservice.detail(board_seq);
		List<CommentDto> list =  boardservice.getCommentList(board_seq);
		model.addAttribute("detailBoard", detailBoard);
		model.addAttribute("comment", list);
		return "/usr/board/detail";
	}
	//게시물 삭제
	@PostMapping("removeCheckbox")
	@ResponseBody                        
	public String removeCheckbox(HttpServletRequest request) {
		String[] checkbox=request.getParameterValues("array");
		for(int i=0; i<checkbox.length; i++) {
			int result = boardservice.remove(checkbox[i]);
			System.out.println("삭제성공시1:"+result);
		}
		return "redirect:listBoard";
	}
	//글 수정 뷰페이지
	@GetMapping("modify")
	public String update(Model model ,int board_seq ) {		
		BoardDto boardDto = boardservice.update(board_seq);
		model.addAttribute("BoardDto", boardDto);
		return "/usr/board/modify";
	}
	//글 수정 
	@PostMapping("updateBoard")
	@ResponseBody                        
	public int updateBoard(BoardDto dto,@RequestParam Map<String,Object> map) {
		int result =boardservice.updateBoard(map);
		return result;
	}
	//글 수정 뷰페이지
	@GetMapping("wordle")
	public String wordle() {		
		
		return "/usr/board/wordle";
	}
	//게시글 작성
		@PostMapping("comment")
		public String comment(CommentDto dto) throws Exception {
				
			int result = boardservice.comment(dto);
			 System.out.println("댓글성공시:"+result);
			 return "redirect:/usr/board/detail?board_seq="+dto.getBoard_seq();
		}


}





