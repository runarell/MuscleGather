<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*"%>
<% request.setCharacterEncoding("UTF-8"); %>


<% 

	String user_email = request.getParameter("user_email");
	String user_pw = request.getParameter("user_pw");
	
	UserDTO boards = ( new LoginDAO() ).login();
	String db_no = boards.getUser_no();
	String db_email = boards.getUser_email();
	String db_pw = boards.getUser_pw();
	
	if( user_email.equals( db_email ) &&  user_pw.equals( db_pw ) ){
		// 로그인 완료시 세션 삽입	
		//session.setMaxInactiveInterval(600);  // 시간 설정
		session.setAttribute("id", db_no);
		out.print("<script> alert('관리자 로그인 환영합니다.');"
		        +"location.href='./adminMain.jsp'; </script>");
	}else{
		// 아니면 back
		out.print("<script>alert('잘못 입력하셨습니다.'); history.back(); </script>");
	}	
	
%>
