<%@page import="java.text.SimpleDateFormat"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="util.FileUtil"%>
<%@ page import = "java.util.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//추출할 전역 변수값 초기화
request.setCharacterEncoding("utf-8");

    String notice_no = null;
    String notice_title = null;
    String notice_content = null;
    byte[] notice_images = null;
    
    String file_name = null;
    
    ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
    List items = sfu.parseRequest(request);
    Iterator iter = items.iterator();
    
    //String 데이터와 이미지 데이터 구분 
    while(iter.hasNext()) {
        FileItem item = (FileItem) iter.next();  // multipart/form-data 형식 => 폼아이템으로 변경
        String name = item.getFieldName();		// 이름(key) 뽑기
               
        if(item.isFormField()) {  // 일반 파라미터인지 확인 
            String value = item.getString("UTF-8"); //이번에 요소 값을 String, utf-8 형식
            
            if (name.equals("notice_no")) notice_no = value;
            else if (name.equals("notice_title")) notice_title = value;
            else if (name.equals("notice_content")) notice_content = value;
        }
        else {
            if (name.equals("notice_images")) {
            	String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());  //현재시간
            	file_name = now+item.getName();
                notice_images = item.get();
                
                //서버에 사진 저장
                String root = application.getRealPath(java.io.File.separator);
               	out.print(" <script>console.log("+root+");</script>");
                FileUtil.saveImage(root, file_name, notice_images);  
			}
		}
	}

    //디비에 게시물 모든 정보 전달
    BoardAllDAO dao = new BoardAllDAO();
    if ( dao.notice_upload( new BoardDTO(notice_no, notice_title, notice_content, file_name )) ) {
    	response.sendRedirect("main.jsp");
    }
%>