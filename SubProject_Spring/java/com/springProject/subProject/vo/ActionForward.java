package com.springProject.subProject.vo;

/*
 * frontController 에서 요청을 받아 Action 클래스 등에서 작업 처리 등을 수행한 후 view 페이지 또는 다른 서블릿 주소를 요청
 */
public class ActionForward {
	private String path;				//포워딩 주소
	private boolean isRedirect;			//포워딩 방식 저장 t : redirect f : dispatcher
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	
	
}
