package com.CusTomSoft.demo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.CusTomSoft.demo.dto.BoardDto;
import com.CusTomSoft.demo.dto.CommentDto;
import com.CusTomSoft.demo.page.Criteria;

@Mapper
public interface BoardMapper {
	//글 작성
	int writeBoard(BoardDto dto);
	//게시글 갯수
	int boardListCnt();
	//글 목록 //게시글 페이징
	List<Map<String, Object>> listBoard(@Param("searchKeyword")String searchKeyword, @Param("Criteria")Criteria cri);
	//글 상세
	BoardDto detail(int board_seq);
	//글 삭제
	int remove(String board_seq);
	//글 수정 뷰페이지
	BoardDto update(int board_seq);
	//글 수정
	int updateBoard(Map<String, Object> map);
	//댓글 작성
	int comment(CommentDto dto);
	
	List<CommentDto> getCommentList(int board_seq);
	
	int heart(@Param("custom_user_nick") String custom_user_nick, @Param("board_seq")int board_seq);
	
	int findLike(@Param("custom_user_nick")  String custom_user_nick, @Param("board_seq")   int board_seq);

}
