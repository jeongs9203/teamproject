package com.springProject.subProject.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springProject.subProject.mapper.MapperCustomer;
import com.springProject.subProject.vo.PageInfo;
import com.springProject.subProject.vo.QnaVO;


@Service
public class ServiceCustomer {

	@Autowired
	private MapperCustomer mapper;
	
	// 글쓰기
	public int writeBoard(QnaVO qna) {
		
		Integer num = mapper.selectMaxNum();
		
		if(num == null) {
			num = 1;
		} else {
			num += 1;
		}
		qna.setQna_num(num);
		// 참조글번호(board_re_ref) 는 새 글이므로 새 글 번호와 동일하게 설정
		qna.setQna_re_ref(num);
		
		// 들여쓰기레벨(board_re_lev), 순서번호(board_re_seq), 조회수(readcount)는 0으로 설정
		qna.setQna_re_lev(0);
		qna.setQna_re_seq(0);
		// 날짜는 시스템의 현재 시각 사용 => 웹서버의 시각 대신 DB 서버의 시각은 now() 함수 활용
		
		return mapper.insertBoard(qna);
	}
	public int getListCount(String searchType, String keyword) {
		return mapper.selectListCount(searchType, keyword);
	}

	public List<QnaVO> getList(String searchType, String keyword, PageInfo pageInfo) {
		return mapper.selectList(searchType, keyword, pageInfo);
	}

	// 5. 글 상세내용 조회
	public QnaVO getDetail(int qna_num) {
		return mapper.selectDetail(qna_num);
	}
	public int removeBoard(QnaVO qna) {
		return mapper.deleteBoard(qna);
	}

	public int modifyBoard(QnaVO qna) {
		return mapper.updateBoard(qna);
	}
	
	public int writeReplyBoard(QnaVO qna) {
		// 기존 원본글에 대한 답글 존재시 순서번호 조정을 위해 updateBoardReSeq 
		mapper.updateBoardReSeq(qna);
//		-----------------------------------------------------------
		Integer num = mapper.selectMaxNum();
		
		if(num == null) {
			num = 1;
		} else {
			num += 1;
		}
//		----------------------------------------------------------
		qna.setQna_num(num);
		qna.setQna_re_ref(qna.getQna_re_ref());
		qna.setQna_re_lev(qna.getQna_re_lev()+1);
		qna.setQna_re_seq(qna.getQna_re_seq()+1);
		return mapper.insertBoard(qna);
	}
}
