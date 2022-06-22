package com.springProject.subProject.mail;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

// 메일 서버 인증을 위해 javax.mail.Authenticator 클래스를 상속받는 서브클래스 정의
public class GoogleSMTPAuthenticator extends Authenticator {
	// 인증 정보 아이디 패스워드를 관리할 javax.mail.passwordAuthentication 클래스타입 변수선언
	PasswordAuthentication passwordAuthentication;
	
	public GoogleSMTPAuthenticator() throws Exception{
		// 인증에 사용할 아이디와 패스워드 정보를 갖는 passwordAuthentication 객체 생성
		// 구글 2단계 인증을 사용하지 않는경우 계정명 로그인패스워드 전달
		// 구글 2단계 인증을 사용하는 경우 별도의 부가 작업 필요
		// gmail 의 경우 앱 비밀번호를 별도로 발급받아 패스워드 부분에 입력
		// passwordAuthentication = new PasswordAuthentication("계정명", "비밀번호");
		Properties properties = new Properties();
		
	}
	
	// request 객체를 파라미터로 전달받는 GoogleSMTPAuthenticator 생성자 정의
	public GoogleSMTPAuthenticator(HttpServletRequest request) throws FileNotFoundException, IOException {
		// 아이디 패스워드를 하드코딩하지않고 외부파일로부터 읽어들여 사용할 경우
		// java.util.properties 클래스 활용
		// 1. properties 객체 생성
		Properties properties = new Properties();
		
		// 2. Properties 객체의 load 메서드를 호출하여 외부 파일 읽어오기
		// 아이디와 패스워드가 저장된 외부파일 application-data.properties 읽어오기
		// 파라미터로 FileReader 객체 생성하여 파일이 위치한 경로를 전달
		// 단 파일이 위치한 폴더는 가상의 경로이므로 실제 경로를 알아내야한다
		// 2-1 WEB-INF 실제 경로 알아내기
		ServletContext context = request.getSession().getServletContext(); // 톰캣 객체 가져오기
		String realPath = context.getRealPath("WEB-INF"); // 루트 기준 WEB-INF 폴더의 실제 경로 알아보기
		// D:\workspace_jsp3\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\StudyJSP\WEB-INF
//		System.out.println(realPath);
		properties.load(new FileReader(realPath + "/application-data.properties"));
		
		// 3. 읽어들인 파일로부터 원하는 키를 사용하여 데이터가져오기
		// properties 객체의 getProperty 메서드를 호출하여 키 를 파라미터로 전달
		String id = properties.getProperty("id");
		String passwd = properties.getProperty("passwd");
		
		passwordAuthentication = new PasswordAuthentication(id, passwd);
	}
	// 인증 정보를 외부로 리턴하는 GetPasswordAuthentication 메서드 정의 - 오버라이딩
	// 주의 변수명이 달라질수있으므로 Getter 메서드를 정의하는 것은 좋지않다
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return passwordAuthentication;
	}

	
}
