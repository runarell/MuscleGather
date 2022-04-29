<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*"%>
<% request.setCharacterEncoding("UTF-8"); %>    
 
<%

String outLeng = request.getParameter("outLeng");
String pageNum = request.getParameter("startNum");

ArrayList<BoardsDTO> notice = (new BoardAllDAO()).askList(outLeng, pageNum);

%>   
    
 <div class="board_titel">
     <a href="">
         <h3>회원정보</h3>
     </a>
 </div>

 <div class="board titel">
     <div>번호</div>
     <div>제목</div>
     <div>조횟수</div>
     <div>날짜</div>
 </div>

 <% for(BoardsDTO bo : notice){ %>
<div class="board text" onclick="location.href='noticeInfo.jsp?no=<%=bo.getBoards_no() %>'">
    <div><%=bo.getBoards_no() %></div>
    <div><%=bo.getBoards_title() %></div>
    <div><%=bo.getView_cnt() %></div>
    <div><%=bo.getBoards_regdate() %></div>
</div>                            
<%}%>