package com.springProject.subProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springProject.subProject.svc.ServiceCustomer;
import com.springProject.subProject.vo.PageInfo;
import com.springProject.subProject.vo.QnaVO;


@Controller
public class ControllerCustomer {
	
	@Autowired
	private ServiceCustomer service;
	
	// 글쓰기 폼
	@RequestMapping(value = "/customerCenter_write.cu", method = RequestMethod.GET)
	public String write() {
		return "customerCenter/qna_board_write";
	}
	// 글쓰기 로직
	@RequestMapping(value = "/customerCenter_write.cu", method = RequestMethod.POST)
	public String writePost(@ModelAttribute QnaVO qna, Model model) {
		int insertCount = service.writeBoard(qna);
		
		if (insertCount == 0) {
			model.addAttribute("msg", "글 등록 실패");
			return "main";
		}
		return "redirect:/customerCenter_list.cu";
	}
	// 글 목록
	@RequestMapping(value = "/customerCenter_list.cu", method = RequestMethod.GET)
	public String customer(@RequestParam(defaultValue = "") String searchType, @RequestParam(defaultValue ="") String keyword, @RequestParam(defaultValue = "1") int pageNum, Model model) {
		
	int listCount = service.getListCount(searchType, "%"+keyword+"%");
	int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수
	int pageLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
		
	// 페이징 처리를 위한 계산 작업
	int maxPage = (int)Math.ceil((double)listCount / listLimit);
	int startPage = ((int)((double)pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
	int endPage = startPage + pageLimit - 1;
		
	if(endPage > maxPage) {
		endPage = maxPage;
	}
		
	// 조회 시작 게시물 번호(행 번호) 계산
	int startRow = (pageNum - 1) * listLimit;
				
	// 페이징 처리 정보를 PageInfo 객체에 저장
	PageInfo pageInfo = new PageInfo();
	pageInfo.setPageNum(pageNum);
	pageInfo.setMaxPage(maxPage);
	pageInfo.setStartPage(startPage);
	pageInfo.setEndPage(endPage);
	pageInfo.setListCount(listCount);
	pageInfo.setStartRow(startRow);
	pageInfo.setListLimit(listLimit);
		
	// Service 객체의 getList() 메서드를 호출하여 게시물 목록 조회
	List<QnaVO> qnaList = service.getList(searchType, keyword, pageInfo);
				
	// Model 객체에 게시물 목록과 페이징 처리 정보 저장
	model.addAttribute("qnaList", qnaList);
	model.addAttribute("pageInfo", pageInfo);
		
	return "customerCenter/qna_board_list";
	
	}
	// 글 목록(검색)
	@RequestMapping(value = "/customerCenter_list.cu", method = RequestMethod.POST)
	public String listSearch(@RequestParam String searchType, @RequestParam String keyword, @RequestParam(defaultValue = "1") int pageNum, Model model) {
			
	int listCount = service.getListCount(searchType, "%" + keyword + "%");
	int listLimit = 10; // 한 페이지 당 표시할 게시물 목록 갯수
	int pageLimit = 10; // 한 페이지 당 표시할 페이지 목록 갯수
			
	// 페이징 처리를 위한 계산 작업
	int maxPage = (int)Math.ceil((double)listCount / listLimit);
	int startPage = ((int)((double)pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
	int endPage = startPage + pageLimit - 1;
			
	if(endPage > maxPage) {
		endPage = maxPage;
	}
			
	// 조회 시작 게시물 번호(행 번호) 계산
	int startRow = (pageNum - 1) * listLimit;
				
	// 페이징 처리 정보를 PageInfo 객체에 저장
	PageInfo pageInfo = new PageInfo();
	pageInfo.setPageNum(pageNum);
	pageInfo.setMaxPage(maxPage);
	pageInfo.setStartPage(startPage);
	pageInfo.setEndPage(endPage);
	pageInfo.setListCount(listCount);
	pageInfo.setStartRow(startRow);
	pageInfo.setListLimit(listLimit);
			
	// Service 객체의 getList() 메서드를 호출하여 게시물 목록 조회
	List<QnaVO> qnaList = service.getList(searchType, "%" + keyword + "%",pageInfo);
					
	// Model 객체에 게시물 목록과 페이징 처리 정보 저장
	model.addAttribute("qnaList", qnaList);
	model.addAttribute("pageInfo", pageInfo);
			
	model.addAttribute("searchType", searchType);
	model.addAttribute("keyword", keyword);
	
	return "customerCenter/qna_board_list";
		
	}
	// 4. 글 상세내용 조회 - GET
	@RequestMapping(value = "/customerCenter_detail.cu", method = RequestMethod.GET)
	public String detail(@RequestParam int qna_num, Model model) {
			
	// Service 객체의 getBoardDetail() 메서드를 호출하여 게시물 상세 정보 조회
	// => 파라미터 : 글번호(board_num), 리턴타입 : BoardVO(board)
	QnaVO qna = service.getDetail(qna_num);
			
	model.addAttribute("qna", qna);
			
	return "customerCenter/qna_board_view";
	
	}
	// 글 삭제 폼
	@RequestMapping(value = "/customerCenter_delete.cu", method = RequestMethod.GET)
	public String delete() {
		return "/customerCenter/qna_board_delete";
	}
	// 글 삭제 로직
	@RequestMapping(value = "/customerCenter_delete.cu", method = RequestMethod.POST)
	public String deletePost(@ModelAttribute QnaVO qna, @RequestParam int page, Model model) {

	int deleteCount = service.removeBoard(qna);
			
	if (deleteCount == 0) {
		model.addAttribute("msg", "글 삭제 실패");
		return "main";
	}
		model.addAttribute("page", page);
		return "redirect:/customerCenter_list.cu";
	}
	// 글 수정 폼
	@RequestMapping(value = "/customerCenter_modify.cu", method = RequestMethod.GET)
	public String modify(@RequestParam int qna_num, @RequestParam int page, Model model) {
		QnaVO qna = service.getDetail(qna_num);
		model.addAttribute("qna", qna);
		return "/customerCenter/qna_board_modify";
	}
	// 글 수정 로직
	@RequestMapping(value = "/customerCenter_modify.cu", method = RequestMethod.POST)
	public String modifyPost(@ModelAttribute QnaVO qna, @RequestParam int page, Model model) {
			
	int modifyCount = service.modifyBoard(qna);
	if (modifyCount == 0) {
		model.addAttribute("msg", "글수정 실패");
		return "main";
	}
		model.addAttribute("qna_num", qna.getQna_num());
		model.addAttribute("page", page);
				
		return "redirect:/customerCenter_detail.cu";
		
	}
	// 답글 폼
	@RequestMapping(value = "/customerCenter_reply.cu", method = RequestMethod.GET)
	public String reply(@RequestParam int qna_num, @RequestParam int page, Model model) {
		QnaVO qna = service.getDetail(qna_num);
		model.addAttribute("qna", qna);
		return "/customerCenter/qna_board_reply";
	}
	// 답글 로직
	@RequestMapping(value = "/customerCenter_reply.cu", method = RequestMethod.POST)
	public String replyPost(@ModelAttribute QnaVO qna, @RequestParam int page ,Model model) {
		int insertCount = service.writeReplyBoard(qna);
		if(insertCount == 0) {
			model.addAttribute("msg", "답글 실패");
			return "main";
		}
		model.addAttribute("page", page);
		return "redirect:/customerCenter_list.cu";
	}
}
