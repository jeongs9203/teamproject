package com.springProject.subProject.vo;

// 페이징 처리 관련 정보를 저장하는 클래스
public class PageInfo {
	private int pageNum; // 현재 페이지 번호
	private int maxPage; // 최대 페이지 수
	private int startPage; // 시작 페이지 번호
	private int endPage; // 끝 페이지 번호
	private int listCount; // 총 게시물 수
	private int startRow; // 조회 시작 행 번호
	private int listLimit; // 페이지 당 게시물 수
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getListCount() {
		return listCount;
	}
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getListLimit() {
		return listLimit;
	}
	public void setListLimit(int listLimit) {
		this.listLimit = listLimit;
	}
	public PageInfo() {}
	public PageInfo(int pageNum, int maxPage, int startPage, int endPage, int listCount, int startRow, int listLimit) {
		this.pageNum = pageNum;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.listCount = listCount;
		this.startRow = startRow;
		this.listLimit = listLimit;
	}
	
}
