<%@page import="java.text.SimpleDateFormat"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="util.FileUtil"%>
<%@ page import = "java.util.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>

<%
//추출할 전역 변수값 초기화
request.setCharacterEncoding("utf-8");

    String notice_no = request.getParameter("no");
    
    BoardAllDAO bo = new BoardAllDAO();
    
    if(  bo.notice_delet(notice_no) ){
		out.print("<script> alert('삭제완료');"
		        +"location.href='./noticeList.jsp'; </script>");
	}else{
		// 아니면 back
		out.print("<script>alert('삭제실패'); history.back(); </script>");
	}	
%>