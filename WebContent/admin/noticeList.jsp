<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*"%>

<% request.setCharacterEncoding("UTF-8"); %>    
 
<%
	ArrayList<BoardsDTO> notice = (new BoardAllDAO()).notice_board(0);
%>
<!DOCTYPE html>
<html lang="kr">

<head> 
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>
    <link type="text/css" rel="stylesheet" href="../css/default.css" />
    <link type="text/css" rel="stylesheet" href="../css/adminMain.css" />

    <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../js/default.js"></script>
    <style>

    </style>
</head>

<body>
    <div class="wrap">
        <!-- header-->
        <header id="admheader">

        </header>

        <!-- hidden nav-->
        <nav id="nav"></nav>

        <main>
            <div class="mainWrap">
                <section class="sec1">
                    <!-- 컨탠츠 구역 -->
                    <!-- ========================================================= -->
                    <!-- tkdeks  -->
                    <div class="option">
                        <form action="" method="">
                            <div class="formCell">
                                <div>
                                    <select>
                                        <option>리스트출력</option>
                                        <option value="10">10</option>
                                        <option value="50">50</option>
                                    </select>
                                </div>

                                <div>
                                    <input type="text" class="" placeholder="검색">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="mainboard bd3">
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
                        
                    </div>
                    <div class="pagingBox">
                        <div data-page="1">1</div>
                        <div data-page="2">2</div>
                        <div data-page="3">3</div>
                        <div data-page="4">4</div>
                        <div data-page="5">5</div>
                    </div>
                    <!-- ========================================================= -->
                </section>

            </div>
        </main>

        <footer id="footer">

        </footer>

        <!-- side butten -->
        <article id="sideBtn">
            <div class="sideLinkWrap">
                <label id="" for="">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </label>
            </div>
        </article>
    </div>
</body> </html>