<%@page import="org.springframework.stereotype.Service"%>
<%@page import="com.springProject.subProject.svc.ServiceMember"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.springProject.subProject.mapper.MemberMapper"%>
<%@page import="com.springProject.subProject.mail.GoogleSMTPAuthenticator"%>
<%@page import="com.springProject.subProject.mail.GenerateAuthenticationCode"%>
<%@page import="javax.mail.Transport"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.Message.RecipientType"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

// 50자리 인증코드를 생성하여 가입 시 입력한 메일 주소로 인증 코드 발송
request.setCharacterEncoding("UTF-8");

// URL 을 통해 전달받은 아이디(id), 이메일 주소(email) 가져와서 변수에 저장
String mem_id = request.getParameter("mem_id");
String mem_email = request.getParameter("mem_email");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="font-family: 'Apple SD Gothic Neo', 'sans-serif' !important; width: 540px; height: 600px; border-top: 4px solid #FF4500; margin: 100px auto; padding: 30px 0; box-sizing: border-box; margin-top: 15em;">
		<h1 style="margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;">
			<span style="font-size: 15px; margin: 0 0 10px 3px;">subscribeProject</span><br />
			<span style="color: #FF4500;">메일인증</span> 안내입니다.
		</h1>
		<p style="font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;">
			안녕하세요.<br />
			subscribeProject에 가입해 주셔서 진심으로 감사드립니다.<br />
			아래 <b style="color: #FF4500;">'메일 인증'</b> 버튼을 클릭하여 회원가입을 완료해 주세요.<br />
			감사합니다.
		</p>
		<a style="color: #FFFFFF; text-decoration: none; text-align: center;" href="mem_sendmail.me?mem_id=<%=mem_id %>&mem_email=<%=mem_email%>" target="_blank">
			<p style="display: inline-block; width: 210px; height: 45px; margin: 30px 5px 40px; background: #FF4500; line-height: 45px; vertical-align: middle; font-size: 16px;">메일 인증</p>
		</a>
		<div style="border-top: 1px solid #DDD; padding: 5px;">
			<p style="font-size: 13px; line-height: 21px; color: #555;">
				만약 버튼이 정상적으로 클릭되지 않는다면, 아래 링크를 복사하여 접속해 주세요.<br />
				http://localhost:8080/subProject/member_authentication.me?mem_id=<%=mem_id %>
			</p>
		</div>
	</div>
</body>
</html>