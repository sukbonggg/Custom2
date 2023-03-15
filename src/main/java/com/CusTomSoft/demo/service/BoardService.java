package com.CusTomSoft.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CusTomSoft.demo.dto.BoardDto;
import com.CusTomSoft.demo.dto.CommentDto;
import com.CusTomSoft.demo.mapper.BoardMapper;
import com.CusTomSoft.demo.page.Criteria;

@Service
public class BoardService {
	@Autowired
	private BoardMapper boardmapper;
	//게시물 작성
	public int writeBoard(BoardDto dto) {
		
		return boardmapper.writeBoard(dto);
	}
	//전체 글 갯수
		public int boardListCnt() {
			return boardmapper.boardListCnt();
		}
	//게시물 리스트 ,검색기능
	public List<Map<String, Object>> listBoard(String searchKeyword, Criteria cri) {
		return  boardmapper.listBoard(searchKeyword,cri);
	}
	//게시물 상세보기
	public  BoardDto detail(int board_seq) {
		return  boardmapper.detail(board_seq);
	}
	//게시글 삭제
	public int remove(String board_seq) {
		return  boardmapper.remove(board_seq);
	}
	//게시글 수정 뷰페이지
	public BoardDto update(int board_seq) {
		return boardmapper.update(board_seq);
	}
	//게시글 수정
	public int updateBoard(Map<String, Object> map) {
		return boardmapper.updateBoard(map);
	}

	public List<CommentDto> getCommentList(int board_seq) {

		return  boardmapper.getCommentList(board_seq); 
	}
	public int comment(CommentDto dto) {
		
		return  boardmapper.comment(dto); 
	}

	


}