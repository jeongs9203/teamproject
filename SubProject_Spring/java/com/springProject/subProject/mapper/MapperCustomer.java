package com.springProject.subProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.springProject.subProject.vo.PageInfo;
import com.springProject.subProject.vo.QnaVO;

public interface MapperCustomer {

	// 글번호 조회
	public Integer selectMaxNum();

	// 글쓰기
	public int insertBoard(QnaVO qna);

	//  총 게시물 수 조회
	public int selectListCount(@Param("searchType") String searchType, @Param("keyword") String keyword);

	//  게시물 목록 조회
	public List<QnaVO> selectList(@Param("searchType") String searchType, @Param("keyword") String keyword, @Param("pageInfo") PageInfo pageInfo);
	
	//  글 상세내용 조회
	public QnaVO selectDetail(int qna_num);
	
	// 글 삭제
	public int deleteBoard(QnaVO qna);

	// 글 수정
	public int updateBoard(QnaVO qna);

	// 답글
	public void updateBoardReSeq(QnaVO qna);
}
